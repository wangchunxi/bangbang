<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018\6\26 0026
 * Time: 17:21
 */

namespace app\lib\Order\OrderConstructionLog;


class AddOrderConstructionLog extends OrderConstructionLogBase
{
    protected function validate(){
        $validate =  $this->getValidate();
        $model = $this->getTable();
        $data = $this->arrange();
        $data[$model->_createId] = $this->opUid;
        $data[$model->_createTime] = time();
        if(!$validate->scene('add')->check($data)){
            exception($validate->getError());
        }
        return $data;
    }

    protected function save(){
        $data =  $this->validate();
        $result =  $this->getTable()->insert($data);
        if(!$result){
            exception('工地日志提交成功');
        }
        return true;
    }
}