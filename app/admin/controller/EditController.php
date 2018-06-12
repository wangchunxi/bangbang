<?php
/**
 * 吃点啥
 * User: Administrator
 * Date: 2018/6/6/006
 * Time: 21:15
 */

namespace app\admin\controller;


use QL\Ext\AbsoluteUrl;
use QL\QueryList;
use think\Db;

class EditController
{
    public function index(){
        $rules = [
            'title' => ['div.category-recipe-list p.name a','text'],
            'name2' => ['div.category-recipe-list p.stats span.green-font','text'],
        ];
        $result = QueryList::get('http://www.xiachufang.com/category/40076/')->rules($rules)
            ->removeHead()->query()->getData();
        dump($result);
    }


    public function edit(){

    }


    public function getUrl(){
        $url =  Db('Pachong')->where('status',0)->field('url,id')->find();
        $urlStr = isset($url['url'])?$url['url']:'http://www.xiachufang.com';
        $rules = [
            'url' => ['a','href'],
            //'name2' => ['div.category-recipe-list p.stats span.green-font','text'],
        ];
        $result = QueryList::get($urlStr)->rules($rules)->query()->getData();
        $data = [];
        foreach ($result as $v){
            $array = [];
            if(substr($v['url'],0,1) == '/' && strlen($v['url']) >1){
                $array['url'] = 'http://www.xiachufang.com'.$v['url'];
                $array['status'] = 0;
                $array['pidUrl'] = $urlStr;
            }
            if(!empty($array)){
                $data[] = $array;
            }
        }
        $resultData = Db('Pachong')->insertAll($data);
        //if($resultData){
            if(isset($url['id']) && $url['id']>0){
                $save =[];
                $save['status'] = 1;
                $save['id'] = $url['id'];
                $saveResult = Db('Pachong')->update($save);
                if(!$saveResult){
                    echo '修改失败';
                    exit();
                }
            }
            $this->getUrl();
        //}

    }


}