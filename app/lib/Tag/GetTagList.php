<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018\5\15 0015
 * Time: 14:10
 */

namespace app\lib\Tag;


use app\model\TagModel;

class GetTagList
{
    protected $type;
    protected $keyword;
    protected $status;
    protected $limit = 10;
    public function __construct($type)
    {
        if(empty($type)){
            exception('未获取到type参数');
        }
        $this->type = $type;
    }

    public function setKeyword($keyword){
        $this->keyword =  $keyword;
        return $this;
    }

    public function setStatus($status){
        $this->status = $status;
        return $this;
    }

    private function getParam(){
        $map = [];
        $keyword = $this->keyword;
        if(!empty($keyword)){
            if(isset($keyword['tagStatus'])){
                $map['tagStatus'] = $keyword['tagStatus'];
            }
            if(isset($keyword['tagType'])){
                $map['tagType'] = $keyword['tagType'];
            }
        }
        return $map;
    }

    public function getList(){
        $map = $this->getParam();
        $model =  (new TagModel());
        $list = $model->where($map)->paginate($this->limit);
        $list->appends($this->keyword);
        $page = $list->render();
        $data['page'] = $page;
        $data['list'] = $list;
        return $data;
    }
}