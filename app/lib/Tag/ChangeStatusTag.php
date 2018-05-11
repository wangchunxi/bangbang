<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018\5\11 0011
 * Time: 16:02
 */

namespace app\lib\Tag;


use app\model\TagModel;

class ChangeStatusTag
{
    protected $tagId;
    protected $tagStatus;
    protected $tagTable;
    public function __construct($tagId,$tagStatus)
    {
        if(empty($tagId)){
            exception('缺少tagId');
        }
        if(empty($tagStatus)){
           exception('缺少状态');
        }
        $this->tagId =  $tagId;
        $this->tagStatus = $tagStatus;
        $this->tagTable = new TagModel();
    }

    public function save(){
        $data['id'] = $this->tagId;
        $data['tagStatus'] = $this->tagStatus;
        $result =  $this->tagTable->update($data);
        if(!$result){
            exception('状态修改失败');
        }
        return true;
    }
}