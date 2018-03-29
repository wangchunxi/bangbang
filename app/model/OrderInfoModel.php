<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/2/25/025
 * Time: 16:01
 */

namespace app\model;


use think\Model;

class OrderInfoModel extends Model
{
    protected $orderId;
    public function setOrderId($orderId ){
        $this->orderId = $orderId;
    }

    public function editOrderStatus($status ){
        $map['id'] = $this->orderId;
        $map['orderStatus'] = ($status-1);
        if($status == -1){
            $result = (new OrderMoneyModel())
                ->where('orderId',$this->orderId)
                ->where('status',1)->count();
            if($result>0){
                exception('用户已交工单款该单无法解除');
            }
           unset($map['orderStatus']);
        }
        if($status == 0){
            exception('无效工单状态修改');
        }
        $result = $this->where($map)->update($data = ['orderStatus'=>$status]);
        if(!$result){
            exception('工单状态跳转失败');
        }

    }
}