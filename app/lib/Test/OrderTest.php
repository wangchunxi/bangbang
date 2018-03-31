<?php
/**
 * Created by PhpStorm.
 * User: wangcx
 * Date: 18-3-31
 * Time: 下午4:08
 */
namespace app\lib\Test;
use app\model\OrderInfoModel;
use app\model\OrderMoneyModel;
use app\model\OrderOptionLogModel;

class OrderTest
{
    protected $orderId;
    protected $orderMoneyId;
    public function __construct($orderId)
    {
        $this->orderId = $orderId ;
    }

    /**
     * 检测下单
     * 1、验证是否下单
     * 2、验证价格是否对应
     * 3、验证是否存储工单日志
     * 4、验证存储日志的操作人是否一致
     */
    public function checkAddOrder(){
        $model =  new OrderInfoModel();

        $result =  $model->where('id',$this->orderId)->find();

        if(!$result){
            exception('下单失败');
        }

        $money =  (new OrderMoneyModel())->sum('money');

        if($result['orderTotal']!=$money){
            exception('总价不符');
        }

        $log = (new OrderOptionLogModel())
            ->where('orderId',$this->orderId)
            ->where('optionType','ADDORDER')
            ->find();
        if(!$log){
            exception('未获取到工单日志');
        }
        if($log['optionUserId']!=$result['createId']){
            exception('操作人无法对应');
        }
        return true;
    }
}