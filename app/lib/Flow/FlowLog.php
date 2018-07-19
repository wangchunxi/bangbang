<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/7/19/019
 * Time: 21:00
 */

namespace app\lib\Flow;


use app\lib\Order\IsOrder\IsOrder;
use app\model\FlowLogModel;
use app\model\FlowModel;
use app\validate\FlowLogValidate;
use app\validate\FlowValidate;

class FlowLog extends FlowBase
{
    protected function checkFlowSn(){
        $this->getFlowSn();
        $model =  (new FlowModel());
        $flowLog = new FlowLogModel();
        $flowId =  $model->where($model->_flowSn,$this->flowSn)->value($model->_id);
        $flowLog =  $flowLog->where($flowLog->_flowOn,$this->flowSn)->value($flowLog->_id);
        if($flowId || $flowLog){
            $this->checkFlowSn();
        }
        return true;
    }
    protected function checkFlow(){
        /*验证流水号是否重复*/
        $this->checkFlowSn();
        /*验证工单ID是否存在*/
        if($this->orderId >0){
            $isOrder = (new IsOrder($this->orderId));
            if(!($isOrder->isExist())){
                exception('工单不存在');
            }
            if($this->orderMoneyId >0){
                if(!( $isOrder->isExistOrderMoney($this->orderMoneyId))){
                    exception('交款期数不存在');
                }
            }
        }
    }
    public function save(){
        $this->checkFlow();
        $model =  (new FlowModel());
        $data[$model->_createTime] = $this->createTime;
        $data[$model->_flowSn] = $this->flowSn;
        $data[$model->_orderId] = $this->orderId;
        $data[$model->_createId] = $this->createId;
        $data[$model->_flowContent] = $this->flowContent;
        $data[$model->_money]  = $this->money;
        $validate =  new FlowValidate();
        if(!$validate->check($data)){
            exception($validate->getError());
        }
        $result = $model->insert($data);
        if(!$result){
            exception('流水添加失败');
        }
        $this->recordFlowDetails();
        return  true;
    }

    protected function recordFlowDetails(){
        $model =  (new FlowLogModel());
        $validate =  new FlowLogValidate();
        $data[$model->_Money] = $this->money;
        $data[$model->_createId] = $this->createId;
        $data[$model->_createTime] = $this->createTime;
        $data[$model->_orderId] = $this->orderId;
        $data[$model->_flowOn] = $this->flowSn;
        $data[$model->_flowContent] = $this->flowDetails;
        $data[$model->_payType] = $this->payType;
        $data[$model->_flowType] = $this->flowType;
        $data[$model->_is_admin] = $this->is_admin;
        $data[$model->_orderMoneyId] = $this->orderMoneyId;
        if(!($validate)->check($data)){
            exception($validate->getError());
        }
        $result =  $model->insert($data);
        if(!$result){
            exception('流水添加失败');
        }
        return true;
    }
}