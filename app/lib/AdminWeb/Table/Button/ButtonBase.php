<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018\5\27 0027
 * Time: 15:51
 */

namespace app\lib\AdminWeb\Table\Button;


use think\Controller;

class ButtonBase extends Controller
{
    protected $OpenType;
    protected $isDisabled;
    protected $style;
    protected $url;
    protected $btnName;
    public function __construct()
    {
        parent::__construct();
        $this->btnName="添加";
        $this->style="";
        $this->OpenType="NewTab";//打开方式
        $this->url="";
        $this->assign("btn_id","btn_id".rand(1000,99999));
        $this->assign("icoName",'');
    }


    public function setStyleDanger()
    {
        $this->style=" layui-btn-danger";
        $this->assign("style",$this->style);
        return $this;
    }

    public function setStyleBlue()
    {
        $this->style=" layui-btn-normal";
        $this->assign("style",$this->style);
        return $this;
    }

    public function setDisabled(){
        $this->isDisabled=true;
        return $this;
    }

    public function setStyleGreen()
    {
        $this->style="";
        $this->assign("style",$this->style);
        return $this;
    }

    /**
     * @param string $name
     *               fa-wrench:小扳手;
     *               fa-search:放大镜;
     *               fa-plus:加号;
     *               fa-plus:勾(√);
     *               fa-close:叉叉(×);
     * @return $this
     */
    public function setIcoName($name="fa-plus")
    {
        $this->assign("icoName",$name);
        return $this;
    }

    /**
     * 设置按钮名称
     * @param string $name
     * @return $this
     */
    public function setBtnName($name="")
    {
        $this->btnName=$name;
        $this->assign("btnName",$this->btnName);
        return $this;
    }

    public function confirm($text="",$ico=3)
    {
        $confirm=["text"=>$text,"ico"=>$ico];
        $this->assign("confirm",$confirm);
        return $this;
    }

    /**
     * 设置弹窗打开方式
     * @return $this
     */
    public function setOpenTypePop()
    {
        $this->OpenType="Pop";
        return $this;
    }

    /**
     * 设置新选项卡打开方式
     * @return $this
     */
    public function setOpenTypeNewTab()
    {
        $this->OpenType="NewTab";
        return $this;
    }

    /**
     * 设置新页面打开方式
     * @return $this
     */
    public function setOpenTypeNewPage()
    {
        $this->OpenType="NewPage";
        return $this;
    }

    /**
     * 设置新页面打开方式
     * @return $this
     */
    public function setOpenTypeAjax()
    {
        $this->OpenType="Ajax";
        return $this;
    }

    /**
     * 设置打开目标url
     * @param string $url
     * @return $this
     */
    public function setUrl($url = "")
    {
        $this->url=$url;
        $this->assign("btnUrl",$this->url);
        return $this;
    }
}