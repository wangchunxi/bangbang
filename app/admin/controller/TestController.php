<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/24/024
 * Time: 17:44
 */

namespace app\admin\controller;



use app\lib\DingDing\DingDingNotice;
use app\lib\exception\BaseException;
use think\Exception;

class TestController
{
    public function test(){
        try{

            throw new BaseException('wangc',11111,10000);
        }catch (Exception $e){
            throw  $e;
        }
        $webhook = "https://oapi.dingtalk.com/robot/send?access_token=2bc87d1b37a25b790e02534ad6bca312cbba2dd0e1a6aa0299ab32b37ec5250b";
        $message="你们好！";
        //(new DingDingNotice())->setWebHook($webhook)->setContent($message)->setAtMobiles(18680151308)->save();
    }
}