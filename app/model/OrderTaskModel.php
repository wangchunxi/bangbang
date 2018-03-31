<?php
/**
 * 工单任务分解表
 * User: Administrator
 * Date: 2018/3/18/018
 * Time: 22:28
 */

namespace app\model;


use think\Model;

class OrderTaskModel extends Model
{
    /**
     * 开始任务id
     * @param $orderId
     * @return bool|mixed
     * @throws \Exception
     */
    public function getStartId($orderId){
        if(empty($orderId)){
            exception('缺少参数');
        }
        $id = $this->where('id',$orderId)
            ->where('taskStatus',-1)
            ->value('id');
        if(!$id){
          return false;
        }
        return $id;
    }

    /**
     * 发布全部任务
     * @param $orderId
     * @return bool
     * @throws \Exception
     */
    public function publishingTasks($orderId){
        if(empty($orderId)){
            exception('缺少参数');
        }
        $result = $this->where('orderId',$orderId)
            ->update($data = ['taskStatus'=>-1]);
        if(!$result){
            return false;
        }
        return true;
    }

    /**
     * 完结任务
     * @param $orderId
     * @return bool
     * @throws \Exception
     */
    public function endTask($orderId){
        if(empty($orderId)){
            exception('缺少参数');
        }
        $startTime =  $this->where('id',$orderId)->value('ActualStartTime');
        $endTime =  time();
        $data = ['taskStatus'=>1,'ActualEndTime'=>$endTime,'ActualDay'=>$endTime-$startTime];
        $result = $this->where('id',$orderId)
            ->update();

        if(!$result){
            return false;
        }
        return true;
    }

    /**
     * 获取最大的任务id
     * @param $orderId
     * @return bool
     */
    public function getMaxId($orderId){
        $maxId = $this->where('id',$orderId)
            ->order('id desc')->value('id');
        if(!$maxId){
            return false;
        }
        return true;
    }


}