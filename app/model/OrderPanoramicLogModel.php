<?php
/**
* Created by Think cli.
* Date: 2018-06-23 22:29:27
*/
namespace app\Lib\Model\Db;
use think\Model;
class OrderPanoramicLogModel extends Model
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
    * [备注信息:创建时间]
    * [数据类型:int]
    * [默认值:]
    */
   public $_createTime = "createTime";


   /*
    * [备注信息:创建人]
    * [数据类型:int]
    * [默认值:]
    */
   public $_createId = "createId";


   /*
    * [备注信息:内容简介]
    * [数据类型:varchar]
    * [默认值:]
    */
   public $_Introduction = "Introduction";


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
    * [备注信息:封面图]
    * [数据类型:int]
    * [默认值:]
    */
   public $_coverPictureId = "coverPictureId";


   /*
    * [备注信息:全景图]
    * [数据类型:int]
    * [默认值:]
    */
   public $_panoramicId = "panoramicId";


}