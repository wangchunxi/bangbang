<?php
/**
* Created by Think cli.
* Date: 2018-06-29 11:25:59
*/
namespace app\model;
use think\Model;
class OrderMoneyRecordModel extends Model
{


   /*
    * [备注信息:]
    * [数据类型:int]
    * [默认值:]
    */
   public $_id = "id";


   /*
    * [备注信息:交款对应期数 bangbang_order_money]
    * [数据类型:int]
    * [默认值:]
    */
   public $_orderMoneyId = "orderMoneyId";


   /*
    * [备注信息:支付人（如是系统支付也要有支付人）]
    * [数据类型:int]
    * [默认值:]
    */
   public $_paymentId = "paymentId";


   /*
    * [备注信息:支付时间]
    * [数据类型:int]
    * [默认值:]
    */
   public $_paymentTime = "paymentTime";


   /*
    * [备注信息:0=>未交款,1=>已交款]
    * [数据类型:tinyint]
    * [默认值:0]
    */
   public $_status = "status";


   /*
    * [备注信息:sys=>系统自动,user=>用户自己]
    * [数据类型:varchar]
    * [默认值:sys]
    */
   public $_payType = "payType";


   /*
    * [备注信息:bangbang_order_payment_notice的 id]
    * [数据类型:int]
    * [默认值:]
    */
   public $_noticeId = "noticeId";

   public $_createTime = "createTime";


}