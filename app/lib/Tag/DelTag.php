<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018\5\11 0011
 * Time: 16:38
 */

namespace app\lib\Tag;


use app\model\TagModel;

class DelTag
{
    protected $tagId;
    protected $tagTable;
    public function __construct($tagId)
    {
        $this->tagId = $tagId;
        $this->tagTable = new TagModel();
    }

    public function save(){
        $this->tagTable->where('id',$this->tagId)->delete();
    }
}