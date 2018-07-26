<?php
/**
* Created by Think cli.
* Date: 2018-07-26 19:37:00
*/
namespace app\model;
use think\Model;
class SendSmsLogModel extends Model
{


   /*
    * [备注信息:]
    * [数据类型:int]
    * [默认值:]
    */
   public $_id = "id";


   /*
    * [备注信息:推送消息]
    * [数据类型:text]
    * [默认值:]
    */
   public $_smsContent = "smsContent";


   /*
    * [备注信息:接受人id]
    * [数据类型:int]
    * [默认值:]
    */
   public $_AcceptUid = "AcceptUid";


   /*
    * [备注信息:推送时间]
    * [数据类型:int]
    * [默认值:]
    */
   public $_createTime = "createTime";


   /*
    * [备注信息:推送工具DingDing(钉钉机器人),sms(短信推送)]
    * [数据类型:varchar]
    * [默认值:]
    */
   public $_sendType = "sendType";


   /*
    * [备注信息:是否成功]
    * [数据类型:tinyint]
    * [默认值:]
    */
   public $_isSuccess = "isSuccess";


   /*
    * [备注信息:对应的推送模板id]
    * [数据类型:int]
    * [默认值:1]
    */
   public $_smsId = "smsId";


   /*
    * [备注信息:工单id]
    * [数据类型:int]
    * [默认值:]
    */
   public $_orderId = "orderId";


   /*
    * [备注信息:工单交款期数id]
    * [数据类型:int]
    * [默认值:]
    */
   public $_orderMoneyId = "orderMoneyId";


   /*
    * [备注信息:工单任务id]
    * [数据类型:int]
    * [默认值:]
    */
   public $_orderTaskId = "orderTaskId";


}