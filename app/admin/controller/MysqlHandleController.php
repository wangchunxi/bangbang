<?php
/**
 * 数据库导入导出
 * User: Administrator
 * Date: 2018/5/5/005
 * Time: 12:16
 */

namespace app\admin\controller;


use app\lib\Mysql\Baksql;
use cmf\controller\AdminBaseController;

class MysqlHandleController extends AdminBaseController
{
    public function index(){
        $sql=new Baksql(\think\Config::get("database"));
        $list =  $sql->get_filelist();
      //  dump($list);
        $this->assign('list',$list);
        return $this->fetch();
    }

    /**
     *操作数据库
     */
    public function operating(){
        $sql=new Baksql(\think\Config::get("database"));
        $type = input('type');
        $name = input('name');
        $type = empty($type)?'backup':$type;
        switch ($type)
        {
            case "backup": //备份
                $result =  $sql->backup();
                break;
            case "dowonload": //下载
                $sql->downloadFile($name);
                break;
            case "restore": //还原
                $result =  $sql->restore($name);
                break;
            case "del": //删除
                $result =  $sql->delfilename($name);
                break;
        }
        $this->success($result);
    }
}