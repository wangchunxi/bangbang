<?php
/**
 * 工单交款期数详情
 * User: Administrator
 * Date: 2018/7/26/026
 * Time: 21:13
 */

namespace app\lib\Order\OrderInfo;


use app\model\OrderMoneyModel;

class GetOrderMoney
{
    protected $orderId;
    protected $idArray;
    protected $periods;
    public function __construct($orderId,$periods = 0)
    {
        $this->orderId = $orderId;
        $model =  (new OrderMoneyModel());
        $idArray = $model->where($model->_orderId,$this->orderId)->order($model->_id.' asc ')->column($model->_id);
        if(empty($idArray)){
            exception('未查到工单的交款期数');
        }
        $this->idArray = $idArray;
    }

    /**
     * 第一期交款情况
     */
    public function getFirstMoney(){
        return  $this->getMoneyInfo($this->idArray[0]);
    }

    /**
     * 下一期交款情况
     */
    public function getNextMoney(){
        return  $this->getMoneyInfo($this->idArray[0]);
    }

    /**
     * 最后一期交款情况
     */
    public function getEndMoney(){

    }


    protected function getMoneyInfo($moneyId){

    }
}