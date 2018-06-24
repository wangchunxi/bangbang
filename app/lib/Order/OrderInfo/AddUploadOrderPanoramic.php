<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/24/024
 * Time: 0:20
 */

namespace app\lib\Order\OrderInfo;


class AddUploadOrderPanoramic extends UploadOrderPanoramicBase
{
    protected function validate(){
        $model = $this->getTable();
        $data = $this->arrangeArray();
        $data[$model->_createId] = $this->opUid;
        $data[$model->_createTime] = time();
        $validate = $this->getValidate();
        if(!$validate->scene('add')->check($data)){
            exception($validate->getError());
        }
        return $data;
    }

    public function save(){
        $data = $this->validate();
        $model = $this->getTable();
        $result =  $model->insert($data);
        if(!$result){
            exception('上传工单3D效果图失败失败');
        }
        return true;
    }
}