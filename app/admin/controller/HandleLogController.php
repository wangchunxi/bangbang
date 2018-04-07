<?php
/**
 * Created by PhpStorm.
 * User: wangcx
 * Date: 18-4-7
 * Time: 下午1:28
 */

namespace app\admin\controller;


use app\lib\ReadConfig\HandleLog;
use cmf\controller\AdminBaseController;

class HandleLogController extends AdminBaseController
{
    public function index(){
        $path =   APP_PATH.'admin/controller';
        $result =  (new HandleLog($path))->save();
        $this->assign('result',$result);
        return $this->fetch();
    }
}