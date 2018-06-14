<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018\6\14 0014
 * Time: 18:02
 */

namespace app\lib\EffectPicture;


use think\Validate;

class AddEffectPicture extends EffectPictureBase
{

    private function checkData($data){
        $this->getCheckRule();
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
        $map['effectPictureTitle'] = $this->effectPictureTitle;
        $result =  $this->getTable()->where($map)->value('id');
        if($result){
            exception('标题名称不能重复');
        }
        return true;
    }

    public function save(){
        $data = $this->handleArray();
        $data['createId'] =$this->opUid;
        $data['createTime'] = $this->opTime;
        $this->checkData($data);
        $result =  $this->getTable()->insert($data);
        if(!$result){
            exception('新增效果图标题失败');
        }
        return $result;
    }

}