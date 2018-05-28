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
        $model = (new Table());
        $nav = ['测试列表1'=>'demo/listdemo','测试列表2'=>'demo/listdemos'];
        //  (new Table())->setTable($array)->setTableData($data)->setHeadBtn($btn)->setHeadBtn($btn)->setHeadNan()->save();
        /*设置表格结构*/
        $model->setTable($array);
        /*设置表格数据*/
        $model->setTableData($data);
        /*设置表格头部按钮*/
        $model->setHeadBtn($btn);
        $model->setHeadBtn($btn);
        /*头部搜索操作*/
        $model->setKeyWord([
            ['filter', '测试',"text","",'输入厂商帐号/厂商名'],
            ['test', '',"text","",'test/厂商名'],
            ['other', '缺点',"checkbox",["高"=>1,"富"=>2,"帅"=>3],2],
        ]);
        /*设置头部切换导航*/
        $model->setHeadNan($nav);
        /*生成页面*/
        $result = $model->save();
        return $result;
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