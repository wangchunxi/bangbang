<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018\6\12 0012
 * Time: 19:40
 */
namespace app\lib\EffectPicture;

use app\Lib\Model\Db\EffectPictureModel;

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
    protected $rule;
    protected $msg;
    protected $table;
    public function setEffectPictureTitle($effectPictureTitle){
        $this->effectPictureTitle = $effectPictureTitle ;
        return $this;
    }
    public function setIntroduction($Introduction){
        $this->Introduction = $Introduction ;
        return $this;
    }
    public function setTagIds($tagIds){
        if(empty($tagIds) || !is_array($tagIds)){
            exception('标签格式错误');
        }
        $this->tagIds= implode(',',$tagIds);
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
    protected function getCheckRule(){
        $this->rule = [
            'effectPictureTitle'=>'require|chsDash',
            'Introduction'=>'chsDash',
            'status'=>'number',
            'sort'=>'number',
            'isRecommend'=>'number',
            'coverPicture'=>'number',
            'viewingCount'=>'number',
        ];
        $this->msg = [
            'effectPictureTitle.require'=>'标题必须填写',
            'effectPictureTitle.chsDash'=>'标题只能为字母、汉字、数字、下划线',
            'Introduction.chsDash'=>'简介只能为字母、汉字、数字、下划线',
            'status.number'=>'未获取到状态码',
            'sort.number'=>'排序只能为数字',
            'isRecommend.number'=> '推荐状态错误',
            'coverPicture.number'=>'未获取到封面图',
            'viewingCount.number'=>'未获取到浏览数据',
        ];
    }

    protected function getTable(){
        if(empty($this->table)){
            $this->table = new EffectPictureModel();
        }
        return  $this->table;
    }

    protected function handleArray(){
        $this->getOpTime();
        $data['effectPictureTitle'] = $this->effectPictureTitle;
        $data['Introduction'] = $this->Introduction;
        $data['tagIds'] = $this->tagIds;
        $data['status'] = $this->status;
        $data['sort'] = $this->sort;
        $data['isRecommend'] = $this->isRecommend;
        $data['coverPicture'] = $this->coverPicture;
        $data['viewingCount'] = $this->viewingCount;
        return $data;
    }
}