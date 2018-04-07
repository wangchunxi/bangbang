<?php
/**
 * 工单任务操作基类
 * User: Administrator
 * Date: 2018/3/31/031
 * Time: 19:45
 */

namespace app\lib\Order\OrderTask;


use app\model\OrderInfoModel;
use app\model\OrderMoneyModel;
use app\model\OrderTaskModel;

class OrderTaskBase
{
    protected $orderId;
    protected $taskName;
    protected $taskCycle;
    protected $moneyId;
    protected $isVerify = 0;
    protected $taskStartTime;
    protected $taskEndTime;
    protected $orderEnd;
    protected $opUid;

    public function __construct($wid)
    {
        $this->orderId = $wid;
    }

    public function setTaskName($taskName = ''){
        $this->taskName = $taskName;
        return $this;
    }

    public function setTaskCycle($taskCycle = ''){
        $this->taskCycle = $taskCycle;
        return $this;
    }

    public function setMoneyId( $moneyId = ''){
        $this->moneyId =  $moneyId;
        return $this;
    }

    public function setIsVerify($isVerify = 0){
        $this->isVerify = $isVerify;
        return $this;
    }

    public function setTaskStartTime($taskStartTime){
        $this->taskStartTime = $taskStartTime;
        return $this;
    }

    public function setTaskEndTime($taskEndTime){
        $this->taskEndTime = $taskEndTime;
        return $this;
    }

    public function setOrderEnd($orderEnd){
        $this->orderEnd = $orderEnd;
        return $this;
    }

    public function setOpUid($opUid){
        $this->opUid = $opUid;
        return $this;
    }

    protected function handleArray(){
        $data['taskEndTime'] = $this->taskEndTime;
        $data['taskStartTime'] = $this->taskStartTime;
        $data['orderId'] = $this->orderId;
        $data['isVerify'] = isset($this->isVerify)?$this->isVerify:0;
        $data['orderMoneyId'] = $this->moneyId;
        $data['taskCycle'] = $this->taskCycle;
        $data['taskName'] = $this->taskName;
        return $data;
    }

    protected function addLog($data){
        /*记录工单日志*/
        $log =  (new OrderOptionLog($this->orderId));
        $log->setOptionUserId($this->opUid);
        $log->setTaskId(0);
        $log->setOptionContent('任务分解');
        $log->setOptionType('RESOLVE');
        $log->setSubmitParameter(json_encode($data));
        $log->save();
        return true;
    }

    /**
     * 参数验证
     */
    protected function verifyParameter(){
        if(!isset($this->taskName) || empty($this->taskName)){
            exception('缺少任务名称');
        }
        $result = (new OrderInfoModel())->where('id',$this->orderId)->value('orderStatus');
        if($result != 0){
            exception('工单状态错误无法分解任务');
        }
        $result =  (new OrderMoneyModel())->where('id',$this->moneyId)->count();
        if(!$result){
            exception('任务id不存在');
        }
        if(empty($this->taskCycle) || !isset($this->taskCycle)){
            exception('缺少任务周期');
        }
        if(!is_numeric($this->taskCycle) || $this->taskCycle <= 0){
            exception('任务周期类型错误或者周期小于或等于0');
        }
        if(!isset($this->taskStartTime) || empty($this->taskStartTime)){
            exception('缺少任务开始时间');
        }
        if(!isset($this->taskEndTime) || empty($this->taskEndTime)){
            exception('缺少任务结束时间');
        }
        $map['taskStartTime'] = array('gt',$this->taskStartTime);
        $map['orderId'] =  $this->orderId;
        $result = (new OrderTaskModel())->where($map)->count('id');
        if($result){
            exception('时间区间错误');
        }
        if($this->taskEndTime>$this->orderEnd){
            exception('任务结束时间不允许大于工单结束时间');
        }
        return true;
    }
}