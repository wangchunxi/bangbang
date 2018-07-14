<?php
/**
 * 获取工单数据
 * User: wangcx
 * Date: 18-4-3
 * Time: 下午4:51
 */

namespace app\lib\Order\OrderInfo;


use app\model\OrderInfoModel;

class GetOrder
{
    /**
     * 待发布
     * @return id
     * @throws \Exception
     */
    public function getOrder(){
        $orderId = (new OrderInfoModel())->where('orderStatus',0)->value('id');
        if(empty($orderInfo)){
            exception('没有待发布的工单');
        }
        return $orderId;
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