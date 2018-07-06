<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018\7\3 0003
 * Time: 19:17
 */

namespace app\validate;


use think\Validate;

class OrderExtensionConfig extends Validate
{
    protected $rule = [
        'id'=>'require|number',
        'title'=>'require',
        'createId'=>'require|number',
        'createTime'=>'require|number',
        'updateId'=>'require|number',
        'updateTime'=>'require|number',
        'configTime'=>'require|number|gt:0',
        'status'=>'require|number',

    ];
    protected $message = [
        'id.require'=>'未获取到数据',
        'id.number'=>'数据格式错误',
        'title.require'=>'标题必须',
        'createId.require'=>'未获取操作人员信息',
        'createId.number'=>'操作人员信息错误',
        'createTime.require'=>'未获取操作时间',
        'createTime.number'=>'操作时间错误',
        'updateId.require'=>'未获取修改人员信息',
        'updateId.number'=>'修改人员信息错误',
        'updateTime.require'=>'未获取修改时间',
        'updateTime.number'=>'修改时间错误',
        'configTime.require'=>'配置时间必须',
        'configTime.number'=>'配置时间格式错误',
        'status.require'=>'状态必须',
        'status.number'=>'状态数据错误',
    ];
    protected $scene = [
        'add'=>['title','createId','createTime','status','configTime'],
        'edit'=>['title','updateId','updateTime','status','configTime','id'],
    ];
}