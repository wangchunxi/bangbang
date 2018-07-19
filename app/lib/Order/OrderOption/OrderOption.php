<?php
/**
 * 工单操作唯一入口
 * User: Administrator
 * Date: 2018/3/31/031
 * Time: 22:28
 */

namespace app\lib\Order\OrderOption;


use app\lib\Order\OrderInfo\UpdateOrderStatus;
use app\lib\Order\OrderNotice\OrderNotice;
use app\model\OrderInfoModel;

class OrderOption
{
    private $orderId;
    protected $orderInfoModel;
    protected $orderLog;
    protected $data;
    protected $opUid;
    protected $taskOrderId = 0;
    public function __construct($orderId)
    {
        $this->orderId = $orderId;
    }

    public function setOpUid($opUid){
        $this->opUid = $opUid;
        return $this;
    }

    public function setData($data){
        $this->data = $data;
        return $this;
    }

    protected function getOrderInfoModel(){
        if(!isset($this->orderInfoModel)){
            $this->orderInfoModel = new OrderInfoModel();
        }
        return  $this->orderInfoModel;
    }

    protected function getOrderLogModel(){
        if(!isset($this->orderLog)){
            $this->orderLog =  new OrderOptionLog( $this->orderId );
        }
        return   $this->orderLog;
    }
//    /**
//     * 分解任务改变状态
//     */
//    public function addOrderTask(){
//        $data['orderStatus'] = 1;
//        $result = $this->getOrderInfoModel()->where('id',$this->orderId)->update($data);
//        if(!$result){
//            exception('状态修改失败');
//        }
//        $this->writingOrderLog('RESOLVE','任务分解');
//        return true;
//    }

    /**
     * 发布工单改变状态
     * 1、修改工单状态
     */
    public function releaseTask(){
        /*修改工单状态*/
        (new UpdateOrderStatus($this->orderId,$this->opUid))->getCarryOrderStatus()->save();
        /*通知*/
        (new OrderNotice($this->orderId))->releaseTask();
        /*记入工单日志*/
        $this->writingOrderLog('RELEASE','工单id为'.$this->orderId.'发布了任务');
        return true;
    }

    /**
     * 设计师申请催款
     * 生成申请记录
     */
    public function orderApplyUrgeMoney(){

    }
    /**
     * 设计师催款操作
     * 生成交款记录
     * 工单挂上待付款标签
     * 通知用户
     * 通知监理
     * @param  $notice bool 是否开启通知
     */
    public function orderUrgeMoney($notice = true){

    }

    /**
     * 工单交款回调
     * 改变工单交款期状态
     * 缴款后取消待付款标签
     * 通知设计师
     * 通知监理
     */
    public function orderPayMoney(){

    }

    /**
     * 工单催签署
     * 生成交款记录
     * 工单挂上待签收标签
     * 通知用户
     * 通知设计师
     */
    public function OrderUrgeSign(){

    }

    /**
     * 工单签收
     * 改变签收记录状态
     * 工单取消待签收标签
     * 通知设计师
     * 通知监理
     */
    public function OrderSign(){

    }


    protected function writingOrderLog($type,$content){
        $log =  $this->getOrderLogModel();
        $log->setOptionType($type);
        $log->setTaskId($this->taskOrderId);
        $log->setOptionUserId($this->opUid);
        $log->setSubmitParameter(json_encode($this->data));
        $log->setOptionContent($content);
        $log->save();
        return true;
    }
}