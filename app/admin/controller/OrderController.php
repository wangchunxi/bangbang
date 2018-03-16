<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/2/22/022
 * Time: 19:42
 */

namespace app\admin\controller;


use app\lib\AddOrder;
use app\lib\AddOrderMoney;
use app\lib\OrderList;
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

    public function addOrder(){
        echo 1;
        return $this->fetch();
    }

    public function addPost(){
        if($this->request->isPost()){
            Db::transaction(function(){
                try{
                    $post = input('post.');
                    $money =  $post['post']['money'];
                    $photoUrls = $post['photo_urls'];
                    $post = $post['post'];
                    if( $post['orderTotal'] != array_sum($money)){
                        exception('每期交款数不等于工单总价值');
                    }

                    $addOrder =  new AddOrder(1);
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
                    $orderId = $addOrder->save();
                    foreach ($money as $k=>$v){
                        $model = (new AddOrderMoney(1,$orderId,$k));
                        $model->setMoney($v);
                        $model->save();
                    }
                }catch (\Exception $e){
                    $this->error(json_encode($e->getMessage()));
                }
                return true;
            });
            $this->success('工单添加成功');
        }
    }
}