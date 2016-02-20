<?php
namespace Home\Service;

use Think\Model;

class LogService extends Model{
	/**
    **@auth qianqiang
    **@breif 获取所有的日志
    **@param projectCode 项目编码
    **@date 2016.2.19
    **/
	public function getAllLogs($projectCode){
		$objProject = M("Project");
        $condition["project_code"] = $projectCode;
        $condition["delete_flag"] = 0;
        $projectInfo = $objProject->where($condition)->find();
        $objLog = M("Log");
        $condition2["project_id"] = $projectInfo["id"];
        $logList = $objLog->where($condition2)->select();
        return $logList;
	}

	/**
    **@auth qianqiang
    **@breif 添加日志
    **@date 2016.2.20
    **/
    public function addLog($projectCode){
    	
    }
}