<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018\5\10 0010
 * Time: 11:17
 */

namespace app\lib\Tag;


use app\model\AssetModel;
use app\model\TagModel;

class OperatingTagBase
{
    protected $tagName;
    protected $tagUrl;
    protected $tagType;
    protected $tagStatus;
    protected $opUid;
    protected $opTime;
    protected $rule;
    protected $msg;
    protected $tagTable;
    public function __construct($opUid)
    {
        $this->opUid  =$opUid;
        $this->opTime = time();
    }

    public function setTagName($tagName){
        $this->tagName = $tagName;
        return $this;
    }
    public function setTagUrl($tagUrl){
        $this->tagUrl = $tagUrl;
        return $this;
    }
    public function setTagType($tagType){
        $this->tagType = $tagType;
        return $this;
    }
    public function setTagStatus($tagStatus){
        $this->tagStatus = $tagStatus;
        return $this;
    }

    protected function getTagId(){
        $result =0;
        if(isset($this->tagUrl) && !empty($this->tagUrl)){
            $result =  (new AssetModel())->getImgId($this->tagUrl);
        }
        return $result;
    }

    protected function getCheckRule(){
        $this->rule = [
            'tagName'=>'require',
            'tagType'=>'require|alpha',
            'tagStatus'=>'require|integer'
        ];
        $this->msg = [
            'tagName.require'=>'标签名称必须填写',
            'tagType.require'=>'标签类型必须传递',
            'tagType.alpha'=>'访问的方法只能是字母',
            'tagStatus.integer'=>'标签类型错误',
            'tagStatus.require'=>'标签状态必须传递',
        ];
    }
    protected function getTable(){
        if(empty($this->tagTable)){
            $this->tagTable = new TagModel();
        }
        return $this->tagTable;
    }
}