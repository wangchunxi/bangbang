<?php
/**
 * 装修风格
 * User: Administrator
 * Date: 2018\4\26 0026
 * Time: 15:57
 */

namespace app\admin\controller;


class StyleController extends  TagController
{
    public function styleIndex(){
        $this->index();
    }

    public function addStyle(){
        return $this->add('style');
    }

    public function editStyle(){

    }

    public function delStyle(){

    }

    public function changeStyle(){

    }

}