<?php
/**
 * 处理发起支付通知
 * User: Administrator
 * Date: 2018\6\26 0026
 * Time: 13:30
 */

namespace app\lib\Order\OrderPaymentNotice;


class UpdateOrderNotice extends  OrderNoticeBase
{
    protected $id;
    public function __construct($id)
    {
        $this->id = $id;
    }

    /**
     * 同意发布支付通知
     * @return $this
     */
    public function agree(){
        $model = $this->getTable();
        $data[$model->_status] = 1;
        $data[$model->_type] = 'pay';
        return $this->save($data);
    }

    /**
     *拒绝发布支付通知
     */
    public function refuse(){
        $model = $this->getTable();
        $data[$model->_status] = -1;
        $data[$model->_type] = 'pay';
        return $this->save($data);
    }

    /**
     * 同意发布签收消息
     */
    public function agreeSign(){
        $model = $this->getTable();
        $data[$model->_status] = 1;
        $data[$model->_type] = 'sign';
        return $this->save($data);
    }

    /**
     * 同意发布签收消息
     */
    public function refuseSign(){
        $model = $this->getTable();
        $data[$model->_status] = -1;
        $data[$model->_type] = 'sign';
        return $this->save($data);
    }

    protected function save($data){
        $model = $this->getTable();
        $map =  [$model->_id=>$this->id,$model->_status=>0];
        $result = $model->where($map)->value($model->_id);
        if(empty($result)){
            exception('状态不能被审核或者已审核过了');
        }
        $data[$model->_id] = $this->id;
        $data[$model->_verifyId] = $this->opUid;
        $data[$model->_verifyTime] = time();
        $result =  $model->update($data);
        if(!$result){
            exception('审核失败');
        }
        return $result;
    }
}