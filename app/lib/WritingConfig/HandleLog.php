<?php
/**
 * 写入日志配置
 * User: wangcx
 * Date: 18-4-4
 * Time: 下午3:14
 */
namespace app\lib\WritingConfig;
class HandleLog extends WritingBase
{
    protected $post;
    public function setPost($post){
        $this->post =  $post;
        return $this;
    }
    public function save(){
        $this->checkData();
        $str =  "<?php  return '".json_encode($this->post)."';";
        file_put_contents($this->path.'/'.$this->fileName,$str);
    }
}