<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018\6\14 0014
 * Time: 19:11
 */

namespace app\lib\EffectPicture;


class EditEffectPictureInfo extends EffectPictureInfoBase
{
    public function save(){
        $map['effectPictureId'] = $this->effectPictureId;
        $result = $this->getTable()->where($map)->value('id');
        if($result){
           if($this->getTable()->where($map)->delete()){
              exception('删除旧效果图图集失败请联系管理员');
           }
        }
        (new AddEffectPictureInfo())->save();
    }
}