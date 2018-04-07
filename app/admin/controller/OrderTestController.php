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
use app\lib\Order\AddOrderTask;
use app\lib\Order\GetOrder;
use app\lib\Order\OrderList;
use app\lib\Order\OrderOption;
use app\lib\Order\OrderOptionLog;
use app\lib\Test\OrderTest;
use app\model\OrderInfoModel;
use app\model\OrderMoneyModel;
use app\model\OrderTaskModel;
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
                $addOrder->setOrderStartTime($post['orderStartTime']);
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

    public function taskDecomposition(){
        Db::transaction(function(){
            try{
                $post = $this->getSubmitData();
                $task = $post['task'];
                foreach ($task as $k=>$value){
                    foreach($value as $v){
                        (new AddOrderTask($post['orderId']))->setOpUid(cmf_get_current_admin_id())
                            ->setIsVerify($v['isVerify'])->setMoneyId($k)->setOrderEnd($post['endTime'])
                            ->setTaskCycle($v['taskCycle'])->setTaskEndTime($v['taskEndTime'])
                            ->setTaskName($v['taskName'])->setTaskStartTime($v['taskStartTime'])->save();
                    }
                }
                $log =  (new OrderOptionLog($post['orderId']));
                $log->setOptionUserId(cmf_get_current_admin_id());
                $log->setTaskId(0);
                $log->setOptionContent('任务分解');
                $log->setOptionType('RESOLVE');
                $log->setSubmitParameter(json_encode($post));
                $log->save();
                (new OrderOption($post['orderId']))
                    ->setOpUid(cmf_get_current_admin_id())
                    ->setData($post)->addOrderTask();
                /*任务分解检验*/
                (new OrderTest($post['orderId']))->taskDecomposition();
                return true;
            }catch(\Exception $e){
                $url = Url('index','error='.$e->getMessage());
                $this->error($e->getMessage(),$url);
            }
        });
        echo '分解完成';
    }

    protected function getSubmitData(){
        $data =  (new GetOrder())->getOrder();
        $result = [];
        $task = [];
        $result['orderId'] = $data['orderInfo']['id'];
        $result['endTime'] = $data['orderInfo']['orderStartTime']+($data['orderInfo']['orderCycle']*24*3600);
        $start = ($data['orderInfo']['orderStartTime']);
        foreach ($data['orderMoney'] as $key=>$v){
            $num = 6;
            for($i=0;$i<$num;$i++){
                $task[$i+1]['taskName'] = $v['id'].'test';
                $task[$i+1]['taskCycle'] = 5;
                $task[$i+1]['taskStartTime'] =($start+(5*24*3600)*(($i+1)+($key*6)))-5*24*3600;
                $task[$i+1]['taskEndTime'] = $start+(5*24*3600)*(($i+1)+($key*6));
                $task[$i+1]['isVerify'] = 0;
            }
            $result['task'][$v['id']] = $task;
        }
        return $result;
    }

    /**
     * 任务发布
     */
    public function releaseTask(){
        Db::transaction(function(){
            try{
                $post['orderId'] = (new GetOrder())->getReleaseTaskOrderId();
                (new OrderOption($post['orderId']))
                    ->setData($post)->setOpUid(cmf_get_current_admin_id())
                    ->releaseTask();
                return true;
            }catch (\Exception $e){
                $url = Url('index','error='.$e->getMessage());
                $this->error($e->getMessage(),$url);
            }
        });
        echo  '任务发布成功';
    }


    public function test(){
        $order = (new OrderTaskModel())->where('orderId',17)->field('taskStartTime,taskEndTime')->select();
        foreach ($order as $v){
            echo date('Y-m-d',$v['taskStartTime']).'-----'.date('Y-m-d',$v['taskEndTime']);echo "<br/>";
        }
    }
}