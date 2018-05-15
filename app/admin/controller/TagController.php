<?php
/**
 * 标签（适用于所有一级分类）
 * User: Administrator
 * Date: 2018/5/5/005
 * Time: 20:45
 */

namespace app\admin\controller;


use app\lib\Tag\AddTag;
use app\lib\Tag\ChangeStatusTag;
use app\lib\Tag\DelTag;
use app\lib\Tag\EditTag;
use app\lib\Tag\FindTagInfo;
use app\lib\Tag\GetTagList;
use cmf\controller\AdminBaseController;
use think\Db;

class TagController extends AdminBaseController
{
    protected $table;
    protected function index($type=''){
        if(empty($type)){
            exception('缺少标签参数');
        }
        $map['tagType'] = $type;
        $map['tagStatus'] = 1;
        $list = $this->getTable()->where($map)->select();
        (new GetTagList($type))->setKeyword()->setStatus($this->publicStatus)->getList();
        $this->assign('list',$list);
        return $this->fetch();
    }

    protected function add($type){
        if($this->request->isPost()){
            $this->submitPost($type);
            $this->success('操作成功');
        }else{
            return $this->fetch('tag/add');
        }
    }


    public function changeStatus(){
        if($this->request->isPost()){
            try{
                $data = I('post.');
                $data['status'] = $this->publicStatus[$data['statusStr']];
                Db::startTrans(function ($data){
                    $type = 'changeStatus';
                    $oldData = json_encode((new FindTagInfo($data['id']))->getInfo());
                    (new ChangeStatusTag($data['id'],$data['status']))->save();
                    $this->updateUserHandleLog($data, $oldData, $type, $data['id']);
                    return true;
                });
                return true;
            }catch (\Exception $e){

            }
        }
    }

    public function del(){
        if($this->request->isPost()){
            try{
                $data = I('post.');
                $data['status'] = $this->publicStatus[$data['statusStr']];
                Db::startTrans(function ($data){
                    $type = 'del';
                    $oldData = json_encode((new FindTagInfo($data['id']))->getInfo());
                    (new DelTag($data['id']))->save();
                    $this->updateUserHandleLog($data, $oldData, $type, $data['id']);
                    return true;
                });
                return true;
            }catch (\Exception $e){

            }
        }
    }

    protected function edit($type){
        if($this->request->isPost()){
            $this->submitPost($type);
        }else{
            return $this->fetch('tag/add');
        }
    }

    private function submitPost($type){
        try{
            $data = input('post.');
            $data['status'] = $this->publicStatus['正常'];
            $data['type'] = $type;
            Db::transaction(function()use($data){
                if (empty($data['type'])) {
                    exception('缺少标签参数');
                }
                $type = 'add';
                $oldData = '';
                if(!isset($data['id'])){
                    $result = (new AddTag($this->loginId))->setTagName($data['tagName'])
                        ->setTagStatus($data['status'])
                        ->setTagType($data['type'])->setTagUrl($data['more']['thumbnail'])->save();
                }else{
                    $oldData = json_encode((new FindTagInfo($data['id']))->getInfo());
                    $type = 'edit';
                    $result = (new EditTag($this->loginId))->setTagName($data['tagName'])
                        ->setTagStatus($data['status'])->setTagUrl($data['id'])
                        ->setTagType($data['type'])->setTagUrl($data['more']['thumbnail'])->save();
                }
                /*操作日志*/
                $this->updateUserHandleLog($data, $oldData, $type, $result);
                return true;
            });
        }catch (\Exception $e){
             $this->error($e->getMessage());
        }
    }




}