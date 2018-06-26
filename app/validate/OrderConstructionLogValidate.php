<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018\6\26 0026
 * Time: 16:13
 */

namespace app\validate;


use think\Validate;

class OrderConstructionLogValidate extends Validate
{
    protected  $rule = [
        'id' =>'require|number|gt:0',
        'orderId' =>'require|number|gt:0',
        'createId' =>'require|number|gt:0',
        'createTime' =>'require|number|gt:0',
        'updateId' =>'require|number|gt:0',
        'updateTime' =>'require|number|gt:0',
        'content' =>'require',
        'IsCustomerSee' =>'require|number',
        'seeUser'=>'require'
    ];
    protected  $message = [
        'id.require' =>'未获取到修改信息',
        'id.number' =>'要修改的信息格式错误',
        'id.gt:0' =>'要修改的信息格式错误<0',
        'orderId.require' =>'未获取到对应的工单信息',
        'orderId.number' =>'提供的工单信息格式错误',
        'orderId.gt:0' =>'提供的工单信息格式错误<0',
        'createId.require' =>'未获取到提交人信息',
        'createId.number' =>'提交人信息错误',
        'createId.gt:0' =>'提交人信息错误<0',
        'createTime.require' =>'未获取到提交时间',
        'createTime.number' =>'提交时间格式错误',
        'createTime.gt:0' =>'提交时间格式错误<0',
        'updateId.require' =>'未获取到修改人信息',
        'updateId.number' =>'修改人信息错误',
        'updateId.gt:0' =>'修改人信息错误<0',
        'updateTime.require' =>'未获取到修改时间',
        'updateTime.number' =>'修改时间格式错误',
        'updateTime.gt:0' =>'修改时间格式错误<0',
        'content.require' =>'工地日志内容不能为空',
        'IsCustomerSee.require' =>'顾客查看信息错误',
        'IsCustomerSee.number' =>'顾客查看信息错误',
        'seeUser.require'=>'用户查看不能为空'
    ];
    protected  $scene = [
        'add'=>['orderId','createId','createTime','content','IsCustomerSee'],
        'save'=>['orderId','updateId','updateTime','content','IsCustomerSee','id'],
        'seeUser'=>['seeUser'],
        'seeSave'=>['seeUser','IsCustomerSee'],
    ];
}