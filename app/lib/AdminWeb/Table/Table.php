<?php
/**
 * 后台列表通用页面
 * User: Administrator
 * Date: 2018\5\27 0027
 * Time: 12:12
 */
namespace app\lib\AdminWeb\Table;
use think\Controller;

class Table extends Controller
{
    protected $table = [];
    protected $tableData =[];
    protected $page='';
    protected $operating = [];
    protected $submitUrl = '';
    protected $search  = [];
    protected $headBtn = [];
    protected $headNan = [];
    protected $title ='';
    /**
     * 设置表格
     * @param $tableHead
     * @return $this
     * @throws \Exception
     */
    public function setTable($tableHead){
        if(!is_array($tableHead)){
            exception('表格格式传递错误');
        }
        $this->table = $tableHead;
        return $this;
    }

    /**
     * 设置表格数据
     * @param $tableData
     * @return $this
     * @throws \Exception
     */
    public function setTableData($tableData){
        if(!is_array($tableData) ){
            exception('表格数据格式传递错误');
        }
        $this->tableData  = $tableData;
        return $this;
    }

    /**
     * 设置表格page
     * @param $page
     * @return $this
     */
    public function setPage($page){
        $this->page = $page;
        return $this;
    }

    /**
     * 设置操作
     * @param $operating
     * @return $this
     * @throws \Exception
     */
    public function setOperating($operating){
        $this->operating = $operating;
        return $this;
    }

    /**
     * 设置查询条地址
     * @param $submitUrl
     * @return $this
     */
    public function setSubmitUrl($submitUrl){
        $this->submitUrl = $submitUrl;
        return $this;
    }

    /**
     * 设置查询搜索
     * @param $search
     * @return $this
     */
    public function setKeyWord($search){
        $this->search = $search;
        return $this;
    }

    /**
     * 设置头部按钮
     * @param $headBtn
     * @return $this
     */
    public function setHeadBtn($headBtn){
        $this->headBtn[] =$headBtn;
        return $this;
    }

    public function setTitle($title){
        $this->title = $title;
        return $this;
    }

    /**
     * 设置头部切换导航
     * @param $headNan
     * @return $this
     */
    public function setHeadNan($headNan){
        $this->headNan = $headNan;
        return $this;
    }

    public function save($tpl =''){
        $extendsTpl = '/web/index';
        $tpl =  empty($tpl)?'/web/index':$tpl;
        /*头部导航输出*/
        $headNan = $this->outputHeadNan();
        /*头部搜索按钮输出*/
        $headHandle = $this->outputHeadHandle();
        /*表格主体输出*/
        $table = $this->outputTable();
        /*页码输出*/
        $this->assign('page',$this->page);
        $this->assign('submitUrl',$this->submitUrl);
        $this->assign('title',$this->title);
        $this->assign('extendsTpl',$extendsTpl);
        $this->assign('headHandle',$headHandle);
        $this->assign('headNan',$headNan);
        $this->assign('table',$table);
        return $this->fetch($tpl);
    }

    /**
     * 输出Table主体
     * @return mixed
     */
    protected function outputTable(){
        $operatingStatus= false;
        if(!empty($this->operating)){
            $operatingStatus = true;
        }

        /*是否存在操作栏目*/
        $this->assign('operatingStatus',$operatingStatus);
        /*table结构输出*/
        $this->assign('tableHead',$this->table);
        /*table数据输出*/
        $this->assign('tableData',$this->tableData);
        return $this->fetch('/web/table');
    }

    /**
     * 输出头部操作
     */
    protected function outputHeadHandle(){
        $result = '';
        if(!empty($this->headBtn) || !empty($this->search)){
            $this->assign('headBtn',$this->headBtn);
            $this->assign('search',$this->search);
            $result = $this->fetch('web/headHandle');
        }
        return $result;
    }

    /**
     * 头部导航输出
     */
    protected function outputHeadNan(){
        $result = '';
        if(!empty($this->headNan) && is_array($this->headNan)){
            $controller = request()->controller();
            $action = request()->action();
            $url = $controller.'/'.$action;
            $data = [];
            foreach ($this->headNan as $k=>$v){
                $data[$k]['class'] = '';
                $data[$k]['url'] = $v;
                if(strtolower($url) == strtolower($v)){
                    $data[$k]['class'] = 'active';
                }
            }
            $this->assign('headNan',$data);
            $result = $this->fetch('web/headNan');
        }
        return $result;
    }
}