<?php
/**
 * 写入日志配置
 * User: wangcx
 * Date: 18-4-4
 * Time: 下午3:14
 */
namespace app\lib\WritingConfig;
class HandleLog
{
    protected $path;
    protected $file;

    public function __construct($path,$file)
    {
        $this->path =  $path;
        $this->file =  $file;
    }

    public function save(){

    }
}