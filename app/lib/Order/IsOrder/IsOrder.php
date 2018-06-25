<?php
/**
 * 对工单的基本判断
 * User: Administrator
 * Date: 2018/6/24/024
 * Time: 0:40
 */

namespace app\lib\Order\IsOrder;


use app\lib\Order\OrderInfo\UpdateOrderStatus;
use app\model\OrderInfoModel;
use app\model\OrderMoneyModel;

class IsOrder
{

    protected $id;
    protected $orderTable;
    protected $orderStatusLib;
    protected $orderMoneyTable;
    public function __construct($id)
    {
        $this->id = $id;
    }

    protected function getTable(){
        if(empty($this->orderTable)){
            $this->orderTable = new OrderInfoModel();
        }
        return  $this->orderTable;
    }

    protected function getOrderStatusLib(){
        if(empty($this->orderStatusLib)){
            $this->orderStatusLib = new UpdateOrderStatus();
        }
        return $this->orderStatusLib;
    }

    protected function getOrderMoneyTable(){
        if(empty($this->orderMoneyTable)){
            $this->orderMoneyTable = new OrderMoneyModel();
        }
        return $this->orderMoneyTable;
    }

    /**
     * 工单是否存在
     * @return bool
     */
    public function isExist(){
        $model = $this->getTable();
        $map = [
            $model->_id=>$this->id,
            $model->_orderStatus=>['neq',$this->getOrderStatusLib()->getDelOrderStatus()->getStatus()]
        ];
        $result = $model->where($map)->value($model->_id);
        return empty($result)?false:true;
    }

    /**
     * 是否能废除工单
     * @return bool
     */
    public function isDelOrder(){
        $model = $this->getOrderMoneyTable();
        $map = [
            $model->_orderId=>$this->id,
            $model->_status=>1
        ];
        $result =$model->where($map)->value($model->_id);
        return empty($result)?true:false;
    }

    /**
     * 是否要回复工作日志
     * @return bool
     */
    public function isReturnWordLog(){

        return empty($result)?false:true;
    }

    /**
     * 是否要存在交款期数
     * @param  $id
     * @return bool
     */
    public function isExistOrderMoney($id){
        $model = $this->getOrderMoneyTable();
        $result = $model->where($model->_id,$id)->value($model->_id);
        return empty($result)?false:true;
    }

}