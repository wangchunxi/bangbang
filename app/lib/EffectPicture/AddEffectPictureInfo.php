<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018\6\14 0014
 * Time: 19:10
 */

namespace app\lib\EffectPicture;


class AddEffectPictureInfo extends EffectPictureInfoBase
{

    public function save(){
        $data =  $this->handleArray();
        $result = $this->getTable()->insertAll($data);
        if(!$result){
            exception('新增效果图图集失败');
        }
        return $result;
    }
}