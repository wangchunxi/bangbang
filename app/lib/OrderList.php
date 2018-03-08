<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/8/008
 * Time: 20:02
 */

namespace app\lib;


use app\model\OrderInfoModel;

class OrderList
{
    protected $page;
    protected $keyword;
    protected $status;
    protected $limit = 10;

    public function  setPage($page = 1){
        $this->page = $page;
        return $this;
    }

    public function setKeyword($keyword){
        $this->keyword =  $keyword;
        return $this;
    }

    private function getParam(){

    }

    public function getList(){
        $map = $this->getParam();
        $model =  (new OrderInfoModel());
        $list = $model->where($map)->paginate($this->limit);
        $list->appends($map);
        $page = $list->render();
        $data['page'] = $page;
        $data['list'] = $list;
        return $data;
    }
}