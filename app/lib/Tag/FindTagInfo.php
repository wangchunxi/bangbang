<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018\5\11 0011
 * Time: 15:04
 */

namespace app\lib\Tag;


use app\model\TagModel;

class FindTagInfo
{
    protected $tagId;
    protected $tagTable;
    public function __construct($tagId)
    {
        if(empty($tagId)){
            exception('未获取到TagId');
        }
        $this->tagId =  $tagId;
    }
    protected function getTable(){
        if(empty($this->tagTable)){
            $this->tagTable = new TagModel();
        }
        return $this->tagTable;
    }

    public function getInfo(){
        return  $this->getTable()->where('id',$this->tagId)->find();
    }


}