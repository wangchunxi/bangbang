<?php
/**
 * 用户表
 * User: Administrator
 * Date: 2018/2/23/023
 * Time: 22:03
 */

namespace app\model;
use think\Model;

class UserModel extends Model
{
    public function getUserField($array = [],$field = 'id'){
        foreach ($array as $k=>$v){
            $map[$k] = $v;
        }
        return $this->where($map)->value($field);
    }
}