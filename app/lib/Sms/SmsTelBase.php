<?php
/**
 * 添加、修改基础模板
 * User: wangcx
 * Date: 18-4-3
 * Time: 下午5:49
 */

namespace app\lib\Sms;


class SmsTelBase
{
    protected $title;
    protected $pushTitle;
    protected $pushContent;
    protected $smsType;
    protected $discernCode;
    protected $opUid;
    protected $opTime;
    protected $rule;
    protected $msg;

    public function setTitle($title){
        $this->title =  $title;
        return $this;
    }
    public function setPushTitle($pushTitle){
        $this->pushTitle =  $pushTitle;
        return $this;
    }
    public function setPushContent($pushContent){
        $this->pushContent =  $pushContent;
        return $this;
    }
    public function setSmsType($smsType){
        $this->smsType =  $smsType;
        return $this;
    }
    public function setDiscernCode($discernCode){
        $this->discernCode =  $discernCode;
        return $this;
    }
    public function __construct($opUid)
    {
        $this->opUid =$opUid;
        $this->opTime =time();
    }

    protected function handleArray(){
        $data['title'] = $this->title;
        $data['pushTitle'] = $this->pushTitle;
        $data['pushContent'] = $this->pushContent;
        $data['smsType'] = $this->smsType;
        $data['discernCode'] = $this->discernCode;
        return $data;
    }

    protected function getRule(){
        $this->rule = [
            'title'=>'require',
            'pushTitle'=>'require',
            'pushContent'=>'require',
            'smsType'=>'require|alpha',
            'discernCode'=>'require|alpha'
        ];
    }

    protected function getMsg(){
        $this->msg = [
            'title.require'=>'短信模板标题不能为空',
            'pushTitle.require'=>'推送标题不能为空',
            'pushContent.require'=>'推送内容不能为空',
            'smsType.require'=>'短信类型不能为空',
            'smsType.alpha'=>'模板类型只能为字母',
            'discernCode.require'=>'识别码不能为空',
            'discernCode.alpha'=>'识别码只能为字母',
        ];
    }

}