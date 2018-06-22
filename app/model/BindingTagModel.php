<?php
/**
* Created by Think cli.
* Date: 2018-06-22 13:33:44
*/
namespace app\Lib\Model\Db;
use think\Model;
class BindingTagModel extends Model
{


   /*
    * [备注信息:]
    * [数据类型:int]
    * [默认值:]
    */
   public $_id = "id";


   /*
    * [备注信息:被绑定的id]
    * [数据类型:int]
    * [默认值:0]
    */
   public $_bindingId = "bindingId";


   /*
    * [备注信息:绑定的标签]
    * [数据类型:int]
    * [默认值:]
    */
   public $_tagId = "tagId";


   /*
    * [备注信息:操作人]
    * [数据类型:int]
    * [默认值:]
    */
   public $_createId = "createId";


   /*
    * [备注信息:操作时间]
    * [数据类型:int]
    * [默认值:]
    */
   public $_createTime = "createTime";


   /*
    * [备注信息:绑定的类型]
    * [数据类型:varchar]
    * [默认值:]
    */
   public $_binBingType = "binBingType";


}