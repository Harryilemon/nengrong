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
    **@param projectCode 项目编码
    **@param email 客服邮箱
    **@param logText 日志内容
    **@return 添加成功返回true，添加失败返回false
    **@date 2016.2.20
    **/
    public function addLog($projectCode, $email, $logText){
    	$objProject = M("Project");
        $condition["project_code"] = $projectCode;
        $condition["delete_flag"] = 0;
        $projectInfo = $objProject->where($condition)->find();
        $objUser = M("User");
        $condition2["email"] = $email;
        $condition2["delete_flag"] = 0;
        $userInfo = $objUser->where($condition2)->find();
        $objLog = M("Log");
        $data["project_id"] = $projectInfo["id"];
        $data["user_id"] = $userInfo["id"];
        $data["user_name"] = $userInfo["name"];
        $data["log_text"] = $logText;
        $data["create_date"] = date("Y-m-d H:i:s",time());
        $res = $objLog->add($data);
        if(!$res){
        	return false;
        }else{
        	return true;
        }
    }
}