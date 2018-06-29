<?php
/**
 * 修改工单状态
 * User: Administrator
 * Date: 2018/6/24/024
 * Time: 0:47
 */

namespace app\lib\Order\OrderInfo;



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
     * 下单状态修改状态
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
        $order =  new OrderInfoModel();
        $data = [$order->_id=>$this->id,$order->_updateId=>$this->opUid,$order->_updateTime=>time()];
        $result = $order->update($data);
        if(!$result){
            exception('工单状态跳转失败');
        }
        return true;
    }
}