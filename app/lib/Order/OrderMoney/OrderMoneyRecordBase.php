<?php
/**
 * 付款记录
 * User: Administrator
 * Date: 2018\7\14 0014
 * Time: 15:13
 */

namespace app\lib\Order\OrderMoney;


use app\model\OrderMoneyRecordModel;

class OrderMoneyRecordBase
{
    protected $id;
    protected $orderMoneyId;
    protected $opUid;
    protected $payType;
    protected $noticeId;
    protected $pay = 'no';
    protected $table = '';
    protected $flowTable = '';
    public function setOrderMoneyId($orderMoneyId =''){
        $this->orderMoneyId = $orderMoneyId;
        return $this;
    }
    public function setOpUid($opUid =''){
        $this->opUid = $opUid;
        return $this;
    }
    public function setPayType($payType =''){
        $this->payType = $payType;
        return $this;
    }
    public function setNoticeId($noticeId =''){
        $this->noticeId = $noticeId;
        return $this;
    }
    public function setPay($pay){
        $this->pay = $pay;
        return $this;
    }
    protected function getModel(){
        if(empty($this->table)){
            $this->table = new OrderMoneyRecordModel();
        }
        return $this->table;
    }
    protected function getFlowTable(){
        if(empty($this->flowTable)){
            $this->flowTable = new 
        }
    }

    /**
     * 数组处理
     * @return mixed
     */
    protected function handleArray(){
        $model =  $this->getModel();
        $data[$model->_noticeId] = $this->noticeId;
        $data[$model->_orderMoneyId]=$this->orderMoneyId;
        $data[$model->_payType] = $this->payType;
        $data[$model->_status] = 0;
        return $data;
    }

    /**
     * 记录工单流水
     */
    protected function recordingFlow(){

    }

    /**
     * 记录工单日志
     */
    protected function recordingOrderLog(){

    }



}