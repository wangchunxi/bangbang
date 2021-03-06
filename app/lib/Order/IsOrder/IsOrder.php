<?php
/**
 * 对工单的基本判断
 * User: Administrator
 * Date: 2018/6/24/024
 * Time: 0:40
 */

namespace app\lib\Order\IsOrder;


use app\lib\Order\OrderInfo\UpdateOrderStatus;
use app\model\OrderBindingExtensionModel;
use app\model\OrderInfoModel;
use app\model\OrderMoneyModel;
use app\model\OrderMoneyRecordModel;
use app\model\OrderPaymentNoticeModel;

class IsOrder
{

    protected $id;
    protected $orderTable;
    protected $orderStatusLib;
    protected $orderMoneyTable;
    protected $orderPaymentNoticeTable;
    protected $orderMoneyRecordTable;
    protected $orderOrderBindingTable;
    public function __construct($id)
    {
        $this->id = $id;
    }

    /**
     * 工单详情
     * @return OrderInfoModel
     */
    protected function getTable(){
        if(empty($this->orderTable)){
            $this->orderTable = new OrderInfoModel();
        }
        return  $this->orderTable;
    }

    /**
     * 工单状态
     * @return UpdateOrderStatus
     */
    protected function getOrderStatusLib(){
        if(empty($this->orderStatusLib)){
            $this->orderStatusLib = new UpdateOrderStatus($this->id,1);
        }
        return $this->orderStatusLib;
    }

    /**
     * 工单交款金额
     * @return OrderMoneyModel
     */
    protected function getOrderMoneyTable(){
        if(empty($this->orderMoneyTable)){
            $this->orderMoneyTable = new OrderMoneyModel();
        }
        return $this->orderMoneyTable;
    }

    /**
     * 工单通知信息列表
     * @return OrderPaymentNoticeModel
     */
    protected function getOrderPaymentNoticeTable(){
        if(empty($this->orderPaymentNoticeTable)){
            $this->orderPaymentNoticeTable = new OrderPaymentNoticeModel();
        }
        return  $this->orderPaymentNoticeTable;
    }

    /**
     * 工单交款记录列表
     * @return OrderMoneyRecordModel
     */
    protected function getOrderMoneyRecordTable(){
        if(empty($this->orderMoneyRecordTable)){
            $this->orderMoneyRecordTable = new OrderMoneyRecordModel();
        }
        return  $this->orderMoneyRecordTable;
    }

    /**
     * 工单绑定标签表
     * @return OrderBindingExtensionModel
     */
    protected function getOrderBindingTable(){
        if(empty($this->orderOrderBindingTable)){
            $this->orderOrderBindingTable = new OrderBindingExtensionModel();
        }
        return $this->orderOrderBindingTable;
    }

    /**
     * 工单是否存在
     * 存在为 true
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
     * 可以废除为 true
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
     * 要回复为 true
     * @return bool
     */
    public function isReturnWordLog(){
        $result = true;
        if($this->isExistCurrentNoPay() || $this->isExistCurrentNoSign()){
            $result = false;
        }
        return empty($result)?false:true;
    }

    /**
     * 是否要存在这一期交款期数
     * 存在为true
     * @param  $id
     * @return bool
     */
    public function isExistOrderMoney($id){
        $model = $this->getOrderMoneyTable();
        $result = $model->where($model->_id,$id)->value($model->_id);
        return empty($result)?false:true;
    }

    public function isOrderMoneyNoPay(){

    }

    /**
     * 是否存在当前有要交款的期数
     * 有就为true
     * @return bool
     */
    public function isExistCurrentNoPay(){
        $result = false;
        $model =  $this->getOrderBindingTable();
        $map = [$model->_orderId=>$this->id,$model->_configId=>['in',[2]],$model->_status = 1];
        $result  = $model->where($map)->value($model->_id);
        return empty($result)?false:true;
    }

    /**
     * 是否存在要签收的信息
     * 有就为true
     * @return bool
     */
    public function isExistCurrentNoSign(){
        $result = false;
        $model =  $this->getOrderBindingTable();
        $map = [$model->_orderId=>$this->id,$model->_configId=>['in',[1]],$model->_status = 1];
        $result  = $model->where($map)->value($model->_id);
        return empty($result)?false:true;
    }

    /**
     * 工单第一期是否交款
     * 没有交款 true
     */
    public function isFirstNoPay(){
        $model =  $this->getOrderMoneyTable();
        $id = $model->where($model->_orderId,$this->id)->order($model->_id.' asc ')->value($model->_id);
        $moneyModel = $this->getOrderMoneyRecordTable();
        $map = [$moneyModel->_orderMoneyId=>$id,$moneyModel->_status=>1];
        $moneyModelId =  $moneyModel->where($map)->value($moneyModel->_id);
        return empty($moneyModelId)?true:false;
    }

}