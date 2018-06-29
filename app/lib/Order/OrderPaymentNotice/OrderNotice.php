<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018\6\29 0029
 * Time: 11:28
 */

namespace app\lib\Order\OrderPaymentNotice;


use app\model\OrderPaymentNoticeModel;

class OrderNotice
{
    protected $orderId;
    protected $table;
    public function __construct($orderId)
    {
        $this->orderId = $orderId;
    }

    protected function getTable(){
        if(empty($this->table)){
            $this->table=new OrderPaymentNoticeModel();
        }
    }
    /**
     * 获取通知里最大id的未经过审核支付类最大id
     */
    public function getNoReviewPayMaxId(){
        $map['']
    }

    /**
     * 获取通知里最大id的未经过审核签收类最大id
     */
    public function getNoReviewSignMaxId(){

    }
    /**
     * 获取通知里最大id的经过审核支付类最大id
     */
    public function getReviewPayMaxId(){

    }

    /**
     * 获取通知里最大id的经过审核签收类最大id
     */
    public function getReviewSignMaxId(){

    }
}