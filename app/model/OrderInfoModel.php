<?php
/**
* Created by Think cli.
* Date: 2018-06-25 15:55:01
*/
namespace app\model;
use think\Model;
class OrderInfoModel extends Model
{


   /*
    * [备注信息:]
    * [数据类型:int]
    * [默认值:]
    */
   public $_id = "id";


   /*
    * [备注信息:下单人]
    * [数据类型:int]
    * [默认值:]
    */
   public $_createId = "createId";


   /*
    * [备注信息:下单时间]
    * [数据类型:int]
    * [默认值:]
    */
   public $_createTime = "createTime";


   /*
    * [备注信息:修改时间]
    * [数据类型:int]
    * [默认值:]
    */
   public $_updateTime = "updateTime";


   /*
    * [备注信息:修改人]
    * [数据类型:int]
    * [默认值:]
    */
   public $_updateId = "updateId";


   /*
    * [备注信息:工单编号]
    * [数据类型:varchar]
    * [默认值:]
    */
   public $_orderNum = "orderNum";


   /*
    * [备注信息:订单所属人姓名]
    * [数据类型:varchar]
    * [默认值:]
    */
   public $_orderName = "orderName";


   /*
    * [备注信息:订单所属人id]
    * [数据类型:int]
    * [默认值:]
    */
   public $_orderUid = "orderUid";


   /*
    * [备注信息:订单所属人电话]
    * [数据类型:varchar]
    * [默认值:]
    */
   public $_userTel = "userTel";


   /*
    * [备注信息:用户装修地址]
    * [数据类型:varchar]
    * [默认值:]
    */
   public $_userAddress = "userAddress";


   /*
    * [备注信息:用户工单地址转换为经纬度]
    * [数据类型:varchar]
    * [默认值:]
    */
   public $_userAddressNum = "userAddressNum";


   /*
    * [备注信息:订单总金额]
    * [数据类型:decimal]
    * [默认值:]
    */
   public $_orderTotal = "orderTotal";


   /*
    * [备注信息:工单装修类型]
    * [数据类型:tinyint]
    * [默认值:]
    */
   public $_orderType = "orderType";


   /*
    * [备注信息:装修总周期]
    * [数据类型:int]
    * [默认值:]
    */
   public $_orderCycle = "orderCycle";


   /*
    * [备注信息:效果图集合]
    * [数据类型:text]
    * [默认值:]
    */
   public $_orderImage = "orderImage";


   /*
    * [备注信息:工单装修风格简介]
    * [数据类型:text]
    * [默认值:]
    */
   public $_orderContent = "orderContent";


   /*
    * [备注信息:-1=>无效,1=>任务进行中,2=>任务完成]
    * [数据类型:tinyint]
    * [默认值:1]
    */
   public $_orderStatus = "orderStatus";


   /*
    * [备注信息:工单设计师]
    * [数据类型:int]
    * [默认值:]
    */
   public $_orderDesigner = "orderDesigner";


   /*
    * [备注信息:工单监理]
    * [数据类型:int]
    * [默认值:]
    */
   public $_orderSupervisor = "orderSupervisor";


   /*
    * [备注信息:工单推荐人]
    * [数据类型:int]
    * [默认值:0]
    */
   public $_orderRecommend = "orderRecommend";


   /*
    * [备注信息:工程开始时间]
    * [数据类型:int]
    * [默认值:]
    */
   public $_orderStartTime = "orderStartTime";


   /*
    * [备注信息:工单交付时间]
    * [数据类型:int]
    * [默认值:]
    */
   public $_orderEndTime = "orderEndTime";


   /*
    * [备注信息:工单封面图]
    * [数据类型:varchar]
    * [默认值:]
    */
   public $_coverImage = "coverImage";


}