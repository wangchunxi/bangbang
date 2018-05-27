<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018\5\27 0027
 * Time: 13:12
 */

namespace app\admin\controller;


use app\lib\AdminWeb\Table\Button\HeadBtn;
use app\lib\AdminWeb\Table\Table;
use cmf\controller\AdminBaseController;

class DemoController extends AdminBaseController
{

    /*通用列表样式无需自建模板*/
    public function listDemo(){
        $array = [
            '测试'=>'test',
            '测试2'=>'test2',
            '测试3'=>'test3',
        ];

        $data =[
            ['test'=>'小王','test2'=>'小张','test3'=>'小李'],
            ['test'=>'小王1','test2'=>'小张1','test3'=>'小李1'],
            ['test'=>'小王2','test2'=>'小张2','test3'=>'小李2'],
        ];
        $btn = (new HeadBtn())->setBtnName('test')->setUrl(Url('index'))->save();
        return  (new Table())->setTable($array)->setTableData($data)->setHeadBtn($btn)->save();
    }

    /*特殊列表样式需自建模板 参考demo*/
    public function listDemos(){
        $array = [
            '测试'=>'test',
            '测试2'=>'test2',
            '测试3'=>'test3',
        ];
        $data =[
            ['test'=>'小王','test2'=>'小张','test3'=>'小李'],
            ['test'=>'小王1','test2'=>'小张1','test3'=>'小李1'],
            ['test'=>'小王2','test2'=>'小张2','test3'=>'小李2'],
        ];
        return  (new Table())->setTable($array)->setTableData($data)->save('/demo/index');
    }

}