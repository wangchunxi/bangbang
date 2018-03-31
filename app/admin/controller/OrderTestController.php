<?php
/**
 * 测试工单控制器
 * User: wangcx
 * Date: 18-3-31
 * Time: 下午2:12
 */
namespace app\admin\controller;
use app\lib\Order\AddOrder;
use app\lib\Order\AddOrderMoney;
use app\lib\Test\OrderTest;
use cmf\controller\AdminBaseController;
use think\Db;

class OrderTestController  extends AdminBaseController
{
    public function index(){
        echo input('error');
    }
    public function addOrder(){
        //Db::startTrans();
         Db::transaction(function(){
            $post['post']['orderType']='1';
            $post['post']['orderDesigner']='1';
            $post['post']['orderSupervisor']='1';
            $post['post']['orderName']='王生';
            $post['post']['userTel']='15826962999';
            $post['post']['userAddress']='湖北黄石';
            $post['post']['orderTotal']='10000';
            $post['post']['orderCycle']='90';
            $post['post']['money']['1']='3000';
            $post['post']['money']['2']='3000';
            $post['post']['money']['3']='4000';
            $post['post']['coverImage']='test';
            $post['post']['orderStartTime']='2018-03-31 14:33';
            $post['post']['orderContent']='<p>test</p>';
            try{
                $money =  $post['post']['money'];
                $photoUrls = isset($post['photo_urls'])?$post['photo_urls']:'test';
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
                $orderId = $addOrder->save();
                foreach ($money as $k=>$v){
                    $model = (new AddOrderMoney(1,$orderId,$k));
                    $model->setMoney($v);
                    $model->save();
                }
                /*下单检验*/
                (new OrderTest($orderId))->checkAddOrder();
                //Db::commit();
            }catch (\Exception $e){
                $url = Url('index','error='.$e->getMessage());
                $this->error($e->getMessage(),$url);
                //Db::rollback();
                return false;
            }
            return true;
        });
        echo '下单成功';
    }

}