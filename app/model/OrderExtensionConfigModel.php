<?php
/**
* Created by Think cli.
* Date: 2018-07-03 18:49:58
*/
namespace app\model;
use think\Model;
class OrderExtensionConfigModel extends Model
{


   /*
    * [备注信息:]
    * [数据类型:int]
    * [默认值:]
    */
   public $_id = "id";


   /*
    * [备注信息:标题]
    * [数据类型:varchar]
    * [默认值:]
    */
   public $_title = "title";


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
    * [备注信息:配置时间]
    * [数据类型:int]
    * [默认值:0]
    */
   public $_configTime = "configTime";


   /*
    * [备注信息:1=>'启用'，0=>'禁用',-1=>'删除']
    * [数据类型:tinyint]
    * [默认值:1]
    */
   public $_status = "status";


}