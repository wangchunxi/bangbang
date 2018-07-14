<?php
/**
 * 获取工单信息的
 * User: Administrator
 * Date: 2018\7\14 0014
 * Time: 12:15
 */

namespace app\lib\Order\OrderInfo;


use app\model\OrderInfoModel;

class GetOrderInfo
{
    private $orderId;
    private $orderInfo = [];
    private $cacheName;
    private $orderInfoTable = '';
    private $cache;
    private $valueName = '';
    public function __construct($orderId,$cache =true )
    {
        $this->orderId = $orderId;
        $this->cache = $cache;
        $this->cacheName =Md5(Md5('getOrderInfo_'.$orderId.'_Cache'));
        if($cache){
            if(cache($this->cacheName)){
                $this->orderInfo = json_decode(cache($this->cacheName),true);
            }
        }
    }

    private function getOrderInfoTable(){

        if(empty($this->orderInfoTable)){
            $this->orderInfoTable = new OrderInfoModel();
        }
        return $this->orderInfoTable;
    }

    /**
     * 获取工单的某个字段详情
     */
    private function getFiledValue(){
        if($this->cache){
            $this->getCacheValue();
        }else{
            $this->getDbValue();
        }
    }

    /**
     * 获取缓存字段详情
     */
    private function getCacheValue(){
        $this->IsExitCache();
        $orderInfo =  $this->orderInfo;
        return  isset($orderInfo[$this->valueName])?$orderInfo[$this->valueName]:'';
    }

    /**
     * 获取数据库字段详情
     */
    private function getDbValue(){
        $model = $this->getOrderInfoTable();
        return  $model->where($model->_id,$this->orderId)->value($this->valueName);
    }

    /**
     * 检验缓存是否存在不存在生存缓存
     */
    private function IsExitCache(){
        if(!$this->orderInfo){
            $this->orderInfo = $this->generateCache();
        }
    }

    /**
     * 生成缓存
     */
    private function generateCache(){
        $orderInfo = [];
        cache($this->cacheName,json_encode($orderInfo),7*86400);
        $this->orderInfo = $orderInfo;
    }

    /**
     * 删除工单缓存
     */
    public function delCache(){
        cache($this->cacheName,null);
        $this->orderInfo = [];
    }

    /**
     * 获取工单状态
     */
    public function getOrderStatus(){
        $model = $this->getOrderInfoTable();
        $this->valueName = $model->_orderStatus;
        return  $this->getFiledValue();
    }

    public function getOrderInfo(){
        $result = [];
        if($this->cache){
            $this->IsExitCache();
            $result = $this->orderInfo;
        }else{

        }
        return $result;
    }


}