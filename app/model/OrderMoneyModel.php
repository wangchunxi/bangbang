<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/2/25/025
 * Time: 19:08
 */

namespace app\model;


use think\Model;

class OrderMoneyModel extends Model
{
    /**
     * 收款回调改变状态
     */
    public function receiptChangeStatus($orderId,$moneyId){
        $result = $this->where('orderId',$orderId)
            ->where('id',$moneyId)
            ->where('status',0)
            ->update($data = ['status'=>1]);
        if(!$result){
            return false;
        }
        return true;
    }
}