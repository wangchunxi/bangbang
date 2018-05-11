<?php
/**
 * 上传附件库
 * User: Administrator
 * Date: 2018\5\10 0010
 * Time: 10:21
 */

namespace app\model;


use think\Model;

class AssetModel extends Model
{
    public function getImgId($imgUrl){
        $map['file_path'] = $imgUrl;
        return $this->where($map)->value('id');
    }
}