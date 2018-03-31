<?php
/**
 * 流水记录表
 * User: wangcx
 * Date: 18-3-31
 * Time: 上午10:23
 */
namespace app\lib\Flow;
use app\model\FlowLogModel;
use app\model\FlowModel;

class flow
{
    /*流水金额*/
    private $money;
    /*操作人id*/
    private $createId;
    /*操作时间*/
    private $createTime;
    /*对应的工单*/
    private $orderId;
    /*流水号*/
    private $flowSn;
    /*流水内容*/
    private $flowContent;
    private $orderMoneyId;
    private $payType;
    private $flowType;
    private $is_admin;
    /*前缀*/
    private $str = 'BBYZ';
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
    private function getFlowSn(){
        $flowSn =date('y',$this->createTime)
                .date('m',$this->createTime)
                .date('d',$this->createTime)
                .mt_rand(0,10000);
        $this->flowSn =$flowSn;
        return $this;
    }

    private function checkData(){
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

    public function save(){
        $this->getFlowSn();
        $this->checkData();
        $data['money'] = $this->money;
        $data['createId'] = $this->createId;
        $data['createTime'] = $this->createTime;
        $data['orderId'] = $this->orderId;
        $data['flowSn'] = $this->flowSn;
        $data['flowContent'] = $this->flowContent;
        $data['payType'] = $this->payType;
        $data['flowType'] = $this->flowType;
        $data['is_admin'] = $this->is_admin;
        $data['orderMoneyId'] = $this->orderMoneyId;
        $result =  (new FlowLogModel())->insert($data);
        if(!$result){
            exception('流水添加失败');
        }
        return true;
    }



}