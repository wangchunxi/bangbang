<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018\5\27 0027
 * Time: 13:12
 */

namespace app\admin\controller;


use app\lib\AdminWeb\Table\Button\HeadBtn;
use app\lib\AdminWeb\Table\Form;
use app\lib\AdminWeb\Table\Table;
use app\lib\CreateModel\CreateModel;
use app\validate\OrderPanoramicLogValidate;
use cmf\controller\AdminBaseController;
use think\Url;

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
        /*设置页数*/
        //$model->setPage(8);
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

    public function form(){
        $form =  new Form();
        $radio = ['帅哥'=>1,'美女'=>2];
        $data = [
            ['roleTagName', '文本框',"text",'value值',"这是备注"],
            ['multiMap', '多图上传',"multiMap",'',"这是备注"],
            ['image', '单图上传',"image",'',"这是备注"],
            ['textarea', '文本域',"textarea",'',"这是备注"],
            ['baidu', '百度编辑器',"baidu",'',"这是备注"],
            ['radio','单选','radio',$radio,'','备注'],
            ['select','下拉选择','select',$radio,'','备注'],
            ['checkbox','复选','checkbox',$radio,'','备注']
            //['multiMap2', '多图上传',"multiMap",'',"这是备注"],
        ];
        $form->setData($data);
        $form->setTitle('我就是个测试表单');
        $form->setUrl();
        return $form->save();

    }


    public function formModel(){
        $form =  new Form();
        $data = [
            ['tableName', '文本框',"text",'',"这是备注"],
        ];
        $form->setData($data);
        $form->setTitle();
        $form->setUrl(Url::build('createModel'));
        return $form->save();
    }

    public function createModel(){
        $tableName = input('tableName');
        $model = new CreateModel();
        $model->setTableName($tableName)->save();
        return true;
    }

    public function test(){
        $data['orderId'] = '';
        $model =  new OrderPanoramicLogValidate();
        if(!$model->check($data)){
            dump($model->getError());
        }
    }
}