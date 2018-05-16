<?php
/**
 * Created by PhpStorm.
 * User: wangcx
 * Date: 18-4-7
 * Time: 下午1:28
 */

namespace app\admin\controller;


use app\lib\ReadConfig\HandleLog;
use app\lib\User\UserHandleLog\UserHandleLogList;
use cmf\controller\AdminBaseController;

class HandleLogController extends AdminBaseController
{
    protected $handleLogList = ['keywordType'=>'', 'keyword'=>'', 'startTime'=>'', 'endTime'=>'', 'type'=>''];
    protected $keywordType = ['userLogin'=>['name'=>'操作账号','class'=>''],'opController'=>['name'=>'操作控制器','class'=>''],'opAction'=>['name'=>'操作方法','class'=>''],];
    protected   $typeArray = ['access'=>['name'=>'访问','class'=>''], 'changeStatus'=>['name'=>'状态修改','class'=>''], 'add'=>['name'=>'添加','class'=>''], 'del'=>['name'=>'删除','class'=>''] , 'edit'=>['name'=>'修改','class'=>''],];

    public function index(){
        $path =   APP_PATH.'admin/controller';
        $result =  (new HandleLog($path))->save();
        $this->assign('result',$result);
        return $this->fetch();
    }


    public function save(){
        if($this->request->isPost()){
            try{
                $post = input('post.');
                if(!empty($post)){
                    $this->updateUserHandleLog($post,'','edit');
                }
                $data = $post['data'];
                $result=  (new \app\lib\WritingConfig\HandleLog())
                    ->setPost($data)->setFileName('handleLog.php')
                    ->setPath(CMF_ROOT.'data/conf')->save();
                if(!$result){
                    exception('日志配置修改失败');
                }
            }catch (\Exception $e){
                $this->error($e->getMessage());
            }
            $this->success('操作成功');
        }else{
            $this->error('禁止访问',Url('index'));
        }
    }

    /**
     *  后台用户的操作日志
     */
    public function handleLogList(){
        $post = input('param.');
        if(!empty($post)){
            $this->updateUserHandleLog($post);
        }
        $post = $this->checkPost($post,$this->handleLogList);
        $model =   (new UserHandleLogList());
        $typeArray = $this->typeArray;
        $keywordType = $this->keywordType;
        if(!empty($post)){
           $model->setKeyword($post);
           if($post['type']){
               $typeArray[$post['type']]['class'] = 'selected';
           }
           if($post['keywordType']){
               $keywordType[$post['keywordType']]['class'] = 'selected';
           }
        }
        $result =  $model->getList();
        $this->assign('data',$post);
        $this->assign('type',$typeArray);
        $this->assign('keywordType',$keywordType);
        $this->assign("page", $result['page']);
        $this->assign("list", $result['list']);
        return $this->fetch('handle_log/handleLogList');
    }
}