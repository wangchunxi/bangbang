<?php
/**
* Created by Think cli.
* Date: 2018-06-26 15:53:23
*/
namespace app\model;
use think\Model;
class OrderConstructionLogModel extends Model
{


   /*
    * [备注信息:]
    * [数据类型:int]
    * [默认值:]
    */
   public $_id = "id";


   /*
    * [备注信息:对应工单id]
    * [数据类型:int]
    * [默认值:]
    */
   public $_orderId = "orderId";


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
    * [备注信息:修改人]
    * [数据类型:int]
    * [默认值:]
    */
   public $_updateId = "updateId";


   /*
    * [备注信息:修改时间]
    * [数据类型:int]
    * [默认值:]
    */
   public $_updateTime = "updateTime";


   /*
    * [备注信息:提交内容]
    * [数据类型:text]
    * [默认值:]
    */
   public $_content = "content";


   /*
    * [备注信息:提交图片集合]
    * [数据类型:text]
    * [默认值:]
    */
   public $_img = "img";


   /*
    * [备注信息:顾客是否查看]
    * [数据类型:tinyint]
    * [默认值:0]
    */
   public $_IsCustomerSee = "IsCustomerSee";


   /*
    * [备注信息:查看用户id]
    * [数据类型:text]
    * [默认值:]
    */
   public $_seeUser = "seeUser";


}