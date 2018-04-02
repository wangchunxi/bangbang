<?php
/**
 * 操作任务
 * User: Administrator
 * Date: 2018/3/18/018
 * Time: 22:45
 */

namespace app\lib\Order;


use app\lib\Send\InternalPushOrder;
use app\model\OrderInfoModel;
use app\model\OrderMoneyModel;
use app\model\OrderTaskModel;

class OperatingTask
{
    protected $orderId;
    protected $orderTaskId;
    protected $orderTaskModel;
    protected $orderInfoModel;
    protected $orderLog;
    protected $opUid;
    public function __construct($orderId)
    {
        $this->orderId  = $orderId;
    }
    public function setOrderTaskId($orderTaskId){
        $this->orderTaskId = $orderTaskId;
        return $this;
    }
    public function setOpUid($opUid){
        $this->opUid  = $opUid;
        return $this;
    }

    protected function getOrderTaskModel(){
        if(!isset($this->orderTaskModel)){
            $this->orderTaskModel =  (new OrderTaskModel());
        }
        return $this->orderTaskModel;
    }
    protected function getOrderInfoModel(){
        if(!isset($this->orderInfoModel)){
            $this->orderInfoModel =  new OrderInfoModel();
        }
        return   $this->orderInfoModel;
    }

    protected function getOrderLogModel(){
        if(!isset($this->orderLog)){
            $this->orderLog =  new OrderOptionLog( $this->orderId );
        }
        return   $this->orderLog;
    }
    /**
     * 任务发布
     * 1、修改所有的工单任务为待进行
     * 2、修改工单为工单进行中
     * 3、检验工单第一周期是否交款
     * 4、未交款催款
     * 5、已交款开始下发第一个任务
     * @throws \Exception
     */
    public function releaseTask(){
        /*修改任务状态*/
        $result = $this->getOrderTaskModel()->publishingTasks($this->orderId);
        if(!$result){
            exception('任务状态修改失败');
        }
        /*通知监工*/
        $msg = '您有一个工单即将开始,请到我的工单监控中查看';
        (new InternalPushOrder())->setOrderId()->setSendContent($msg)->masterSend();
        /*通知客户*/
        $customerMsg = '您的装修任务已经开始';
        $result = (new OrderMoneyModel())->where('orderId',$this->orderId)->find();
        /*判断是否可以开始任务*/
        if($result['status']!=1){
            /*通知用户缴纳金额 TODO*/
            $customerMsg.=',请您按时缴纳'.$result['name'].',以防延误工期对您装修造成不便';
        }else{
            /*开始任务*/
            $this->orderTaskStart();
        }
        $customerMsg.='祝您生活愉快';
        /*发短信给用户*/
        (new InternalPushOrder())->setOrderId()->setSendContent($customerMsg)->masterSend();
        return true;
    }

    /**
     * 完成任务
     * 1、任务完成
     * 2、判断下一个任务是否存在不存在直接跳转整个工单状态
     * 3、判断该任务是否是这个阶段的最后一个任务如果提醒用户缴纳下阶段费用解锁任务
     * 4、判断这个任务是否要用户验证，要的话提醒顾客签收结果
     * 5、开启下一个任务
     */
    public function endTask(){
        $info = $this->getOrderTaskModel()
            ->where('id',$this->orderTaskId)
            ->field('id,isVerify,orderMoneyId,taskStatus')
            ->find();

        if(!$info){
            exception('获取当前的任务详情失败');
        }

        if($info['taskStatus'] != 0 ){
            exception('该条任务状态不对无法完结');
        }
        /*完结任务*/
        $result = $this->getOrderTaskModel()->endTask($this->orderTaskId);

        if(!$result){
            exception('任务完结失败请联系管理员');
        }
        /*判断是否可以完结整个工单*/
        $maxId = $this->getOrderTaskModel()->getMaxId($this->orderId);

        if(!$maxId){
            exception('获取工单最大的任务详情失败');
        }

        if($this->orderTaskId == $maxId){
            /*完结工单 TODO */
        }

        /*判断是否需要签收任务*/
        if($info['isVerify'] == 1){
            /*任务签收调用发短信告知用户  TODO*/

        }

        /*判断是否可以开启下个任务*/
        $minInfo = $this->getOrderTaskModel()
            ->where('id',$this->orderTaskId)
            ->where('taskStatus',-1)
            ->order('id ace')
            ->field('orderMoneyId,id,taskStatus')
            ->find();

        if(!$minInfo){
            exception('获取下个任务详情失败');
        }

        if($info['orderMoneyId'] != $minInfo['orderMoneyId']){
            /*发短信通知客户缴纳下期货款 TODO*/

        }else{
            /*开启下个任务*/
           $this->orderTaskStart($minInfo['id']);

        }
        return true;
    }

    /**
     * 开始任务
     * 1、开始任务
     * 2、记录日志
     * @param $taskId
     * @throws \Exception
     */
    protected function orderTaskStart($taskId = ''){
        if(empty($taskId)){
            if(!isset($this->orderId) || empty($this->orderId) || $this->orderId<=0){
                exception('未获取OrderId');
            }
            $taskId = $this->getOrderTaskModel()->getStartId($this->orderId);
            if(!$taskId){
                exception('没有获取到要开始的任务id');
            }
        }
        $data = ['taskStatus'=>'0','ActualStartTime'=>time()];
        $result= $this->getOrderTaskModel()
            ->where('id',$taskId)
            ->where('taskStatus',-1)
            ->update($data);
        if(!$result){
            exception('任务id为'.$taskId.'任务状态变更失败,原因可能是该任务状态出错');
        }
        return true;
    }
}