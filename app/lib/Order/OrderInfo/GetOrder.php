<?php
/**
 * 获取工单数据
 * User: wangcx
 * Date: 18-4-3
 * Time: 下午4:51
 */

namespace app\lib\Order\OrderInfo;


use app\model\OrderInfoModel;
use app\model\OrderMoneyModel;

class GetOrder
{
    /**
     * 待分解工单
     * @return array
     */
    public function getOrder(){
        $orderInfo = (new OrderInfoModel())->where('orderStatus',0)->find();
        if(empty($orderInfo)){
            exception('没有可以分解的工单');
        }
        $orderMoney = (new OrderMoneyModel())->where('orderId',$orderInfo['id'])->select();
        $data['orderInfo'] = $orderInfo;
        $data['orderMoney'] = $orderMoney;
        return $data;
    }


    /**
     * 获取待发布的工单
     */
    public function getReleaseTaskOrderId(){
        $orderInfo = (new OrderInfoModel())->where('orderStatus',1)->value('id');
        if(empty($orderInfo)){
            exception('没有可以发布的工单');
        }
        return $orderInfo;

    }
}