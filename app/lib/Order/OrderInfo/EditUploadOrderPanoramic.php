<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/24/024
 * Time: 0:20
 */

namespace app\lib\Order\OrderInfo;


class EditUploadOrderPanoramic extends UploadOrderPanoramicBase
{
    protected $id;
    public function __construct($id)
    {
        $this->id = $id;
    }

    protected function validate(){
        $model = $this->getTable();
        $data = $this->arrangeArray();
        $data[$model->_updateId] = $this->opUid;
        $data[$model->_updateTime] = time();
        $data[$model->_id] = $this->id;
        $validate = $this->getValidate();
        if(!$validate->scene('add')->check($data)){
            exception($validate->getError());
        }
        return $data;
    }

    public function save(){
        $data = $this->validate();
        $model = $this->getTable();
        $result =  $model->save($data);
        if(!$result){
            exception('修改工单3D效果图失败失败');
        }
        return true;
    }
}