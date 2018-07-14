<?php
/**
 * 内部工单推送全部统一为钉钉推送
 * User: Administrator
 * Date: 2018/4/1/001
 * Time: 20:11
 */
namespace app\lib\Send;
use app\lib\SendNotice\DingDing\DingDingNotice;
use app\lib\Sms\RecordingSms;

class InternalPushOrder
{

    protected $orderId;
    protected $sendContent;
    protected $DingDingNotice;

    public function setOrderId($orderId){
        $this->orderId = $orderId;
        return $this;
    }

    public function setSendContent($sendContent){
        $this->sendContent = $sendContent;
        return $this;
    }
    protected function getDingDingModel(){
        if(!isset($this->DingDingNotice)){
            $this->DingDingNotice = new DingDingNotice();
        }
        return  $this->DingDingNotice;
    }

    public function masterSend(){
        /* TODO 获取推送群*/
        $webHook = "https://oapi.dingtalk.com/robot/Send?access_token=2bc87d1b37a25b790e02534ad6bca312cbba2dd0e1a6aa0299ab32b37ec5250b";
        $result = $this->getDingDingModel()->setWebHook($webHook)->setContent($this->sendContent)->save();
        /*记录推送日志*/
        (new RecordingSms())->setOrderId($this->orderId)
            ->setAcceptUid(0)->setIsSuccess(1)->setSendType('DingDing')->setSmsContent()->setSmsId()->save();
    }
}