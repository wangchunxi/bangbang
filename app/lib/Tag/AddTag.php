<?php
/**
 * 标签添加
 * User: Administrator
 * Date: 2018\5\10 0010
 * Time: 11:14
 */
namespace app\lib\Tag;
use think\Validate;

class AddTag extends OperatingTagBase
{
    protected function checkData($data){
        $rule =  $this->rule;
        $msg  =  $this->msg;
        $rule['createId'] = 'require|integer';
        $rule['createTime'] = 'require|integer';
        $msg['createId.require'] = '未获取到创建人信息';
        $msg['createId.integer'] = '创建人类型参数错误';
        $msg['createTime.require'] = '未获取到创建时间';
        $msg['createTime.integer'] = '创建时间类型错误';
        $validate = new Validate($rule,$msg);
        if(!$validate->check($data)){
            exception($validate->getError());
        }
        return true;
    }
    public function save(){
        $data['tagName'] = $this->tagName;
        $data['createTime'] = $this->opTime;
        $data['createId'] = $this->opUid;
        $data['tagId'] = $this->getTagId();
        $data['tagStatus'] = $this->tagStatus;
        $data['tagType'] = $this->tagType;
        $this->getCheckRule();
        $this->checkData($data);
        $result = $this->getTable()->insert($data);
        if(!$result){
            exception('添加失败');
        }
        return $this->getTable()->getLastInsID();
    }
}