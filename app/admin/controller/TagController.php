<?php
/**
 * 标签（适用于所有一级分类）
 * User: Administrator
 * Date: 2018/5/5/005
 * Time: 20:45
 */

namespace app\admin\controller;


use app\model\TagModel;
use cmf\controller\AdminBaseController;

class TagController extends AdminBaseController
{
    protected $table;
    protected function getTable(){
        if(!isset($this->table)){
            $this->table = new TagModel();
        }
        return $this->table;
    }
    protected function Index($type=''){
        if(empty($type)){
            exception('缺少标签参数');
        }
        $map['tagType'] = $type;
        $map['tagStatus'] = 1;
        $list = $this->getTable()->where($map)->select();
        $this->assign('list',$list);
        return $this->fetch();
    }

    public function add($type){
        if($this->request->isPost()){
            if(empty($type)){
                exception('缺少标签参数');
            }
            $data = input('post.');
            $data['tagType'] = $type;
            $result = $this->getTable()->insert($data);
            if(!$result){
                exception('标签添加失败');
            }
            return true;
        }else{
            return $this->fetch('tag/add');
        }
    }

    public function edit(){

    }

    public function changStatus(){

    }

    public function del(){

    }
}