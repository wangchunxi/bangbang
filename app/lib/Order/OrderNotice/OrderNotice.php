<?php
/**
 * 工单信息通知类
 * User: Administrator
 * Date: 2018\7\14 0014
 * Time: 13:19
 */
namespace app\lib\Order\OrderNotice;
use app\lib\Order\IsOrder\IsOrder;
use app\lib\Order\OrderInfo\GetOrderInfo;
use app\lib\Order\OrderMoney\AddOrderMoneyRecord;
use app\lib\Order\OrderPaymentNotice\AddOrderNotice;

class OrderNotice
{
    private $orderId;
    private $opUid;
    private $webHook;
    public function __construct($orderId,$opUid)
    {
        $this->orderId = $orderId;
        $this->webHook = "https://oapi.dingtalk.com/robot/send?access_token=2bc87d1b37a25b790e02534ad6bca312cbba2dd0e1a6aa0299ab32b37ec5250b";
    }

    /**
     * 发布任务调用通知
     */
    public function releaseTask(){
        $model = new AddOrderNotice();
        $orderInfo =  (new GetOrderInfo($this->orderId,false));
        $title = $orderInfo->getUserAddress();
        /*通知申请 下单时候未支付*/
        if((new IsOrder($this->orderId))->isFirstNoPay()){
            $notice = '尊敬的客户，您的工单【'.$title.'】工地就要开工了，请缴纳第一期工程款，延迟缴纳会影响工地进度，祝您生活愉快。';
            /*生成交款通知记录*/
            $result  = $model->setOpUid($this->opUid)->setOrderId($this->orderId)
                ->setContent($notice)->AddOrderNoPayNotice();
            /*生成待交款信息*/
            (new AddOrderMoneyRecord())->setOrderMoneyId()->setNoticeId($result)->noPay();
        }else{
            $notice ='尊敬的客户，您的工单【'.$title.'】工地就要开工了，邦设计诚恳邀请您参加开工仪式，祝您生活愉快';
            /*通知师傅*/
            $sfNotice ='您有一个工地【'.$title.'】就要开工了，请准备好团队等待设计师电话联系';
            /*微信通知师傅*/
        }
        /*微信通知客户*/

        /*短信通知客户*/
        /*钉钉测试通知 TODO*/
        (new DingDingNotice())->setContent($notice)->setWebHook($this->webHook)->save();
        return true;
    }


}