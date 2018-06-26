<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018\6\26 0026
 * Time: 17:34
 */

namespace app\lib\Order\OrderConstructionLog;


class UpdateOrderConstructionLog extends  OrderConstructionLogBase
{
    protected $id;
    public function setId($id){
        $this->id = $id;
        return $this;
    }


    protected function validate(){
        $validate = $this->getValidate();
        $model = $this->getTable();
        $data = $this->arrange();
        $data[$model->_updateId] = $this->opUid;
        $data[$model->_updateTime] = time();
        if(!$validate->scene('save')->check($data)){
            exception($validate->getError());
        }
        return $data;
    }

    public function save(){
        $data = $this->validate();
        $result = $this->getTable()->update($data);
        if(!$result){
            exception('修改工地日志失败');
        }
        return true;
    }
}