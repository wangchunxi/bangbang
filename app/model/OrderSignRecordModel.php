<?php
/**
* Created by Think cli.
* Date: 2018-07-03 18:31:02
*/
namespace app\model;
use think\Model;
class OrderSignRecordModel extends Model
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
    * [备注信息:通知id]
    * [数据类型:int]
    * [默认值:]
    */
   public $_noticeId = "noticeId";


   /*
    * [备注信息:签收人]
    * [数据类型:int]
    * [默认值:0]
    */
   public $_signId = "signId";


   /*
    * [备注信息:签收时间]
    * [数据类型:int]
    * [默认值:]
    */
   public $_signTime = "signTime";


   /*
    * [备注信息:0=>'未签收',1=>'签收']
    * [数据类型:tinyint]
    * [默认值:0]
    */
   public $_status = "status";


   /*
    * [备注信息:sys=>'后台代签收',user=>'用户签收']
    * [数据类型:varchar]
    * [默认值:]
    */
   public $_signType = "signType";


}