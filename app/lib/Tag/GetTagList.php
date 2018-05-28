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
                $map['a.tagStatus'] = $keyword['tagStatus'];
                unset($this->keyword['tagStatus']);
            }
            if(isset($keyword['tagType'])){
                $map['a.tagType'] = $keyword['tagType'];
                unset($this->keyword['tagType']);
            }
            if(isset($keyword['keyword'])){
                $map['a.tagName'] = ['like','%'.$keyword['keyword'].'%'];
            }
        }
        return $map;
    }

    public function getList(){
        $map = $this->getParam();
        $model =  (new TagModel());
        $join = [
            ['User u','u.id = a.createId','left']
        ];
        $list = $model->alias('a')->where($map)->join($join)
            ->field(
                'a.id,a.tagName,a.createId,a.createTime
                ,a.updateId,a.updateTime,a.tagId,a.tagType
                ,a.tagStatus,u.user_login as createName'
            )->paginate(1);
        $list->appends($this->keyword);
        $page = $list->render();
        $newList = [];
        foreach ($list as $k=>$v){
            $newList[$k] = $v->toArray();
            $newList[$k]['createTime'] = date('Y-m-d H:i:s',$v['createTime']);
        }
        $data['page'] = $page;
        $data['list'] = $newList;
        return $data;
    }
}