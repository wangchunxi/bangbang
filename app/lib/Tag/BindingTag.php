<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018\6\21 0021
 * Time: 19:28
 */

namespace app\lib\Tag;


use app\Lib\Model\Db\BindingTagModel;
use app\validate\BindingTagValidate;

class BindingTag
{
    private $tagId;
    private $bindingId;
    private $bindingType;
    private $opUid;
    private $table;
    public function  setTagId($tagId){
        $this->tagId = $tagId;
        return $this;
    }

    public function setBindingId($bindingId){
        $this->bindingId = $bindingId;
        return $this;
    }

    public function setBindingType($bindingType){
        $this->bindingType = $bindingType;
        return $this;
    }

    public function setOpUidId($opUid){
        $this->opUid = $opUid;
        return $this;
    }


    public function save(){
        $model = $this->getTable();
        $map = [];
        $map[$model->_bindingId] = $this->bindingId;
        $map[$model->_binBingType] = $this->bindingType;
        $result = $model->where($model)->column($model->_id);
        if($result){
           $delResult = $model->where($map)->delete();
           if(!$delResult){
               exception('去除旧标签失败');
           }
        }
        $data = [];
        foreach ($this->tagId as $k=>$v){
            $dataArray = [];
            $dataArray[$model->_binBingType]=$this->bindingType;
            $dataArray[$model->_tagId] = $v;
            $dataArray[$model->_createId] = $this->opUid;
            $dataArray[$model->_createTime] = time();
            $data[] = $dataArray;
        }
        if(!empty($data)){
            $addResult = $model->insertAll($data);
            if(!empty($addResult)){
                exception('标签添加失败');
            }
        }
        return true;
    }

    private function checkData(){
        $model = $this->getTable();
        $data = [];
        $data[$model->_binBingType]=$this->bindingType;
        $data[$model->_tagId] = $this->tagId;
        $data[$model->_createId] = $this->opUid;
        $data[$model->_bindingId] = $this->bindingId;
        $validate = new BindingTagValidate();
        if(!$validate->scene('all')->check($data)){
            exception($validate->getError());
        }
        return true;
    }


    private function getTable(){
        if(empty($this->table)){
            $this->table = new BindingTagModel();
        }
        return $this->table;
    }
}