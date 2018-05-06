<?php
/**
 * 对于赠删改的数据进行操作日志补全监控
 * User: Administrator
 * Date: 2018/5/5/005
 * Time: 17:37
 */

namespace app\lib\User\UserHandleLog;


use app\model\UserHandleLogModel;

class CompletionUserHandleLog
{
    /*请求参数*/
    protected  $requestData;
    /*数据结果*/
    protected  $dataResult;
    /*操作类型*/
    protected  $type;
    /*受影响的id*/
    protected  $resultId;
    /*要补全的日志id*/
    protected $logId;

    public function __construct($logId)
    {
        $this->logId  = $logId;
    }
    public function setRequestData($requestData){
        $this->requestData= $this->convertJson($requestData);
        return $this;
    }
    public function setDataResult($dataResult){
        $this->dataResult=  $this->convertJson($dataResult);
        return $this;
    }
    public function setType($type){
        $this->type= $type;
        return $this;
    }
    public function setResultId($resultId){
        $this->resultId= $resultId;
        return $this;
    }
    private function convertJson($data){
        if(!empty($data) && is_array($data)){
            return json_encode($data);
        }
        return $data;
    }
    public function save(){
        $data = [];
        $data['id'] = $this->logId;
        $data['requestData'] = $this->requestData;
        $data['dataResult'] =  $this->dataResult;
        $data['resultId'] = $this->resultId;
        $data['type'] = $this->type;
       // dump($data);
        (new UserHandleLogModel())->update($data);
        return true;
    }
}