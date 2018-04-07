<?php
/**
 * 用户操作记录
 * User: wangcx
 * Date: 18-4-4
 * Time: 下午1:28
 */
namespace app\lib\User;
use app\model\UserHandleLog;
use think\Validate;

class AddUserHandleLog
{
    protected  $opUid;
    protected  $opController;
    protected  $opAction;
    protected  $remark;
    protected  $requestData;
    protected  $dataResult;

    public function setOpUid($opUid){
        $this->opUid = $opUid;
        return $this;
    }
    public function setOpController($opController){
        $this->opController = $opController;
        return $this;
    }
    public function setOpAction($opAction){
        $this->opAction = $opAction;
        return $this;
    }
    public function setRemark($remark){
        $this->remark = $remark;
        return $this;
    }
    public function setRequestData($requestData){
        $this->requestData = $requestData;
        return $this;
    }
    public function setDataResult($dataResult){
        $this->dataResult = $dataResult;
        return $this;
    }

    protected function  validate($data){
        $rule = [
            'opUid'=>'require|integer',
            'opTime'=>'require|integer',
            'opAction'=>'require|alpha',
            'opController'=>'require|alpha',
            'remark'=>'require',
        ];
        $msg = [
            'opUid.require'=>'操作人不能为空',
            'opUid.integer'=>'操作人类型错误',
            'opTime.require'=>'操作时间不能为空',
            'opTime.integer'=>'操作时间类型错误',
            'opAction.require'=>'访问的方法不能为空',
            'opAction.alpha'=>'访问的方法只能是字母',
            'opController.require'=>'访问的控制器不能为空',
            'opController.alpha'=>'访问的控制器只能是字母',
            'remark.require'=>'备注信息不能为空'
        ];
        $validate = new Validate($rule,$msg);
        if(!$validate->check($data)){
            exception($validate->getError());
        }
        return true;
    }

    public function save(){
        $data['opUid'] = $this->opUid;
        $data['opController'] = $this->opController;
        $data['opAction'] = $this->opAction;
        $data['remark'] = $this->remark;
        $data['requestData'] = $this->requestData;
        $data['dataResult'] = $this->dataResult;
        $data['opTime'] = time();
        $this->validate($data);
        $result =  (new UserHandleLog())->insert($data);
        if(!$result){
            exception('操作日志记录失败');
        }
        return true;
    }
}