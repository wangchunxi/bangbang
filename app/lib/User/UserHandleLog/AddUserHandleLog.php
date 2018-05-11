<?php
/**
 * 用户操作记录
 * User: wangcx
 * Date: 18-4-4
 * Time: 下午1:28
 */
namespace app\lib\User\UserHandleLog;
use app\model\UserHandleLogModel;
use think\Request;
use think\Validate;

class AddUserHandleLog
{
    protected  $opUid;
    protected  $opController;
    protected  $opAction;
    protected  $opIp;
    protected  $requestData;
    protected  $dataResult;
    protected  $opContent;

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
    public function setIp($ip){
        $this->opIp = $ip;
        return $this;
    }
    protected function getOpContent(){
        if (!file_exists( CMF_ROOT . "data/conf/handleLog.php")) {
            file_put_contents(CMF_ROOT . "data/conf/handleLog.php");
        }
        $runtimeConfig = include CMF_ROOT . "data/conf/handleLog.php";
        $runtimeConfig = json_decode($runtimeConfig,true);
        $content = '';
        if(isset( $runtimeConfig[$this->opController."Controller"][$this->opAction])){
            $content = $runtimeConfig[$this->opController."Controller"][$this->opAction];
        }
        $this->opContent = empty($content)?'未设置日志配置':$content;
        return $this;
    }
    protected function  validate($data){
        $rule = [
            'opUid'=>'require|integer',
            'opTime'=>'require|integer',
            'opAction'=>'require|alpha',
            'opController'=>'require|alpha',
            'opIp'=>'require',
            'opController'=>'require'
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
            'opIp.require'=>'ip地址不能为空',
            'opController.require'=>'操作内容不能为空'
        ];
        $validate = new Validate($rule,$msg);
        if(!$validate->check($data)){
            exception($validate->getError());
        }
        return true;
    }

    public function save(){
        $this->getOpContent();
        $data['opUid'] = $this->opUid;
        $data['opController'] = $this->opController;
        $data['opAction'] = $this->opAction;
        $data['opIp'] = $this->opIp;
        $data['opContent'] = $this->opContent;
        $data['opTime'] = time();
        $data['type'] = 'access';
        $this->validate($data);
        $result =  (new UserHandleLogModel())->insert($data);
        if(!$result){
            exception('操作日志记录失败');
        }
        return  (new UserHandleLogModel())->getLastInsID();
    }
}