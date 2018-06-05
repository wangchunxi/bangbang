<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018\5\29 0029
 * Time: 17:27
 */

namespace app\lib\AdminWeb\Table;


use think\Controller;

class Form extends Controller
{
    protected $title = '默认页面';
    protected $url = '';
    protected $data = [];

    public function setTitle($title =''){
        $this->title = $title;
        return $this;
    }

    public function setUrl($url = ''){
        $this->url = $url;
        return $this;
    }

    public function setData($data)
    {
        foreach ($data as $key=>$datum) {

            if(isset($datum[0]) && strpos($datum[0],"|") !== false){
                $fieldConfig=explode("|",$datum[0]);

                foreach ($fieldConfig as $k=>$v) {
                    if($k>0){
                        $configData=explode(":",$v);
                        $data[$key][$configData[0]]=isset($configData[1])?$configData[1]:true;
                    }
                }
                $data[$key][0]=$fieldConfig[0];
            }

            if(!isset($datum[3])){
                $data[$key][3]="";
            }
            if(!isset($datum[4])){
                $data[$key][4]="";
            }
            /*兼容select 可以允许部分只读*/
            if($data[$key][2] == 'select' && is_array($data[$key][4])){
                /*部分只读*/
                if(isset($data[$key][4]['noReadonly'])){
                    $data[$key]['noReadonly'] = explode(',',$data[$key][4]['noReadonly']);
                }
                if(isset($data[$key][4]['default'])){
                    $data[$key][4]= $data[$key][4]['default'];
                }
            }
            if($data[$key][2] == 'image' && empty($data[$key][3])){
                $data[$key][3] = "/public/assets/images/default-thumbnail.png";
            }
        }
        $this->data = $data;
        return $this;
    }

    public function save(){
        $this->assign('title',$this->title);
        $this->assign('submitUrl',$this->url);
        $this->assign('formData',$this->data);
        $result = $this->fetch('web/form');
        return $result;
    }
}