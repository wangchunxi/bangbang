<?php
/**
 * 修改短信模板
 * User: wangcx
 * Date: 18-4-4
 * Time: 上午10:38
 */

namespace app\lib\Sms;


use app\model\SmsTelModel;
use think\Validate;

class EditSmsTel extends SmsTelBase
{
    protected $id;
    public function setId($id){
        $this->id = $id;
        return $this;
    }

    protected function validate($data){
        $this->rule['UpdateId'] = 'require|integer';
        $this->rule['UpdateTime'] = 'require|integer';
        $this->msg['UpdateId.require']='操作人不能为空';
        $this->msg['UpdateId.integer'] ='操作人类型要为整型';
        $this->msg['UpdateTime.require']='操作时间不能为空';
        $this->msg['UpdateTime.integer'] ='操作时间类型要为整型';
        $validate =  (new Validate($this->rule,$this->msg));
        if(!$validate->check($data)){
            exception($validate->getError());
        }
    }

    public function save(){
        $data = $this->handleArray();
        $data['UpdateId'] = $this->opUid;
        $data['UpdateTime'] = $this->opTime;
        $this->validate($data);
        $result =  (new SmsTelModel())->update($data);
        if(!$result){
            exception('添加短信模板失败');
        }
        return true;
    }
}