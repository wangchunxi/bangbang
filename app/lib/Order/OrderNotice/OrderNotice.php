<?php
/**
 * 工单信息通知类
 * User: Administrator
 * Date: 2018\7\14 0014
 * Time: 13:19
 */
namespace app\lib\Order\OrderNotice;
use app\lib\Order\IsOrder\IsOrder;
use app\lib\Order\OrderPaymentNotice\AddOrderNotice;

class OrderNotice
{
    private $orderId;
    private $opUid;
    public function __construct($orderId,$opUid)
    {
        $this->orderId = $orderId;
    }

    /**
     * 发布任务调用通知
     */
    public function releaseTask(){
        $title = 'XXX小区';
        $model = new AddOrderNotice();
        /*通知申请 下单时候未支付*/
        if((new IsOrder($this->orderId))->isFirstNoPay()){
            $notice = '尊敬的客户，您的工单【'.$title.'】工地就要开工了，请缴纳第一期工程款，延迟缴纳会影响工地进度，祝您生活愉快。';
            $model->setOpUid($this->opUid)->setOrderId($this->orderId)->setContent($notice)->AddOrderNoPayNotice();
        }else{
            $notice ='尊敬的客户，您的工单【'.$title.'】工地就要开工了，邦设计诚恳邀请您参加开工仪式，祝您生活愉快';
            /*通知师傅*/
            $sfNotice ='您有一个工地【'.$title.'】就要开工了，请准备好团队等待设计师电话联系';
            /*微信通知师傅*/
        }
        /*微信通知客户*/

        /*短信通知客户*/

        return true;
    }


}