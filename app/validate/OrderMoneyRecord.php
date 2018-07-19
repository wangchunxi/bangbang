<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/7/19/019
 * Time: 19:56
 */

namespace app\validate;


use think\Validate;

class OrderMoneyRecord extends Validate
{
    protected $rule = [
        'id'=>'require|number',
        'orderMoneyId'=>'require|number',
        'paymentId'=>'require|number',
        'paymentTime'=>'require|number',
        'status'=>'require|number',
        'payType'=>'require',
        'noticeId'=>'require|number',
        'createTime'=>'require|number',
    ];

    protected $message = [
        'id.require'=>'id必须',
        'id.number'=>'id类型错误',
        'orderMoneyId.require'=>'交款id必须',
        'orderMoneyId.number'=>'交款id类型错误',
        'paymentId.require'=>'交款人必须',
        'paymentId.number'=>'交款人类型错误',
        'paymentTime.require'=>'交款时间必须',
        'paymentTime.number'=>'交款时间类型错误',
        'status.require'=>'状态必须',
        'status.number'=>'状态类型错误',
        'payType.require'=>'支付类型必须',
        'noticeId.require'=>'通知必须',
        'noticeId.number'=>'通知类型错误',
        'createTime.require'=>'创建时间必须',
        'createTime.number'=>'创建时间类型错误'
    ];

    protected $scene = [
        'noPay'=>['orderMoneyId','status','noticeId','createTime'],
        'pay'=>[
            'orderMoneyId','paymentId','paymentTime','status','payType','noticeId','createTime'
            ],
        'changePay'=>['paymentId','paymentTime','status','payType']
    ];
}