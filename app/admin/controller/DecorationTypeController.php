<?php
/**
 * 装修的类型风格
 * User: Administrator
 * Date: 2018\4\26 0026
 * Time: 16:11
 */

namespace app\admin\controller;


class DecorationTypeController extends TagController
{
    public function  decorationIndex(){
        return $this->index('decorationType');
    }

    public function addDecorationType(){
        return $this->add('decorationType');
    }

    public function editDecorationType(){
        return $this->index('decorationType');
    }

    public function delDecorationType(){

    }

    public function changeDecorationType(){

    }
}