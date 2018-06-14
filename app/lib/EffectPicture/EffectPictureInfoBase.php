<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018\6\14 0014
 * Time: 18:56
 */

namespace app\lib\EffectPicture;


use app\model\EffectPictureInfoModel;

class EffectPictureInfoBase
{
    protected $effectPictureId;
    protected $assetId = [];
    protected $Introduction = [];
    protected $table;
    public function setEffectPictureId($id){
        $this->effectPictureId = $id;
        return $this;
    }

    public function setAssetId($assetId){
        if(empty($assetId) || !is_array($assetId)){
            exception('上传的图片格式不符合或未上传图片');
        }
        $this->assetId =$assetId;
        return $this;
    }

    public function setIntroduction($Introduction){
        $this->Introduction = $Introduction;
        return $this;
    }

    protected function checkData(){
        if(empty($this->effectPictureId) || !is_numeric($this->effectPictureId)){
            exception('主标题出现问题，请联系管理员');
        }
        if(count($this->Introduction)!=count($this->assetId)){
            exception('图片和简介数量不相符');
        }
        return true;
    }

    protected function handleArray(){
        $data=[];
        $Introduction = $this->Introduction ;
        foreach ($this->assetId as $k=>$v){
            $array = [];
            $array['assetId'] = $v;
            $array['Introduction'] = $Introduction[$k];
            $array['effectPictureId'] =$this->effectPictureId;
            $data[] = $array;
        }
        return $data;
    }

    protected function getTable(){
        if(empty($this->table)){
            $this->table = new EffectPictureInfoModel();
        }
        return $this->table;
    }

}