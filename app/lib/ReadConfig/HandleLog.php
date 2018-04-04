<?php
/**
 * 读取配置信息
 * User: wangcx
 * Date: 18-4-4
 * Time: 下午3:18
 */

class HandleLog
{
    protected $path;
    public function __construct($path)
    {
        $this->path =  $path;
    }

    /**
     * 获取旧的配置
     */
    protected function getOldConfig(){

    }

    /**
     * 获取全部的控制器
     */
    protected function getAllController(){
        $pathList = glob($this->path . '/*.php');
        $result = [];
        foreach($pathList as $key => $value) {
            $result[] = basename($value, '.php');
        }
        return $result;
    }

    /**
     * 获取全部的方法
     * @param $controller
     */
    protected function getAction($controller){

    }

    /**
     * 数组重组
     */
    protected function handleArray(){

    }

    public function save(){

    }


}