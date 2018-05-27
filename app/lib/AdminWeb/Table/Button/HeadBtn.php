<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018\5\27 0027
 * Time: 16:51
 */

namespace app\lib\AdminWeb\Table\Button;


class HeadBtn extends ButtonBase
{
    public function __construct()
    {
        parent::__construct();
        $this->btnName="添加";
        $this->setStyleGreen();
    }

    public function save(){
        $this->assign("openType",$this->OpenType);
        return $this->fetch('/web/headBtn');
    }

}