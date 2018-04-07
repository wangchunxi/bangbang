<?php
/**
 * 文件日志写入基类
 * User: wangcx
 * Date: 18-4-7
 * Time: 下午12:28
 */

namespace app\lib\WritingConfig;


class WritingBase
{
    protected $path;
    protected $fileName;

    /**
     * 设置文件路径
     * @param $path
     * @return $this
     */
    public function setPath($path){
        $this->path =  $path;
        return $this;
    }

    /**
     * 设置文件名称
     * @param $fileName
     * @return $this
     */
    public function setFileName($fileName){
        $this->fileName =  $fileName;
        return $this;
    }

    /**
     * 检查文件是否可以写入
     */
    protected function checkData(){
        /*判断路径是否存在*/
        if(!is_dir($this->path))
        {
            mkdir($this->path,'0777');
        }
        /*判断是否可以写入文件*/
        if(!file_exists($this->path.'/'.$this->fileName)){
            fopen($this->path.'/'.$this->fileName, "r+");
        }
        if(!is_writable($this->path.'/'.$this->fileName)){
            chmod( $this->path.'/'.$this->fileName, 0777);
        }
        return true;
    }

}