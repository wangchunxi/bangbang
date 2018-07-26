<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/25/025
 * Time: 20:46
 */
namespace app\lib\Order\OrderPaymentNotice;
use app\lib\Order\IsOrder\IsOrder;
use app\model\OrderPaymentNoticeModel;

class OrderNoticeBase
{
    protected $orderId;
    protected $content;
    protected $status;
    protected $opUid;
    protected $table;
    public function setOrderId($orderId){
        $this->orderId  = $orderId;
        return $this;
    }


    public function setStatus($status){
        $this->status = $status;
        return $this;
    }

    public function setContent($content){
        $this->content = $content;
        return $this;
    }

    public function setOpUid($opUid){
        $this->opUid = $opUid;
        return $this;
    }
    protected function getTable(){
        if(empty($this->table)){
            $this->table = new OrderPaymentNoticeModel();
        }
        return $this->table;
    }
    protected function arrangeArray(){
        $data = [];
        $model = $this->getTable();
        $isOrder = new IsOrder($this->orderId);
        $result = $isOrder->isExist();
        if(!$result){
            exception('工单不存在');
        }
        $data[$model->_orderId] = $this->orderId;
        $data[$model->_content] = $this->content;
        return $data;
    }

//    protected function


}