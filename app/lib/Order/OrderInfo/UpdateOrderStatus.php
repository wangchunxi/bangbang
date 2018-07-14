<?php
/**
 * 修改工单状态
 * User: Administrator
 * Date: 2018/6/24/024
 * Time: 0:47
 */

namespace app\lib\Order\OrderInfo;



use app\lib\Order\IsOrder\IsOrder;
use app\model\OrderInfoModel;

class UpdateOrderStatus
{
    protected $id;
    protected $status;
    protected $opUid;
    public function __construct($id,$opUid)
    {
        $this->id = $id;
        $this->opUid = $opUid;
    }

    /**
     * 废除工单修改状态
     */
    public function getDelOrderStatus(){
        $this->status = -1;
        return $this;
    }

    /**
     * 下单工单状态修改
     */
    public function getAddOrderStatus(){
        $this->status = 0;
        return $this;
    }
    /**
     * 发布工单修改状态
     */
    public function getCarryOrderStatus(){
        $this->status = 1;
        return $this;
    }

    /**
     * 工单已完成
     */
    public function getEndOrderStatus(){
        $this->status = 2;
        return $this;
    }


    public function getStatus(){
        return $this->status;
    }
    public function save(){
        $this->check();
        $order =  new OrderInfoModel();
        $data = [$order->_id=>$this->id,$order->_updateId=>$this->opUid,$order->_updateTime=>time()];
        $result = $order->update($data);
        if(!$result){
            exception('工单状态跳转失败');
        }
        return true;
    }

    private function check(){
        $result = false;
        switch ($this->status){
            case '-1':
                $result =  (new IsOrder($this->id))->isDelOrder();
                break;
            default:
                $result = $this->changeStatusValidate();
                break;
        }
        return $result;
    }

    private function changeStatusValidate(){
        $modle = (new GetOrderInfo($this->id,false));
        $status  =  $modle->getOrderStatus();
        if($status+1 != $this->status || $status-1 != $this->status){
            exception('该工单无法跳转状态');
        }
        return true;
    }
}