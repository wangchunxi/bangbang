<?php
/**
 * 工单日志记录
 * User: Administrator
 * Date: 2018/3/24/024
 * Time: 17:05
 */

namespace app\lib;

use think\Exception;

class OrderOptionLog
{
    protected $optionUserId;
    protected $optionType;
    protected $optionTime;
    protected $orderId;
    protected $submitParameter;
    protected $resultBefore;
    protected $resultRear;
    protected $optionContent;
    protected $taskId;

    public function __construct($orderId)
    {
        $this->orderId = $orderId;
        $this->optionTime = time();
    }

    public function setOptionUserId($optionUserId){
        $this->optionUserId = $optionUserId;
        return $this;
    }
    public function setOptionType($optionType){
        $this->optionType = $optionType;
        return $this;
    }
    public function setSubmitParameter($submitParameter){
        $this->submitParameter = $submitParameter ;
        return $this;
    }
    public function setResultBefore($resultBefore){
        $this->resultBefore = $resultBefore;
        return $this;
    }
    public function setResultRear($resultRear){
        $this->resultRear = $resultRear;
        return $this;
    }
    public function setOptionContent($optionContent){
        $this->optionContent = $optionContent;
        return $this;
    }
    public function setTaskId($taskId){
        $this->taskId = $taskId;
        return $this;
    }

    /**
     * 参数验证
     */
    protected function check(){
        if(!isset($this->orderId) || empty($this->orderId)){
            throw new Exception();
            exception('未获取到参数id');
        }
    }

    public function save(){

    }
}