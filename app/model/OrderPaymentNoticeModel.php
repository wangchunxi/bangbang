<?php
/**
* Created by Think cli.
* Date: 2018-06-25 20:45:21
*/
namespace app\model;
use think\Model;
class OrderPaymentNoticeModel extends Model
{


   /*
    * [备注信息:]
    * [数据类型:int]
    * [默认值:]
    */
   public $_id = "id";


   /*
    * [备注信息:工单id]
    * [数据类型:int]
    * [默认值:]
    */
   public $_orderId = "orderId";


   /*
    * [备注信息:交款期数id]
    * [数据类型:int]
    * [默认值:]
    */
   public $_moneyId = "moneyId";


   /*
    * [备注信息:0:待审核，1:审核成功已执行,-1拒绝执行]
    * [数据类型:tinyint]
    * [默认值:0]
    */
   public $_status = "status";


   /*
    * [备注信息:申请人：为0就为系统自动申请]
    * [数据类型:int]
    * [默认值:]
    */
   public $_applyId = "applyId";


   /*
    * [备注信息:申请时间]
    * [数据类型:int]
    * [默认值:]
    */
   public $_applyTime = "applyTime";


   /*
    * [备注信息:审核人：为0就为自动审核]
    * [数据类型:int]
    * [默认值:]
    */
   public $_verifyId = "verifyId";


   /*
    * [备注信息:审核时间]
    * [数据类型:int]
    * [默认值:]
    */
   public $_verifyTime = "verifyTime";

    /*
     * [备注信息:消息类型]
     * [数据类型:int]
     * [默认值:]
     */
   public $_type = "type";


}