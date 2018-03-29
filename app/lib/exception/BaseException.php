<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/24/024
 * Time: 17:31
 */
namespace app\lib\exception;


use think\Exception;

class BaseException extends Exception
{
    public  $code ;
    public $message ;
    public $errorCode ;
}