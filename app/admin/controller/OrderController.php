<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/2/22/022
 * Time: 19:42
 */

namespace app\admin\controller;


use app\lib\Order\AddOrder;
use app\lib\Order\AddOrderMoney;
use app\lib\Order\AddOrderTask;
use app\lib\Order\OrderList;
use app\lib\Order\OrderOption;
use app\lib\Order\OrderOptionLog;
use app\model\OrderMoneyModel;
use app\model\OrderTaskModel;
use cmf\controller\AdminBaseController;
use think\Db;

class OrderController extends AdminBaseController
{

    public function index(){
        $model   = (new OrderList());
        $data =  $model->getList();
        $this->assign("page", $data['page']);
        $this->assign("list", $data['list']);
        return $this->fetch();
    }

    /**
     * 下单
     * @return mixed
     */
    public function addOrder(){
//        try{
//            exception('测试');
//        }catch (\Exception $e){
//            $this->error($e->getMessage());
//        }
        return $this->fetch();
    }

    /**
     * 执行下单
     */
    public function addPost(){
        if($this->request->isPost()){
            Db::transaction(function(){
                try{
                    $post = input('post.');
                    $money =  $post['post']['money'];
                    $photoUrls = $post['orderImage'];
                    $post = $post['post'];
                    if( $post['orderTotal'] != array_sum($money)){
                        exception('每期交款数不等于工单总价值');
                    }
                    $addOrder =  new AddOrder(cmf_get_current_admin_id());
                    $addOrder->setOrderContent($post['orderContent']);
                    $addOrder->setOrderCycle($post['orderCycle']);
                    $addOrder->setOrderDesigner($post['orderDesigner']);
                    $addOrder->setOrderImage(serialize($photoUrls));
                    $addOrder->setOrderName($post['orderName']);
                    $addOrder->setOrderStatus();
                    $addOrder->setOrderSupervisor($post['orderSupervisor']);
                    $addOrder->setOrderTotal($post['orderTotal']);
                    $addOrder->setOrderType($post['orderType']);
                    $addOrder->setUserAddress($post['userAddress']);
                    $addOrder->setUserTel($post['userTel']);
                    $addOrder->setOrderStartTime($post['orderStartTime']);
                    $orderId = $addOrder->save();
                    foreach ($money as $k=>$v){
                        $model = (new AddOrderMoney(1,$orderId,$k));
                        $model->setMoney($v);
                        $model->save();
                    }
                }catch (\Exception $e){
                    $this->error($e->getMessage());
                }
                return true;
            });
            $this->success('工单添加成功');
        }
    }

    /**
     * 任务分解
     */
    public function addTask(){
        if($this->request->isPost()){
            Db::transaction(function(){
                try{
                    $post = input('post');
                    $task = $post['task'];
                    /*修改工单状态*/
                    (new OrderOption($post['orderId']))
                        ->setOpUid(cmf_get_current_admin_id())
                        ->setData($post)->addOrderTask();
                    /*录入工单任务*/
                    foreach ($task as $k=>$v){
                        (new AddOrderTask($post['orderId']))->setOpUid(cmf_get_current_admin_id())
                            ->setIsVerify($v['isVerify'])->setMoneyId($k)->setOrderEnd($post['endTime'])
                            ->setTaskCycle($v['taskCycle'])->setTaskEndTime($v['taskEndTime'])
                            ->setTaskName($v['taskName'])->setTaskStartTime($v['taskStartTime'])->save();
                    }
                    $this->success('操作成功');
                }catch(\Exception $e){
                    $this->error($e->getMessage());
                }
            });
        }else{
            $result = (new OrderMoneyModel())->where('orderId',input('id'))->field('name,id,money')->select();
            //dump($result);
            $this->assign('result',$result);
            return $this->fetch();
        }
    }


    public function publishingTasks(){
        if($this->request->isPost()){
            Db::transaction(function(){
                try{
                    $post = input('post');
                    (new OrderOption($post['orderId']))
                        ->setData($post)->setOpUid(cmf_get_current_admin_id())
                        ->releaseTask();
                    $this->success('操作成功');
                }catch(\Exception $e){
                    $this->error($e->getMessage());
                }
            });
        }
    }


}