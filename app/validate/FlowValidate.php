<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/7/19/019
 * Time: 21:21
 */

namespace app\validate;


use think\Validate;

class FlowValidate extends Validate
{
    protected $rule = [
        'money' =>'require|number',
        'createId' =>'require|number',
        'createTime' =>'require|number',
        'orderId' =>'require|number',
        'flowSn' =>'require',
        'flowContent' =>'require'
    ];

    protected $message = [
        'money.require' =>'流水金额必须',
        'money.number' =>'流水金额类型错误',
        'createId.require' =>'操作人必须',
        'createId.number' =>'操作人类型错误',
        'createTime.require' =>'创建时间必须',
        'createTime.number' =>'创建时间类型错误',
        'orderId.require' =>'工单id必须',
        'orderId.number' =>'工单类型错误',
        'flowSn.require' =>'流水号必须',
        'flowContent.require' =>'流水简介必须',
    ];
}