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
use app\lib\ReadConfig\HandleLog;
use think\Exception;

class TestController
{
    public function test(){
        try{

            throw new BaseException('wangc',11111,10000);
        }catch (Exception $e){
            throw  $e;
        }
        $webhook = "https://oapi.dingtalk.com/robot/Send?access_token=2bc87d1b37a25b790e02534ad6bca312cbba2dd0e1a6aa0299ab32b37ec5250b";
        $message="你们好！";
        //(new DingDingNotice())->setWebHook($webhook)->setContent($message)->setAtMobiles(18680151308)->save();
    }




    public function test1(){
        $path =   APP_PATH.'admin/controller';
        dump((new HandleLog($path))->save());
    }

    public function test2(){
        $post =[
            "OrderController"=>[
                "index"=>"工单列表",
                "addOrder"=>"下单页面",
                "addPost"=>"下单",
                "addTask"=>"分解任务",
                "publishingTasks"=>"发布任务",
            ],
            "DialogController"=>[
                "map" =>""
            ],
            "HookController"=>[
                "index" => "",
                "plugins"=> "",
                "pluginListOrder"=>"",
                "sync" => "",
            ],
            "IndexController" => [
                "index" => ""
            ],
            "LinkController"=>[
                "index"=>  "",
                "add"=>  "",
                "addPost"=>  "",
                "edit"=>  "",
                "editPost"=>  "",
                "delete"=>  "",
                "listOrder"=>  "",
                "toggle"=>  "",
            ],
            "MailerController" =>[
                "index"=>  "",
                "indexPost"=>  "",
                "template"=>  "",
                "templatePost"=>  "",
                "test"=>  "",
            ],
            "MainController" =>[
                "index"=>  "",
                "dashboardWidget"=>  "",
            ],
            "MenuController" =>  [
                "index"=>  "",
                "lists"=>  "",
                "add"=>  "",
                "addPost"=>  "",
                "edit"=>  "",
                "editPost"=>  "",
                "delete"=>  "",
                "listOrder"=>  "",
                "getActions"=>  "",
            ],
            "NavController" => [
                "index"=>  "",
                "add"=>  "",
                "addPost"=>  "",
                "edit"=>  "",
                "editPost"=>  "",
                "delete"=>  "",
            ],
            "NavMenuController" => [
                "index"=>  "",
                "add"=>  "",
                "addPost"=>  "",
                "edit"=>  "",
                "editPost"=>  "",
                "delete"=>  "",
                "listOrder"=>  "",
            ],
            "OrderTestController" => [
                "index"=>  "",
                "addOrder"=>  "",
                "taskDecomposition"=>  "",
                "releaseTask"=>  "",
                "test"=>  ""
            ],
            "PluginController" =>  [
                "index"=>  "",
                "toggle"=>  "",
                "setting"=>  "",
                "settingPost"=>  "",
                "install"=>  "",
                "update"=>  "",
                "uninstall"=>  "",
            ],
            "PublicController"=> [
                "login"=>  "",
                "doLogin"=>  "",
                "logout"=>  "",
            ],
            "RbacController" => [
                "index"=>  "",
                "roleAdd"=>  "",
                "roleAddPost"=>  "",
                "roleEdit"=>  "",
                "roleEditPost"=>  "",
                "roleDelete"=>  "",
                "authorize"=>  "",
                "authorizePost"=>  "",
                "member"=>  "",
            ],
            "RecycleBinController" => [
                "index"=>  "",
                "restore"=>  "",
                "delete"=>  "",
            ],
            "RouteController"=> [
                "index"=>  "",
                "add"=>  "",
                "addPost"=>  "",
                "edit"=>  "",
                "editPost"=>  "",
                "delete"=>  "",
                "ban"=>  "",
                "open"=>  "",
                "listOrder"=>  "",
                "select"=>  "",
                "_suggest_url"=>  "",
                "_url_vars"=>  "",
            ],
            "SettingController"=> [
                "site"=>  "",
                "sitePost"=>  "",
                "password"=>  "",
                "passwordPost"=>  "",
                "upload"=>  "",
                "uploadPost"=>  "",
                "clearCache"=>  "",
            ],
            "SlideController"=> [
                "index"=>  "",
                "add"=>  "",
                "addPost"=>  "",
                "edit"=>  "",
                "editPost"=>  "",
                "delete"=>  "",
            ],
            "SlideItemController"=> [
                "index"=>  "",
                "add"=>  "",
                "addPost"=>  "",
                "edit"=>  "",
                "editPost"=>  "",
                "delete"=>  "",
                "ban"=>  "",
                "cancelBan"=>  "",
                "listOrder"=>  ""
            ],
            "SmsController"=> [
                "getSmsTelList"=>  "",
                "getSendSmsLogList"=>  "",
                "addSmsTel"=>  "",
            ],
            "StorageController"=> [
                "index"=>  "",
                "settingPost"=>  "",
            ],
            "TestController"=> [
                "test"=>  "",
                "test1"=>  "",
            ],
            "ThemeController"=>[
                "index"=>  "",
                "install"=>  "",
                "uninstall"=>  "",
                "installTheme"=>  "",
                "update"=>  "",
                "active"=>  "",
                "files"=>  "",
                "fileSetting"=>  "",
                "fileArrayData"=>  "",
                "fileArrayDataEdit"=>  "",
                "fileArrayDataEditPost"=>  "",
                "fileArrayDataDelete"=>  "",
                "settingPost"=>  "",
                "dataSource"=>  "",
            ],
            "UserController" =>[
                "index"=>  "",
                "add"=>  "",
                "addPost"=>  "",
                "edit"=>  "",
                "editPost"=>  "",
                "userInfo"=>  "",
                "userInfoPost"=>  "",
                "delete"=>  "",
                "ban"=>  "",
                "cancelBan"=>  "",
            ]
        ];
        (new \app\lib\WritingConfig\HandleLog())
            ->setPost($post)->setFileName('handleLog.php')
            ->setPath(CMF_ROOT.'data/conf')->save();

    }
}