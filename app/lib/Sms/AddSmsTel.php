<?php
/**
 * 添加短信模板
 * User: wangcx
 * Date: 18-4-3
 * Time: 下午5:16
 */

namespace app\lib\Sms;


use app\model\SmsTelModel;
use think\Validate;

class AddSmsTel extends SmsTelBase
{

    protected function validate($data){
        $this->rule['createId'] = 'require|integer';
        $this->rule['createTime'] = 'require|integer';
        $this->msg['createId.require']='操作人不能为空';
        $this->msg['createId.integer'] ='操作人类型要为整型';
        $this->msg['createTime.require']='操作时间不能为空';
        $this->msg['createTime.integer'] ='操作时间类型要为整型';
        $validate =  (new Validate($this->rule,$this->msg));
        if(!$validate->check($data)){
            exception($validate->getError());
        }
        return true;
    }

    public function save(){
        $data = $this->handleArray();
        $data['createId'] = $this->opUid;
        $data['createTime'] = $this->opTime;
        $this->validate($data);
        $result =  (new SmsTelModel())->insert($data);
        if(!$result){
            exception('添加短信模板失败');
        }
        return true;
    }
}