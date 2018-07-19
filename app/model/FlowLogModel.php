<?php
/**
* Created by Think cli.
* Date: 2018-07-19 21:34:06
*/
namespace app\model;
use think\Model;
class FlowLogModel extends Model
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
    * [备注信息:生成的流水号]
    * [数据类型:varchar]
    * [默认值:]
    */
   public $_flowOn = "flowOn";


   /*
    * [备注信息:生成时间]
    * [数据类型:int]
    * [默认值:]
    */
   public $_createTime = "createTime";


   /*
    * [备注信息:生成的操作人]
    * [数据类型:int]
    * [默认值:]
    */
   public $_createId = "createId";


   /*
    * [备注信息:对应的工单交款期数]
    * [数据类型:int]
    * [默认值:]
    */
   public $_orderMoneyId = "orderMoneyId";


   /*
    * [备注信息:缴纳的钱数]
    * [数据类型:decimal]
    * [默认值:0.00]
    */
   public $_Money = "Money";


   /*
    * [备注信息:支付的类型alipay(支付宝),weixin(微信),other(其他)]
    * [数据类型:varchar]
    * [默认值:]
    */
   public $_payType = "payType";


   /*
    * [备注信息:流水内容]
    * [数据类型:varchar]
    * [默认值:]
    */
   public $_flowContent = "flowContent";


   /*
    * [备注信息:1=>工单流水,2=>监控扣款流水,3=>日常工资流水]
    * [数据类型:tinyint]
    * [默认值:1]
    */
   public $_flowType = "flowType";


   /*
    * [备注信息:是否是后台操作 0=>'不是'，1=》'是']
    * [数据类型:tinyint]
    * [默认值:0]
    */
   public $_is_admin = "is_admin";


}