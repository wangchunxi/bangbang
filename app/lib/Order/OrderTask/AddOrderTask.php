<?php
/**任务分解
 * User: wangcx
 * Date: 18-3-16
 * Time: 下午7:21
 */

namespace app\lib\Order\OrderTask;


use app\model\OrderInfoModel;
use app\model\OrderMoneyModel;
use app\model\OrderTaskModel;

class AddOrderTask extends OrderTaskBase
{

    /**
     * 执行
     */
    public function save(){
        $this->verifyParameter();
        $data = $this->handleArray();
        $data['createId'] = $this->opUid;
        $data['createTime'] = time();
        $result = (new OrderTaskModel())->insert($data);
        if(!$result){
            exception('添加任务失败');
        }
        return true;
    }
}