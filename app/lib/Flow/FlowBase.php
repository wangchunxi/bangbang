<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/7/19/019
 * Time: 21:00
 */

namespace app\lib\Flow;


class FlowBase
{
    /*流水金额*/
    protected $money;
    /*操作人id*/
    protected $createId;
    /*操作时间*/
    protected $createTime;
    /*对应的工单*/
    protected $orderId = 0;
    /*流水号*/
    protected $flowSn;
    /*流水内容*/
    protected $flowContent;
    protected $orderMoneyId = 0;
    protected $payType;
    protected $flowType;
    protected $is_admin;
    protected $flowDetails;
    /*前缀*/
    protected $str = 'BBYZ';
    public function __construct($createId)
    {
        $this->createId =  $createId;
        $this->createTime = time();
    }

    public function setMoney($money){
        $this->money = $money;
        return $this;
    }

    public function setOrderId($orderId){
        $this->orderId = $orderId;
        return $this;
    }


    public function setFlowContent($content){
        $this->flowContent = $content;
        return $this;
    }
    public function  setFlowDetails($content){
        $this->flowDetails = $content;
        return $this;
    }
    public function setOrderMoneyId($orderMoneyId){
        $this->orderMoneyId =  $orderMoneyId;
        return $this;
    }
    public function setPayType($payType){
        $this->payType =  $payType;
        return $this;
    }
    public function setFlowType($flowType){
        $this->flowType =  $flowType;
        return $this;
    }
    public function setIsAdmin($is_admin){
        $this->is_admin = $is_admin;
        return $this;
    }
    protected function getFlowSn(){
        $flowSn =date('y',$this->createTime)
            .date('m',$this->createTime)
            .date('d',$this->createTime)
            .mt_rand(0,10000);
        $this->flowSn =$flowSn;
        return $this;
    }

    protected function checkData(){
        if(!isset($this->createId) || empty($this->createId)){
            exception('缺少操作人');
        }
        if(!isset($this->money)){
            exception('缺少金额');
        }
        if(!isset($this->flowSn) || empty($this->flowSn)){
            exception('缺少流水号');
        }
        if(!isset($this->flowContent) || empty($this->flowContent)){
            exception('缺少流水内容');
        }
        return true;
    }
}