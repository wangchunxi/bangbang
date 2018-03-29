<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/24/024
 * Time: 16:38
 */

namespace app\lib;


use app\model\OrderMoneyModel;
use think\exception\HttpException;

class OperatingOrderMoney
{
    protected $orderId;
    protected $moneyId;
    public function __construct($orderId,$moneyId)
    {
        $this->orderId =  $orderId;
        $this->moneyId =  $moneyId;
    }

    /**
     * 收款回调
     */
    public function receiptCallback(){
        if(empty($this->orderId) || !isset($this->orderId)){
            exception('缺少参数工单id');
        }
        if(empty($this->moneyId) || !isset($this->moneyId)){
            exception('缺少交期款');
        }
        $result = (new OrderMoneyModel())->receiptChangeStatus($this->orderId,$this->moneyId);
        if(!$result){
            exception('改变该期交款失败');
        }
        /*记录操作日志*/

        /*记录工单流水*/

        return true;
    }
}