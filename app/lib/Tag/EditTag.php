<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018\5\11 0011
 * Time: 13:57
 */

namespace app\lib\Tag;


use think\Validate;

class EditTag extends OperatingTagBase
{
    protected $id;

    public function setId($id){
        $this->id =  $id;
        return $this;
    }

    protected function checkData($data){
        $rule =  $this->rule;
        $msg  =  $this->msg;
        $rule['updateId'] = 'require|integer';
        $rule['updateTime'] = 'require|integer';
        $rule['id'] = 'require|integer';
        $msg['updateId.require'] = '未获取到修改人信息';
        $msg['updateId.integer'] = '修改人类型参数错误';
        $msg['updateTime.require'] = '未获取到修改时间';
        $msg['updateTime.integer'] = '修改时间类型错误';
        $msg['id.integer'] = '修改id类型错误';
        $msg['id.require'] = '未获取到修改id';
        $validate = new Validate($rule,$msg);
        if(!$validate->check($data)){
            exception($validate->getError());
        }
        return true;
    }

    public function save(){
        $data['tagName'] = $this->tagName;
        $data['updateTime'] = $this->opTime;
        $data['updateId'] = $this->opUid;
        $data['tagId'] = $this->getTagId();
        $data['tagStatus'] = $this->tagStatus;
        $data['tagType'] = $this->tagType;
        $data['id'] = $this->id;
        $this->getCheckRule();
        $this->checkData($data);
        $result = $this->getTable()->update($data);
        if(!$result){
            exception('修改失败');
        }
        return $this->id;

    }
}