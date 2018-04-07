<?php
/**
 * Created by PhpStorm.
 * User: wangcx
 * Date: 18-3-31
 * Time: 下午4:08
 */
namespace app\lib\Test;
use app\model\OrderInfoModel;
use app\model\OrderMoneyModel;
use app\model\OrderOptionLogModel;
use app\model\OrderTaskModel;

class OrderTest
{
    protected $orderId;
    protected $orderMoneyId;
    public function __construct($orderId)
    {
        $this->orderId = $orderId ;
    }

    /**
     * 检测下单
     * 1、验证是否下单
     * 2、验证价格是否对应
     * 3、验证是否存储工单日志
     * 4、验证存储日志的操作人是否一致
     */
    public function checkAddOrder(){
        $model =  new OrderInfoModel();

        $result =  $model->where('id',$this->orderId)->find();

        if(!$result){
            exception('下单失败');
        }

        $money =  (new OrderMoneyModel())->where('orderId',$this->orderId)->sum('money');
        if($result['orderTotal']!=$money){
            exception('总价不符');
        }

        $log = (new OrderOptionLogModel())
            ->where('orderId',$this->orderId)
            ->where('optionType','ADDORDER')
            ->find();
        if(!$log){
            exception('未获取到工单日志');
        }
        if($log['optionUserId']!=$result['createId']){
            exception('操作人无法对应');
        }
        return true;
    }

    /**
     * 检验分解任务
     */
    public function taskDecomposition(){
        $result = (new OrderInfoModel())->where('id',$this->orderId)->where('orderStatus',1)->count();
        if(!$result){
            exception('工单任务状态不符合');
        }
        $id =  (new OrderMoneyModel())->where('id',$this->orderId)->column('id');
        foreach ($id as $v){
            $result = (new OrderTaskModel())->where('orderMoneyId',$v)->count();
            if(!$result){
                exception('id为'.$v.'未有任务');
            }
        }
        $log = (new OrderOptionLogModel())
            ->where('orderId',$this->orderId)
            ->where('optionType','RESOLVE')
            ->find();
        if(!$log){
            exception('未获取到工单日志');
        }
        return true;
    }

    /**
     * 检验任务分解是否正确
     */
    public function checkReleaseTask(){
        /*工单状态是否正确*/
        $result =  (new OrderInfoModel())->where('id',$this->orderId)->where('orderStatus',2)->count();
        /*如果交付第一期的钱任务是否开始*/

        /*没交钱任务不能开始*/

        /*通知是否发送*/

        /*客户通知是否发送*/
    }
}