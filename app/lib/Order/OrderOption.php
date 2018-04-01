<?php
/**
 * 工单状态操作
 * User: Administrator
 * Date: 2018/3/31/031
 * Time: 22:28
 */

namespace app\lib\Order;


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
    /**
     * 分解任务改变状态
     */
    public function addOrderTask(){
        $data['orderStatus'] = 1;
        $result = $this->getOrderInfoModel()->where('id',$this->orderId)->update($data);
        if(!$result){
            exception('状态修改失败');
        }
        $this->writingOrderLog('RESOLVE','任务分解');
        return true;
    }

    /**
     * 发布任务改变状态
     */
    public function releaseTask(){
        /*修改工单状态*/
        $this->getOrderInfoModel()->setOrderId($this->orderId)->editOrderStatus(2);
        /*修改工单任务状态*/
        (new OperatingTask($this->orderId))->releaseTask();
        /*记入工单日志*/
        $this->writingOrderLog('RELEASE','工单id为'.$this->orderId.'发布了任务');
        return true;
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