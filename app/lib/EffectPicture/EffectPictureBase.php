<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018\6\12 0012
 * Time: 19:40
 */
namespace app\lib\EffectPicture;
class EffectPictureBase
{
    protected $effectPictureTitle ;/*标题*/
    protected $Introduction ;/*简介*/
    protected $tagIds;/*选择的对应标签*/
    protected $status =1;/*状态*/
    protected $sort = 0 ;/*排序*/
    protected $isRecommend  = 0;/*推荐*/
    protected $coverPicture ;/*封面图*/
    protected $viewingCount = 0 ;/*浏览数*/
    protected $opUid ;
    protected $opTime;

    public function setEffectPictureTitle($effectPictureTitle){
        $this->effectPictureTitle = $effectPictureTitle ;
        return $this;
    }
    public function setIntroduction($Introduction){
        $this->Introduction = $Introduction ;
        return $this;
    }
    public function setTagIds($tagIds){
        $this->tagIds= $tagIds;
        return $this;
    }
    public function setStatus($status){
        $this->status = $status;
        return $this;
    }

    public function setSort($sort){
        $this->sort = $sort;
        return $this;
    }

    public function setIsRecommend($isRecommend ){
        $this->isRecommend = $isRecommend  ;
        return $this;
    }

    public function setCoverPicture($coverPicture){
        $this->coverPicture = $coverPicture ;
        return $this;
    }


    public function setOpUid($opUid){
        $this->opUid = $opUid ;
        return $this;
    }

    protected function getOpTime(){
        $this->opTime= time();
        return $this;
    }
}