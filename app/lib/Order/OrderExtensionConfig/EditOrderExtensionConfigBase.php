<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018\7\3 0003
 * Time: 19:13
 */

namespace app\lib\Order\OrderExtensionConfig;


class EditOrderExtensionConfigBase extends  OrderExtensionConfigBase
{
    private $id;
    public function setId($id){
        $this->id = $id;
        return $this;
    }
    private function validate(){
        $model = $this->getTable();
        $data = $this->handleArray();
        $data[$model->_updateId] = $this->opUid;
        $data[$model->_updateTime] = time();
        $data[$model->_id] = $this->id;
        $validate = $this->getValidate();
        if(!$validate->scene('edit')->check($data)){
            exception($validate->getError());
        }
        return $data;
    }

    public function save(){
        $data = $this->validate();
        $model = $this->getTable();
        $result =  $model->update($data);
        if(!$result){
            exception('操作失败');
        }
        return true;
    }
}