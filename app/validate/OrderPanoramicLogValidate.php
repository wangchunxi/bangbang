<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/23/023
 * Time: 22:42
 */

namespace app\validate;


use think\Validate;

class OrderPanoramicLogValidate extends Validate
{
    protected $rule = [
        'orderId'=>'require|number',
        'coverPictureId'=>'number',
        'panoramicId'=>'number',
        'createId'=>'require|number',
        'createTime'=>'require|number',
        'updateId'=>'require|number',
        'updateTime'=>'require|number',
        'id'=>'require|number'
    ];
    protected $message  = [
        'orderId.require'=>'未获取到订单信息',
        'coverPictureId.number'=>'获取上传封面图格式错误',
        'panoramicId.number'=>'获取上传3d图格式错误',
        'createId.require'=>'未获取到上传人信息',
        'createId.number'=>'上传人信息有误',
        'createTime.require'=>'未获取到上传时间',
        'createTime.number'=>'上传时间有误',
        'updateId.require'=>'未获取到修改人信息',
        'updateId.number'=>'修改人信息有误',
        'updateTime.require'=>'未获取到修改时间',
        'updateTime.number'=>'修改时间有误',
        'id.require'=>'未获取到要修改的内容',
        'id.number'=>'修改内容有误'
    ];
    protected $scene = [
        'all'=>['orderId','coverPictureId','panoramicId','createId','createTime','updateId','updateTime'],
        'add'=>['orderId','coverPictureId','panoramicId','createId','createTime'],
        'edit'=>['orderId','coverPictureId','panoramicId','updateId','updateTime','id'],
    ];
}