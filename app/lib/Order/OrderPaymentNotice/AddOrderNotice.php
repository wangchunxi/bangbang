<?php
/**
 * 发起支付通知处理
 * User: Administrator
 * Date: 2018/6/25/025
 * Time: 22:46
 */

namespace app\lib\Order\OrderPaymentNotice;


class AddOrderNotice extends OrderNoticeBase
{
    /**
     * 下单时候自动加入通知（未支付）
     */
    public function AddOrderNoPayNotice(){
        $model = $this->getTable();
        $data = $this->arrangeArray();
        $data[$model->_status] = 1;
        $data[$model->_applyId] = 0;
        $data[$model->_applyTime] = time();
        $data[$model->_verifyId] = 0;
        $data[$model->_verifyTime] = time();
        $data[$model->_type] = 'pay';
        return $this->save($data);
    }

    /**
     * 下单时候自动加入通知（已支付）
     */
    public function AddOrderPayNotice(){
        $model = $this->getTable();
        $data = $this->arrangeArray();
        $data[$model->_status] = 1;
        $data[$model->_applyId] = $this->opUid;
        $data[$model->_applyTime] = time();
        $data[$model->_verifyId] = 0;
        $data[$model->_verifyTime] = time();
        $data[$model->_type] = 'pay';
        return $this->save($data);
    }

    /**
     * 发起支付通知申请
     */
    public function initiateOrderPayNotice(){
        $model = $this->getTable();
        $data = $this->arrangeArray();
        $data[$model->_status] = 0;
        $data[$model->_applyId] = $this->opUid;
        $data[$model->_applyTime] = time();
        $data[$model->_type] = 'pay';
        return $this->save($data);
    }

    /**
     * 发起签收通知
     */
    public function SignOrderNotice(){
        $model = $this->getTable();
        $data = $this->arrangeArray();
        $data[$model->_status] = 0;
        $data[$model->_applyId] = $this->opUid;
        $data[$model->_applyTime] = time();
        $data[$model->_type] = 'sign';
        return $this->save($data);
    }
    /**
     * 执行代码
     * @param $data
     * @return int|string
     * @throws \Exception
     */
    protected function save($data){
        $model = $this->getTable();
        $result =  $model->insert($data);
        if(!$result){
            exception('发起支付申请失败');
        }
        return $result;
    }
}