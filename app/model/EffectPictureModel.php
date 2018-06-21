<?php
/**
* Created by Think cli.
* Date: 2018-06-21 19:19:27
*/
namespace app\Lib\Model\Db;
use think\Model;
class EffectPictureModel extends Model
{


   /*
    * [备注信息:]
    * [数据类型:int]
    * [默认值:]
    */
   public $_id = "id";


   /*
    * [备注信息:]
    * [数据类型:varchar]
    * [默认值:]
    */
   public $_effectPictureTitle = "effectPictureTitle";


   /*
    * [备注信息:]
    * [数据类型:text]
    * [默认值:]
    */
   public $_Introduction = "Introduction";


   /*
    * [备注信息:]
    * [数据类型:varchar]
    * [默认值:0]
    */
   public $_tagIds = "tagIds";


   /*
    * [备注信息:]
    * [数据类型:int]
    * [默认值:]
    */
   public $_createId = "createId";


   /*
    * [备注信息:]
    * [数据类型:int]
    * [默认值:]
    */
   public $_createTime = "createTime";


   /*
    * [备注信息:]
    * [数据类型:int]
    * [默认值:0]
    */
   public $_updateId = "updateId";


   /*
    * [备注信息:]
    * [数据类型:int]
    * [默认值:]
    */
   public $_updateTime = "updateTime";


   /*
    * [备注信息:0=>不显示，1=>显示]
    * [数据类型:tinyint]
    * [默认值:1]
    */
   public $_status = "status";


   /*
    * [备注信息:排序按降序排序]
    * [数据类型:int]
    * [默认值:0]
    */
   public $_sort = "sort";


   /*
    * [备注信息:1=>推荐，0=>默认]
    * [数据类型:tinyint]
    * [默认值:0]
    */
   public $_isRecommend = "isRecommend";


   /*
    * [备注信息:封面图]
    * [数据类型:int]
    * [默认值:]
    */
   public $_coverPicture = "coverPicture";


   /*
    * [备注信息:浏览数量]
    * [数据类型:int]
    * [默认值:0]
    */
   public $_viewingCount = "viewingCount";


}