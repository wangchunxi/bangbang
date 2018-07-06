<?php
/**
* Created by Think cli.
* Date: 2018-07-03 18:50:42
*/
namespace app\model;
use think\Model;
class OrderBindingExtensionModel extends Model
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
    * [备注信息:bangbang_order_extension_config id]
    * [数据类型:int]
    * [默认值:]
    */
   public $_configId = "configId";


   /*
    * [备注信息:创建人]
    * [数据类型:int]
    * [默认值:]
    */
   public $_createId = "createId";


   /*
    * [备注信息:创建时间]
    * [数据类型:int]
    * [默认值:]
    */
   public $_createTime = "createTime";


   /*
    * [备注信息:结束时间]
    * [数据类型:int]
    * [默认值:]
    */
   public $_endTime = "endTime";


   /*
    * [备注信息:1=>'正在使用',0=>'结束']
    * [数据类型:tinyint]
    * [默认值:1]
    */
   public $_status = "status";


}