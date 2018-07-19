<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/7/19/019
 * Time: 20:29
 */

namespace app\lib\Order\OrderMoney;


class EditOrderMoneyRecord extends OrderMoneyRecordBase
{
    public function changePay(){
        $model = $this->getModel();
        $validate = $this->getValidate();
        $data[$model->_status] = 1;
        $data[$model->_paymentTime] = time();
        $data[$model->_paymentId] = $this->paymentId;
        $data[$model->_payType] = $this->payType;
        if(!$validate->scene('changePay')->check()){
            exception( $validate->getError());
        }
        return true;
    }
}