<?php
/**
* Created by Think cli.
* Date: 2018-06-25 16:52:54
*/
namespace app\Lib\Model\Db;
use think\Model;
class OrderMoneyModel extends Model
{


   /*
    * [备注信息:]
    * [数据类型:int]
    * [默认值:]
    */
   public $_id = "id";


   /*
    * [备注信息:对应的工单id]
    * [数据类型:int]
    * [默认值:]
    */
   public $_orderId = "orderId";


   /*
    * [备注信息:简要说明]
    * [数据类型:varchar]
    * [默认值:]
    */
   public $_name = "name";


   /*
    * [备注信息:]
    * [数据类型:decimal]
    * [默认值:]
    */
   public $_money = "money";


   /*
    * [备注信息:0=>未交付,1=>已交付]
    * [数据类型:tinyint]
    * [默认值:0]
    */
   public $_status = "status";


   /*
    * [备注信息:添加人]
    * [数据类型:int]
    * [默认值:]
    */
   public $_createId = "createId";


   /*
    * [备注信息:添加时间]
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


}