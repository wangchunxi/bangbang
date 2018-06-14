<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018\6\14 0014
 * Time: 18:03
 */

namespace app\lib\EffectPicture;


use think\Validate;

class EditEffectPicture extends EffectPictureBase
{
    private $id;
    public function setId($id){
        $this->id = $id;
        return $this;
    }

    private function checkData($data){
        $this->getCheckRule();
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
        $map['effectPictureTitle'] = $this->effectPictureTitle;
        $map['id'] = ['neq',$this->id];
        $result =  $this->getTable()->where($map)->value('id');
        if($result){
            exception('标题名称不能重复');
        }
    }


    public function save(){
        $data = $this->handleArray();
        $data['id'] =$this->id;
        $data['updateId'] = $this->opUid;
        $data['updateTime'] = $this->opTime;
        $this->checkData($data);
        $result =  $this->getTable()->update($data);
        return $result;
    }
}