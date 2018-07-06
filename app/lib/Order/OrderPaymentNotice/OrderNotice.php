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
        return $this->table;
    }
    /**
     * 获取通知里最大id的未经过审核支付类最大id
     */
    public function getNoReviewPayMaxId(){
        $model = $this->getTable();
        $map = [$model->_status = 0 , $model->_type='pay']  ;
        return $this->getMaxId($map);
    }

    /**
     * 获取通知里最大id的未经过审核签收类最大id
     */
    public function getNoReviewSignMaxId(){
        $model = $this->getTable();
        $map = [$model->_status = 0 , $model->_type='sign']  ;
        return $this->getMaxId($map);
    }
    /**
     * 获取通知里最大id的经过审核支付类最大id
     */
    public function getReviewPayMaxId(){
        $model = $this->getTable();
        $map = [$model->_status = 1 , $model->_type='pay']  ;
        return $this->getMaxId($map);
    }

    /**
     * 获取通知里最大id的经过审核签收类最大id
     */
    public function getReviewSignMaxId(){
        $model = $this->getTable();
        $map = [$model->_status = 1 , $model->_type='pay'] ;
        return $this->getMaxId($map);
    }

    private function getMaxId($map){
        $model = $this->getTable();
        $result =  $model->where($map)->max($model->_id);
        return  $result;
    }

}