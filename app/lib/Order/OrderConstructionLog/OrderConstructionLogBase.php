<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018\6\26 0026
 * Time: 15:42
 */
namespace app\lib\Order\OrderConstructionLog;
use app\lib\Order\IsOrder\IsOrder;
use app\model\OrderConstructionLogModel;
use app\validate\OrderConstructionLogValidate;

class OrderConstructionLogBase
{
    protected  $orderId;
    protected  $opUid;
    protected  $content;
    protected  $img;
    protected  $table;
    protected  $validate;
    public function setOrderId($orderId){
        $this->orderId = $orderId;
        return $this;
    }
    public function setOpUid($opUid){
        $this->opUid = $opUid;
        return $this;
    }
    public function setContent($content){
        $this->content = $content;
        return $this;
    }
    public function setImg($img){
        $this->img = $img;
        return $this;
    }

    protected function getTable(){
        if(empty($this->table)){
            $this->table = new OrderConstructionLogModel();
        }
        return $this->table;
    }

    protected function getValidate(){
        if(empty($this->validate)){
            $this->validate = new OrderConstructionLogValidate();
        }
        return $this->validate;
    }
    protected function arrange(){
        $model = $this->getTable();
        $isOrder = new IsOrder($this->orderId);
        if(!$isOrder->isExist()){
            exception('工单不存在');
        }
        if(!$isOrder->isReturnWordLog()){
            exception('该工单暂时不需要提交工地日志');
        }

        $data = [
            $model->_content => $this->content,
            $model->_orderId => $this->orderId,
            $model->_img => $this->img,
            $model->_IsCustomerSee => 0
        ];
        return $data;
    }
}