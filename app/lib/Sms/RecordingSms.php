<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/2/002
 * Time: 19:37
 */
namespace app\lib\Sms;
use app\model\SendSmsLogModel;

class RecordingSms
{
    protected $smsContent;
    protected $AcceptUid;
    protected $createTime;
    protected $sendType;
    protected $isSuccess;
    protected $smsId = 1 ;
    protected $orderId;
    protected $orderMoneyId;
    protected $orderTaskId;

    public function  setSmsContent($smsContent){
        $this->smsContent = $smsContent;
        return $this;
    }
    public function  setAcceptUid($AcceptUid){
        $this->AcceptUid = $AcceptUid;
        return $this;
    }
    public function  setSendType($sendType){
        $this->sendType = $sendType;
        return $this;
    }
    public function  setIsSuccess($isSuccess){
        $this->isSuccess = $isSuccess;
        return $this;
    }
    public function  setSmsId($smsId){
        $this->smsId = $smsId;
        return $this;
    }
    public function  setOrderId($orderId){
        $this->orderId = $orderId;
        return $this;
    }
    public function  setOrderMoneyId($orderMoneyId){
        $this->orderMoneyId = $orderMoneyId;
        return $this;
    }
    public function  setOrderTaskId($orderTaskId){
        $this->orderTaskId = $orderTaskId;
        return $this;
    }

    public function save(){
        $model = new SendSmsLogModel();
        $data[$model->_smsContent] =  $this->smsContent;
        $data[$model->_AcceptUid] =  $this->AcceptUid;
        $data[$model->_createTime] =  time();
        $data[$model->_sendType] =  $this->sendType;
        $data[$model->_isSuccess] =  $this->isSuccess;
        $data[$model->_smsId] =  $this->smsId ;
        $data[$model->_orderId] =  $this->orderId;
        $data[$model->_orderMoneyId] =  $this->orderMoneyId;
        $data[$model->_orderTaskId] =  $this->orderTaskId;
        $result =  $model->insert($data);
        if(!$result){
            exception('短信发送失败');
        }
        return true;
    }


}