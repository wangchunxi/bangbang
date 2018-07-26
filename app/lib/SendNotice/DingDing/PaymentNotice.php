<?php
/**
 * 交款后推送
 * User: Administrator
 * Date: 2018\7\26 0026
 * Time: 15:24
 */

namespace app\lib\SendNotice\DingDing;


use app\lib\Sms\RecordingSms;
use app\model\OrderInfoModel;
use app\model\OrderMoneyModel;

class PaymentNotice
{
    private $orderId;
    private $orderList;
    private $orderMoneyId;
    private $orderMoney;
    public function __construct($orderId,$orderMoneyId)
    {
        $this->orderId = $orderId;
        $this->orderMoneyId = $orderMoneyId;
    }

    /**
     * 工单表
     * @return OrderInfoModel
     */
    private function getOrderList(){
        if(empty($this->orderList)){
            $this->orderList = new OrderInfoModel();
        }
        return $this->orderList;
    }


    private function getOrderMoney(){
        if(empty($this->orderMoney)){
            $this->orderMoney = new OrderMoneyModel();
        }
        return $this->orderMoney;
    }

    /**
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function save(){
        $list  =  $this->getOrderList();
        $money =  $this->getOrderMoney();
        /*获取工单信息*/
        $map   = [$list->_id=>$this->orderId];
        $field = [$list->_orderName,$list->_orderNum,$list->_userAddressNum];
        $info  =  $list->where($map)->field($field)->find();
        /*获取交款期数信息*/
        $map   = [$money->_id=>$this->orderMoneyId];
        $field = [$money->_name,$money->_money];
        $moneyInfo  =  $money->where($map)->field($field)->find();
        
        $content = '工单号为:【'.$info['orderNum']. '】,顾客姓名:【'.$info['orderName'].'】,地址为:【'.
            $info['userAddressNum'].'】,交付【'.$moneyInfo['name'].'】成功,共计金额:【'.$moneyInfo['money'].'】';
        $webHook = "https://oapi.dingtalk.com/robot/Send?access_token=2bc87d1b37a25b790e02534ad6bca312cbba2dd0e1a6aa0299ab32b37ec5250b";
        (new DingDingNotice())->setContent($content)->setWebHook($webHook)->save();
        (new RecordingSms())->setOrderId($this->orderId)->setAcceptUid(0)->setIsSuccess(1)
            ->setSendType('DingDing')->setSmsContent($content)->setSmsId(0)->save();
    }
}