<?php
/**
 * 添加短信模板
 * User: wangcx
 * Date: 18-4-3
 * Time: 下午5:16
 */

namespace app\lib\Sms;


use app\model\SmsTelModel;

class AddSmsTel extends SmsTelBase
{



    public function save(){
        $data = $this->handleArray();
        $data['createId'] = $this->opUid;
        $data['createTime'] = $this->opTime;
        $result =  (new SmsTelModel())->insert($data);
        if(!$result){
            exception('添加短信模板失败');
        }
        return true;
    }
}