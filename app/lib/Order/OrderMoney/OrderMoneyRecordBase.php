<?php
/**
 * 付款记录
 * User: Administrator
 * Date: 2018\7\14 0014
 * Time: 15:13
 */

namespace app\lib\Order\OrderMoney;


use app\lib\Flow\FlowLog;
use app\lib\Order\OrderNotice\PaymentNotice;
use app\lib\Order\OrderOption\OrderOptionLog;
use app\model\OrderMoneyModel;
use app\model\OrderMoneyRecordModel;
use app\validate\OrderMoneyRecord;

class OrderMoneyRecordBase
{
    protected $id;
    protected $orderMoneyId;
    protected $payType;
    protected $noticeId;
    protected $paymentId;
    protected $table = '';
    protected $flowTable = '';
    protected $validate = '';
    public function setOrderMoneyId($orderMoneyId =''){
        $this->orderMoneyId = $orderMoneyId;
        return $this;
    }
//    public function setOpUid($opUid =''){
//        $this->opUid = $opUid;
//        return $this;
//    }
    public function setPayType($payType =''){
        $this->payType = $payType;
        return $this;
    }
    public function setNoticeId($noticeId =''){
        $this->noticeId = $noticeId;
        return $this;
    }
    public function setPayUserId($userId){
        $this->paymentId = $userId;
        return $this;
    }
    protected function getModel(){
        if(empty($this->table)){
            $this->table = new OrderMoneyRecordModel();
        }
        return $this->table;
    }
    protected function getValidate(){
        if(empty($this->validate)){
            $this->validate = new OrderMoneyRecord();
        }
        return $this->validate;
    }
    /**
     * 数组处理
     * @return mixed
     */
    protected function handleArray(){
        $model =  $this->getModel();
        $data[$model->_noticeId] = $this->noticeId;
        $data[$model->_orderMoneyId]=$this->orderMoneyId;
        $data[$model->_status] = 0;
        return $data;
    }

    /**
     * 记录流水
     * @param $content
     * @param $details
     * @param $isAdmin
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    protected function recordFlow($content,$details,$isAdmin){
        $moneyModel =  (new OrderMoneyModel());
        $field = [
            $moneyModel->_money,$moneyModel->_orderId,$moneyModel->_name
        ];
        $map = [$moneyModel->_id=>$this->orderMoneyId];
        $info  = $moneyModel->where($map)->field($field)->find();
        $flow = (new FlowLog($this->paymentId));
        $flow->setPayType('admin')->setOrderMoneyId($this->orderMoneyId)->setOrderId($info[$moneyModel->_orderId])
            ->setMoney($info[$moneyModel->_money])->setFlowDetails($details.'【'.$info[$moneyModel->_name].'】')
            ->setFlowContent($content)->setFlowType(1)->setIsAdmin($isAdmin)->save();
        $this->writingOrderLog('PAYMONEY',$details.'【'.$info[$moneyModel->_name].'】',$info['orderId']);
        (new PaymentNotice($info['orderId'],$this->orderMoneyId))->save();
        return true;
    }

    /**
     * 记录工单日志
     * @param $type
     * @param $content
     * @param $orderId
     * @return bool
     */
    protected function writingOrderLog($type,$content,$orderId){
        $log =  (new OrderOptionLog($orderId));
        $log->setOptionType($type);
        $log->setOptionUserId($this->paymentId);
        $log->setOptionContent($content);
        $log->save();
        return true;
    }

}