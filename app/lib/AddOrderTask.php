<?php
/**
 * 任务分解
 * User: wangcx
 * Date: 18-3-16
 * Time: 下午7:21
 */

namespace app\lib;


use app\model\OrderInfoModel;
use app\model\OrderMoneyModel;
use app\model\OrderTaskModel;

class AddOrderTask
{
    protected $orderId;
    protected $taskName;
    protected $taskCycle;
    protected $moneyId;
    protected $isVerify = 0;
    protected $taskStartTime;
    protected $taskEndTime;


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

    protected function getTaskEndTime(){
        $this->taskEndTime = $this->taskStartTime+$this->taskCycle;
        return $this;
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
        $result =  (new OrderMoneyModel())->where()->count();
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
    }

    /**
     * 执行
     */
    public function save(){
        $data['taskEndTime'] = $this->getTaskEndTime();
        $data['taskStartTime'] = $this->taskStartTime;
        $data['orderId'] = $this->orderId;
        $data['isVerify'] = isset($this->isVerify)?$this->isVerify:0;
        $data['moneyId'] = $this->moneyId;
        $data['taskCycle'] = $this->taskCycle;
        $data['taskName'] = $this->taskName;
        $result = (new OrderTaskModel())->insert($data);
        if(!$result){
            exception('添加任务失败');
        }
        return true;
    }
}