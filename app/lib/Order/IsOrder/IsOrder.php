<?php
/**
 * 对工单的基本判断
 * User: Administrator
 * Date: 2018/6/24/024
 * Time: 0:40
 */

namespace app\lib\Order\IsOrder;


class IsOrder
{

    protected $id;
    protected $orderTable;
    public function __construct($id)
    {
        $this->id = $id;
    }


}