<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018\6\22 0022
 * Time: 15:32
 */
namespace app\validate;
use think\Validate;

class BindingTagValidate extends Validate
{

    protected $rule = [
        'tagId'=>'require|array',
        'bindingId'=>'require|number',
        'bindingType'=>'require|alphaDash',
        'createId'=>'require|number',
    ];
    protected $message=[
        'tagId.require'=>'标签一定要选择',
        'tagId.array'=>'标签一定要选择',
        'bindingId.require'=>'未获取到要绑定参数',
        'bindingId.number'=>'绑定参数格式有误',
        'bindingType.require'=>'未获取到绑定类型参数',
        'bindingType.alphaDash'=>'绑定类型参数有误',
        'createId.require'=>'未获取到操作人',
        'createId.number'=>'操作人类型有误'
    ];
    protected $scene = [
        'all'=>'tagId,bindingId,bindingType,opUid'
    ];

}