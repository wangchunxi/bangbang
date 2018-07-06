<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018\7\3 0003
 * Time: 19:13
 */

namespace app\lib\Order\OrderExtensionConfig;


class AddOrderExtensionConfig extends OrderExtensionConfigBase
{

    private function validate(){
        $model = $this->getTable();
        $data = $this->handleArray();
        $data[$model->_createId] = $this->opUid;
        $data[$model->_createTime] = time();
        $validate = $this->getValidate();
        if(!$validate->scene('add')->check($data)){
            exception($validate->getError());
        }
        return $data;
    }

    public function save(){
        $data = $this->validate();
        $model = $this->getTable();
        $result =  $model->insert($data);
        if(!$result){
            exception('操作失败');
        }
        return true;
    }
}