<?php
/**
 * Created by PhpStorm.
 * User: wangcx
 * Date: 18-4-7
 * Time: 下午1:28
 */

namespace app\admin\controller;


use app\lib\ReadConfig\HandleLog;
use cmf\controller\AdminBaseController;

class HandleLogController extends AdminBaseController
{
    public function index(){
        $path =   APP_PATH.'admin/controller';
        $result =  (new HandleLog($path))->save();
        $this->assign('result',$result);
        return $this->fetch();
    }


    public function save(){
        if($this->request->isPost()){
            try{
                $post = input('post.');
                $data = $post['data'];
                $result=  (new \app\lib\WritingConfig\HandleLog())
                    ->setPost($data)->setFileName('handleLog.php')
                    ->setPath(CMF_ROOT.'data/conf')->save();
                if(!$result){
                    exception('日志配置修改失败');
                }
            }catch (\Exception $e){
                $this->error($e->getMessage());
            }
            $this->success('操作成功');
        }else{
            $this->error('禁止访问',Url('index'));
        }
    }
}