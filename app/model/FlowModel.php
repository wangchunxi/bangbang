<?php
/**
* Created by Think cli.
* Date: 2018-07-19 21:11:23
*/
namespace app\model;
use think\Model;
class FlowModel extends Model
{


   /*
    * [备注信息:]
    * [数据类型:int]
    * [默认值:]
    */
   public $_id = "id";


   /*
    * [备注信息:流水金额]
    * [数据类型:decimal]
    * [默认值:]
    */
   public $_money = "money";


   /*
    * [备注信息:流水添加时间]
    * [数据类型:int]
    * [默认值:]
    */
   public $_createId = "createId";


   /*
    * [备注信息:流水添加时间]
    * [数据类型:int]
    * [默认值:]
    */
   public $_createTime = "createTime";


   /*
    * [备注信息:对应工单id]
    * [数据类型:int]
    * [默认值:]
    */
   public $_orderId = "orderId";


   /*
    * [备注信息:流水编号]
    * [数据类型:varchar]
    * [默认值:]
    */
   public $_flowSn = "flowSn";


   /*
    * [备注信息:流水简介]
    * [数据类型:varchar]
    * [默认值:]
    */
   public $_flowContent = "flowContent";


}