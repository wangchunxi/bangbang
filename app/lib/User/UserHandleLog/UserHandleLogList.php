<?php
/**
 * 获取用户操作日志列表类
 * User: Administrator
 * Date: 2018/5/5/005
 * Time: 17:57
 */

namespace app\lib\User\UserHandleLog;

use app\model\UserHandleLogModel;
use app\model\UserModel;

class UserHandleLogList
{
    protected $keyword;
    protected $limit = 10;
    private $configArray = [
        'access'=>'访问',
        'changeStatus'=>'状态修改',
        'add'=>'添加',
        'del'=>'删除' ,
        'edit'=>'修改'
    ];


    public function setKeyword($keyword){
        $this->keyword =  $keyword;
        return $this;
    }

    private function getParam(){
        $map = [];
        $data =  $this->keyword;
        if(empty($data)){
           return $map;
        }

        switch ($data['keywordType'] && $data['keyword']){
            case 'userLogin':
                $map['opUid'] =  (new UserModel())->where('user_login',$data['keyword'])->value('id');
                break;
            case 'opController':
                $map['opController'] = $data['keyword'];
                break;
            case 'opAction':
                $map['opAction'] = $data['keyword'];
                break;
        }
        if($data['type']){
            $map['type'] =  $data['type'];
        }
        if(empty($data['startTime']) && $data['endTime']){
            $map['opTime'] =['ELT',$data['endTime']];
        }
        if(empty($data['endTime']) && $data['startTime']){
            $map['opTime'] =['EGT',$data['endTime']];
        }
        if($data['endTime'] && $data['startTime']){
            $map['opTime'] =['between',[$data['startTime'],['endTime']]];
        }
        return $map;
    }

    public function getList(){
        $map = $this->getParam();
        $model =  (new UserHandleLogModel());
        $list = $model->where($map)->alias('a')
            ->join('user','a.opUid = user.id')->order('opTime desc')
            ->field('a.id,a.opUid,a.opController,a.opAction,a.opContent,a.opTime,a.requestData
                ,a.opIp,a.resultId,a.type,user.user_login')
            ->paginate($this->limit);
        $list->appends($this->keyword);
        $page = $list->render();
        $data['page'] = $page;
        $data['list'] = $this->handleArray($list);
        return $data;
    }

    private function handleArray($list){
        foreach ($list as $k=>&$v){
            $v['typeStr'] = $this->configArray[$v['type']];
            $v['opTime'] = date('Y-m-d H:i:s',$v['opTime']);
            if(mb_strlen($v['requestData'])>50)
                $v['requestData'] = mb_substr($v['requestData'],0,50,'utf-8').'......';
        }
        return $list;
    }
}