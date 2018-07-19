<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/7/19/019
 * Time: 20:17
 */

namespace app\lib\Order\OrderMoney;


class AddOrderMoneyRecord extends  OrderMoneyRecordBase
{
    /**
     *
     * 未支付
     */
    public function noPay(){
        $model = $this->getModel();
        $validate = $this->getValidate();
        $data = $this->handleArray();
        $data[$model->_createTime] = time();
        if(!$validate->scene('noPay')->check($data)){
            exception($validate->getError());
        }
        $result = $model->insert($data);
        if(!$result){
            exception('添加交款记录失败');
        }
        return true;
    }

    /**
     * 支付
     */
    public function pay(){
        $model = $this->getModel();
        $validate = $this->getValidate();
        $data = $this->handleArray();
        $data[$model->_createTime] = time();
        $data[$model->_paymentId] = $this->paymentId;
        $data[$model->_paymentTime] = time();
        $data[$model->_createTime] = time();
        $data[$model->_status] = 1;
        $data[$model->_payType] = $this->payType;
        if(!$validate->scene('pay')->check($data)){
            exception($validate->getError());
        }
        $result = $model->insert($data);
        if(!$result){
            exception('添加交款记录失败');
        }
        $this->recordFlow('工单款','下单自动支付',1);
        return true;
    }
}