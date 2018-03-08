<?php
/**
 * 订单添加处理类
 * User: Administrator
 * Date: 2018/2/23/023
 * Time: 20:50
 */
namespace app\lib;
use app\model\OrderInfoModel;
use app\model\UserModel;

class AddOrder
{
    private $opUid;
    private $createTime;
    private $orderName;
    private $userTel;
    private $userAddress;
    private $orderTotal;
    private $orderType;
    private $orderCycle;
    private $orderImage;
    private $orderContent;
    private $orderStatus;
    private $orderDesigner;
    private $orderSupervisor;
    private $orderNum;
    private $orderUid;
    private $orderRecommend;
    /*经纬度*/
    private $userAddressNum;
    /***@var UserModel $userModel**/
    private $userModel;
    public function __construct($opUid = '')
    {
        $this->opUid =  $opUid;
        $this->createTime = time();
        $this->userModel =  new UserModel();
    }
    public function setOrderName($data=''){
        $this->orderName=$data;
        return $this;
    }
    public function setUserTel($data=''){
        $this->userTel=$data;
        return $this;
    }
    public function setUserAddress($data=''){
        $this->userAddress=$data;
        return $this;
    }
    public function setOrderTotal($data=''){
        $this->orderTotal=$data;
        return $this;
    }
    public function setOrderType($data=''){
        $this->orderType=$data;
        return $this;
    }
    public function setOrderCycle($data=''){
        $this->orderCycle=$data;
        return $this;
    }
    public function setOrderImage($data=''){
        $this->orderImage=$data;
        return $this;
    }
    public function setOrderContent($data=''){
        $this->orderContent=$data;
        return $this;
    }
    public function setOrderStatus($data=0){
        $this->orderStatus=$data;
        return $this;
    }
    public function setOrderDesigner($data=''){
        $this->orderDesigner=$data;
        return $this;
    }
    public function setOrderSupervisor($data=''){
        $this->orderSupervisor=$data;
        return $this;
    }
    /**
     * 生成工单号码
     */
    private function generateOrderNum(){
        $this->orderNum =  date('Ym').mt_rand(0,999999);
        return $this->orderNum;
    }

    /**
     * 获取用户id
     */
    private function getOrderUid(){
        $map = ['mobile'=>$this->userTel];
        $this->orderUid =  $this->userModel->getUserField($map);
        if(empty($this->orderUid)){
            exception('未获取到用户id');
        }
        return $this->orderUid;
    }

    /**
     * 获取当时用户的推荐人
     * @return int
     */
    private function getOrderRecommend(){
        $map = ['id'=>$this->orderUid];
        $this->orderRecommend=  $this->userModel->getUserField($map,'recommendId');
        return $this->orderRecommend;
    }

    /**
     * 用百度地图获取经纬度
     */
    private function userAddressNum(){
    }

    /**
     * 验证业主姓名
     * @throws \Exception
     */
    private function checkOrderName(){
        if(empty($this->orderName) || !isset($this->orderName)){
            exception('缺少业主姓名');
        }
        if(!preg_match("/^[x{4e00}-x{9fa5}]+$/u",$this->orderName)){
            exception('业主姓名只能是中文');
        }
        return true;
    }

    /**
     * 验证业主电话
     */
    private function checkUserTel(){
        if(!isset($this->userTel) || !is_numeric($this->userTel)){
            exception('手机号码格式应该全部为数字');
        }
        $tel = "15558530459";//手机号码
        if(strlen($this->userTel) <"11")
        {
            exception('手机号码长度小于11位');
        }
        if(!preg_match("/13[123569]{1}\d{8}|15[1235689]\d{8}|188\d{8}/",$this->userTel)){
            exception('手机号码格式错误');
        }
        return true;
    }
    /**
     * 参数验证
     */
    private function checkData(){
        /*验证业主姓名*/
       // $this->checkOrderName();
        /*验证业主电话*/
        //$this->checkUserTel();
        /*验证用户id*/
        if(!isset($this->orderUid) || empty($this->orderUid) || !is_numeric($this->orderUid)){
            exception('未获取工单顾客的id');
        }
        /*验证工单号是否生成*/
        if(!isset($this->orderNum) || empty($this->orderNum) ){
            exception('生成工单号失败');
        }
        /*验证是否输入用户地址*/
        if(!isset($this->userAddress) || empty($this->userAddress)){
            exception('未输入用户地址');
        }
        /*验证是否输入工单总价*/
        if(!isset($this->orderTotal) || empty($this->orderTotal)){
            exception('未输入工单总价');
        }
        /*验证输入工单总价是否正确*/
        if(!is_numeric($this->orderTotal) || $this->orderTotal<1000){
            exception('工单总价不为数字或者工单总价小于1000');
        }
        if(!isset($this->orderType) || empty($this->orderType) || !is_numeric($this->orderType)){
            //exception('装修类型未选择或者装修类型提交参数错误');
        }
        if(!isset($this->orderCycle) || empty($this->orderCycle)){
            exception('未输入工单周期');
        }
        if(!is_numeric($this->orderCycle) || $this->orderCycle<=1){
            exception('工单周期只能为数字或者输入的工单周期小于1天');
        }
        if(!isset($this->orderContent) || empty($this->orderContent)){
            exception('未输入装修理念');
        }
        if(!isset($this->orderDesigner) || empty($this->orderDesigner) ){
            exception('未选择工单设计师');
        }
        if(!isset($this->orderSupervisor) || empty($this->orderSupervisor)){
            exception('未选择工单监理');
        }

    }

    /**
     * 数据存库操作
     */
    public function save(){
        /*工单号*/
        $data['orderNum'] =         $this->generateOrderNum();
        /*工单推荐人*/
       // $data['orderRecommend'] =   $this->getOrderRecommend();
        $data['orderRecommend'] =   1;
        /*业主id*/
        $data['orderUid'] =         $this->getOrderUid();
        //$data['orderUid'] =         11;
        $data['createId'] =         $this->opUid;
        $data['createTime'] =       $this->createTime;
        $data['orderName'] =        $this->orderName;
        $data['userTel'] =          $this->userTel;
        $data['userAddress'] =      $this->userAddress;
        $data['orderTotal'] =       $this->orderTotal;
        $data['orderType'] =        $this->orderType;
        $data['orderCycle'] =       $this->orderCycle;
        $data['orderImage'] =       $this->orderImage;
        $data['orderContent'] =     $this->orderContent;
        $data['orderStatus'] =      0;
        $data['orderDesigner'] =    $this->orderDesigner;
        $data['orderSupervisor'] =  $this->orderSupervisor;
        $this->checkData();
        $model =  new OrderInfoModel();
        $result =  $model->insert($data);
        if(!$result){
            exception('新增工单失败');
        }
        $insId =  $model->getLastInsID();
        return $insId;
    }
}