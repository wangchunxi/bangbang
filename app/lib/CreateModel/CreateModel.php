<?php
namespace app\lib\CreateModel;
use think\Config;
use think\Db;

/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018\6\21 0021
 * Time: 17:10
 */

class CreateModel
{
    private  $all = false;
    private  $tableName ='';
    public function setAll($all){
        $this->all = $all;
        return $this;
    }

    public function setTableName($tableName){
        $this->tableName = $tableName;
        return $this;
    }

    private function getAllTable()
    {
        $list=Db::query("show tables;");
        $tableList=[];
        foreach ($list as $item) {
            foreach ($item as $val) {
                $tableList[]= $val;
            }
        }
        return $tableList;
    }

    public function save(){
        $tableArray = [];
        if(empty($this->all) && empty($this->tableName)){
            exception('缺少要生成的表格名称或者参数');
        }

        if($this->tableName && $this->all){
            exception('指定表格和全部生成只能选一个');
        }
        if($this->all){
            $tableArray = $this->getAllTable();
        }
        if($this->tableName){
            $tableArray = [$this->tableName];
        }
        foreach ($tableArray as $k=>$v){
            $this->createDbModel($v);
        }
        return true;
    }
    private function createDbModel($v)
    {
        $tableName = $v;
        $HAStable=Db::query("select COUNT(1) as num from information_schema.tables where table_name = '".$tableName
            ."' and table_schema = '".Config::get("database.database")."';   ");
        if($HAStable[0]["num"]<=0){
            exception("表".$tableName."不存在!");
        }

        $tableInfo=Db::query("select COLUMN_NAME,COLUMN_COMMENT,DATA_TYPE,COLUMN_DEFAULT from information_schema.COLUMNS where table_name = '".$tableName
            ."' and table_schema = '".Config::get("database.database")."';   ");

        if(count($tableInfo)<=0){
            return false;
        }

        $tableName=trim($tableName);
        $str = Config::get('database.prefix');
        if(substr($tableName,0,strlen($str)) == $str){
            $tableName= substr($tableName,strlen($str)-1,strlen($tableName));
        }
        else{
            exception("表".$tableName."必须".$str."开头");
            return false;
        }

        for(;strpos($tableName,"_")!==false;){
            $strIndex=strpos($tableName,"_");
            if($strIndex!==false){
                $replacestr=substr($tableName,$strIndex,2);
                $daxie= str_replace("_" ,"",strtoupper($replacestr)  );
                $tableName=str_replace($replacestr,$daxie,$tableName);
            }
        }
        $tableName.='Model';
        $string="\n";
        foreach ($tableInfo as $column_info) {

            $string.="\n   /*\n".
                "    * [备注信息:".$column_info['COLUMN_COMMENT']."]\n".
                "    * [数据类型:".$column_info['DATA_TYPE']."]\n".
                "    * [默认值:".$column_info['COLUMN_DEFAULT']."]\n".
                "    */\n".
                "   public $" ."_" .$column_info['COLUMN_NAME']." = \"".$column_info['COLUMN_NAME']."\"".";"."\n\n";
        }


        $filecontent='<?php
/**
* Created by Think cli.
* Date: ' .date("Y-m-d H:i:s").'
*/
namespace app\model;
use think\Model;
class '.$tableName.' extends Model
{
'.$string.'
}';

        $filename=APP_PATH."/model/".$tableName.".php";
        $this->wf($filename,$filecontent);
        return true;
    }

    function wf($file="newfile.txt",$content=""){
        $myfile = fopen($file, "w") or die("Unable to open file!");
        fwrite($myfile, $content);
        fclose($myfile);
    }




}