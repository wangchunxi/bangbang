<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018\7\3 0003
 * Time: 19:00
 */
namespace app\lib\Order\OrderExtensionConfig;
use app\model\OrderExtensionConfigModel;
use app\validate\OrderExtensionConfig;

class OrderExtensionConfigBase
{
    protected $title;
    protected $opUid;
    protected $time;
    protected $configTime;
    protected $status = 1;
    protected $table ;
    protected $validate;
    public function setTitle($title){
        $this->title = $title;
        return $this;
    }
    public function setOpUid($opUid){
        $this->opUid = $opUid;
        return $this;
    }
    public function setConfigTime($configTime){
        $this->configTime = $configTime;
        return $this;
    }

    protected function getTable(){
        if(empty($this->table)){
            $this->table = new OrderExtensionConfigModel();
        }
        return $this->table;
    }

    protected function getValidate(){
        if(empty($this->validate)){
            $this->validate = new OrderExtensionConfig();
        }
        return $this->validate;
    }

    protected function handleArray(){
        $model = $this->getTable();
        $data[$model->_status] = $this->status;
        $data[$model->_title] = $this->title;
        $data[$model->_configTime] = ($this->configTime*3600);
        return $data;
    }
}