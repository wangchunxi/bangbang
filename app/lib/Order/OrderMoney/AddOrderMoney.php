<?php
/**
 * 订单分期交款
 * User: Administrator
 * Date: 2018/2/25/025
 * Time: 18:48
 */

namespace app\lib\Order\OrderMoney;


use app\model\OrderMoneyModel;

class AddOrderMoney
{
    private $opUid ;
    private $createTime;
    private $orderId;
    private $status;
    private $name;
    private $money;
    private $key;
    private $tips;
    public function __construct($opUid,$orderId,$key)
    {
        $this->opUid = $opUid;
        $this->createTime = time();
        $this->status = 0;
        $this->orderId = $orderId;
        $this->key =  $key;
        $this->tips =  '第'.$this->key.'期交款';
    }

    /**
     * 设置每期的交款金额
     * @param $money
     * @return $this
     */
    public function setMoney($money){
        $this->money = $money;
        return $this;
    }
    /**
     * 生成每期的交款名称
     * @return string
     */
    private function getName(){
        $this->name =  '第'.$this->key.'期交款';
        return $this->name;
    }
    private function checkData(){
        if(!isset($this->money) || empty($this->money) || !is_numeric($this->money)){
            exception($this->tips.'金额格式错误');
        }
        if($this->money<=1){
            exception($this->tips.'交款金额不能小于1');
        }
        if(empty($this->name)||!isset($this->name)){
            exception($this->tips.'未生成名称');
        }
    }

    public function save(){
        $data['money']      =$this->money;
        $data['orderId']    =$this->orderId;
        $data['name']       =$this->getName();
        $data['status']     =$this->status;
        $data['createId']   =$this->opUid;
        $data['createTime'] =$this->createTime;
        $this->checkData();
        $model = new OrderMoneyModel();
        $result = $model ->insert($data);
        if(!$result){
            exception('生成每期交款数据失败');
        }
        return true;
    }
}