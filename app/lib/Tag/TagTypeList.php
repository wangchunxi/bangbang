<?php
/**
 * 按类型获取标签
 * User: Administrator
 * Date: 2018\6\12 0012
 * Time: 19:22
 */

namespace app\lib\Tag;


use app\model\TagModel;

class TagTypeList
{
    private $type;
    private $key;
    public function __construct($type,$cache = true)
    {
        $this->type = $type;
        $this->key  = md5('getTagType'.$type.'List');
    }


    public function getList(){
        $result = [];

        if($this->cache){
           $result =  $this->getCache();
        }

        if(empty($result)){
            $map = ['status'=>1,'tagType'=>$this->type];
            $result =  (new TagModel())->where($map)->select();
        }

        if(!$result){
            return [];
        }

        $this->setCache($result);
        return $result;
    }

    public function clearCache(){
        cache($this->key,null);
        return true;
    }

    private function setCache($result){
        if($this->cache){
            cache($this->key,json_encode($result),(7*3600));
        }
        return true;
    }

    private function getCache(){
        $cache = cache($this->key);
        if(empty($cache)){
            return [];
        }
        return  json_decode($cache);
    }
}