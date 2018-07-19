<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/7/19/019
 * Time: 21:36
 */

namespace app\validate;


use think\Validate;

class FlowLogValidate extends Validate
{
    protected $rule = [
        'orderId'=>'require',
        'flowOn'=>'require',
        'createTime'=>'require',
        'createId'=>'require|number',
        'orderMoneyId'=>'require',
        'Money'=>'require|number',
        'payType'=>'require',
        'flowContent'=>'require',
        'flowType'=>'require|in:1,2,3',
        'is_admin'=>'require|in:0,1',

    ];
    protected $message = [
        'orderId.require'=>'工单id必须',
        'flowOn.require'=>'流水号必须1',
        'createTime.require'=>'创建时间必须',
        'createId.require'=>'创建人必须',
        'orderMoneyId.require'=>'交款期数必须',
        'Money.require'=>'流水金额必须',
        'Money.number'=>'流水金额必须数字',
        'payType.require'=>'支付类型必须',
        'flowContent.require'=>'流水简介必须',
        'flowType.require'=>'流水类型必须',
        'flowType.in:1,2,3'=>'流水类型错误',
        'is_admin.require'=>'是否是后台交款',
        'is_admin.in:0,1'=>'类型错误',
    ];
}