<?php
/**
 * 读取配置信息
 * User: wangcx
 * Date: 18-4-4
 * Time: 下午3:18
 */
namespace app\lib\ReadConfig;

use app\admin\controller\TestController;

class HandleLog
{
    protected $path;
    protected $filePath;
    public function __construct()
    {
        $this->path =   APP_PATH.'admin/controller';
        $this->filePath =  CMF_ROOT . "data/conf/handleLog.php";
    }

    /**
     * 获取旧的配置
     */
    protected function getOldConfig(){
        /*判断路径是否存在*/
        if(!file_exists($this->filePath))
        {
            file_put_contents($this->filePath,'');
        }
        $runtimeConfig =include $this->filePath ;
        if(!empty($runtimeConfig)){
            $runtimeConfig = json_decode($runtimeConfig,true);
        }
        return $runtimeConfig;
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
     * @return string
     */
    protected function getAction($controller){
        $result =  get_class_methods('app\admin\controller'.'\\'.$controller);
        $curFunctions = [
            '__construct',
            '__destruct',
            '__call',
            '__callStatic',
            '__get',
            '__set',
            '__isset',
            '__unset',
            '__sleep',
            '__wakeup',
            '__toString',
            '__invoke',
            '__set_state',
            '__clone',
            '__debugInfo',
            '_initialize',
            '_initializeView',
            'initMenu'
            ];
        foreach ($result as $v){
            $func = trim($v);
            if(!in_array($func,$curFunctions)){
                $customerFunctions[$func] = '';
            }
        }
        return $customerFunctions;
    }

    /**
     * 数组重组
     */
    protected function handleArray(){
        $config =  $this->getOldConfig();
        $data  =  $this->getAllController();
        $newData = array();
        foreach ($data as $v){
            $value =  $this->getAction($v);
            $newData[$v]=$value;
            if(!empty($config)){
                foreach ($value as $k=>$val){
                    $newData[$v][$k] = empty($config[$v][$k])?'':$config[$v][$k];
                }
            }
        }
        return $newData;
    }

    public function save(){
        return $this->handleArray();
    }


}