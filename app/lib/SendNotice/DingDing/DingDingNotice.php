<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/24/024
 * Time: 21:06
 */
namespace app\lib\SendNotice\DingDing;
class DingDingNotice
{
    protected $content;
    protected $webHook;
    protected $isAt = false;
    protected $atMobiles;

    public function setContent($content){
        $this->content =$content;
        return $this;
    }

    public function setWebHook($webHook){
        $this->webHook = $webHook;
        return $this;
    }

    public function setIsAt($isAt){
        $this->isAt =  $isAt;
        return $this;
    }

    public function setAtMobiles($atMobiles){
        $this->atMobiles[] = $atMobiles;
        return $this;
    }
    protected function check(){
//        if(!isset($this->content) || empty($this->content) ){
//
//        }
//        if(!isset($this->webHook) || empty($this->webHook) ){
//
//        }

    }
    protected function getAt(){
        if($this->isAt){
            $this->atMobiles  = [];
        }
        $data = array(
            "atMobiles"=>$this->atMobiles,
            'isAtAll'=>$this->isAt,
        );
        return $data;
    }

    protected function getData(){
        $data = array (
            'msgtype' => 'text',
            'text' => array ('content' => $this->content),
            'at'=>$this->getAt(),
        );
        $data_string = json_encode($data);
        return $data_string;
    }
    public function save(){
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->webHook);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array ('Content-Type: application/json;charset=utf-8'));
        curl_setopt($ch, CURLOPT_POSTFIELDS, $this->getData());
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        // 线下环境不用开启curl证书验证, 未调通情况可尝试添加该代码
         curl_setopt ($ch, CURLOPT_SSL_VERIFYHOST, 0);
         curl_setopt ($ch, CURLOPT_SSL_VERIFYPEER, 0);
        $data = curl_exec($ch);
        curl_close($ch);
        return $data;
    }
}
