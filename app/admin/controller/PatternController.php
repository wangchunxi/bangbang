<?php
/**
 * 户型
 * User: Administrator
 * Date: 2018\4\26 0026
 * Time: 16:01
 */

namespace app\admin\controller;


class PatternController extends TagController
{
    public function patternIndex(){
        return $this->index('pattern');
    }

    public function addPattern(){
        return $this->add('pattern');
    }

    public function editPattern(){
        return $this->edit('pattern');
    }

    public function delPattern(){

    }

    public function changePattern(){

    }

}