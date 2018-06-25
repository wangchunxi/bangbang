<?php
/**
 * 上传工单3d效果图基类
 * User: Administrator
 * Date: 2018/6/23/023
 * Time: 22:26
 */

namespace app\lib\Order\OrderInfo;


use app\Lib\Model\Db\OrderPanoramicLogModel;
use app\lib\Order\IsOrder\IsOrder;
use app\validate\OrderPanoramicLogValidate;

class UploadOrderPanoramicBase
{
    protected $orderId;
    protected $opUid;
    protected $Introduction;
    protected $coverPictureId;
    protected $panoramicId;
    protected $table;
    protected $validate;

    public function setOrderId($orderId){
        $this->orderId = $orderId;
        return $this;
    }

    public function setOpUid($opUid){
        $this->opUid = $opUid;
        return $this;
    }

    public function setIntroduction($Introduction){
        $this->Introduction = $Introduction;
        return $this;
    }

    public function setCoverPictureId($coverPictureId){
        $this->coverPictureId = $coverPictureId;
        return $this;
    }

    public function setPanoramicId($panoramicId){
        $this->panoramicId = $panoramicId;
        return $this;
    }

    protected function arrangeArray(){
        /*工单是否存在*/
        (new IsOrder($this->orderId))->isExist();
        $model =  $this->getTable();
        $data[$model->_orderId] = $this->orderId;
        $data[$model->_coverPictureId] = $this->coverPictureId;
        $data[$model->_Introduction] = $this->Introduction;
        $data[$model->_panoramicId] = $this->panoramicId;
        return $data;
    }

    protected function getTable(){
        if(empty($this->table)){
           $this->table = new OrderPanoramicLogModel();
        }
        return $this->table;
    }

    protected function getValidate(){
        if(empty($this->validate)){
            $this->validate = new OrderPanoramicLogValidate();
        }
        return $this->validate ;
    }
}