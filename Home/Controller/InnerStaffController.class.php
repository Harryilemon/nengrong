<?php
namespace Home\Controller;

use Think\Controller;

class InnerStaffController extends Controller {
    
    /**
    **@auth qianqiang
    **@breif 客服->项目提供方信息（账户向详细信息）
    **@date 2015.12.19
    **/
    public function getProjectProviderInfo(){
        isLogin($_COOKIE['email'], $_COOKIE['mEmail']);
        // $projectCode = $_POST['project_code'] ? $_POST['project_code']:$_GET['project_code'];
        $projectCode = "qwertyuio";
        $objProject = D("Project", "Service");
        $objProjectInfo = $objProject->getProjectInfo($projectCode);
        $providerId = $objProjectInfo['provider_id'];
        $userObj = D("User", "Service");
        $userInfo = $userObj->getUserINfoById($providerId);

        $areaObj = D("Area", "Service");
        $areaStr = $areaObj->getAreaById($userInfo[0]['company_area']);
        $docObj = D("Doc", "Service");
        $condition['id'] = $userInfo[0]['business_license'];
        $docInfo = $docObj->getDocInfo($condition);
        $docData['business_license']['id'] = $docInfo[0]['id'];
        $docData['business_license']['file_name'] = $docInfo[0]['file_name'];
        $docData['business_license']['file_rename'] = $docInfo[0]['file_rename'];
        $condition['id'] = $userInfo[0]['organization_code'];
        $docInfo = $docObj->getDocInfo($condition);
        $docData['organization_code']['id'] = $docInfo[0]['id'];
        $docData['organization_code']['file_name'] = $docInfo[0]['file_name'];
        $docData['organization_code']['file_rename'] = $docInfo[0]['file_rename'];
        $condition['id'] = $userInfo[0]['national_tax_certificate'];
        $docInfo = $docObj->getDocInfo($condition);
        $docData['national_tax_certificate']['id'] = $docInfo[0]['id'];
        $docData['national_tax_certificate']['file_name'] = $docInfo[0]['file_name'];
        $docData['national_tax_certificate']['file_rename'] = $docInfo[0]['file_rename'];
        $condition['id'] = $userInfo[0]['local_tax_certificate'];
        $docInfo = $docObj->getDocInfo($condition);
        $docData['local_tax_certificate']['id'] = $docInfo[0]['id'];
        $docData['local_tax_certificate']['file_name'] = $docInfo[0]['file_name'];
        $docData['local_tax_certificate']['file_rename'] = $docInfo[0]['file_rename'];
        $condition['id'] = $userInfo[0]['identity_card_front'];
        $docInfo = $docObj->getDocInfo($condition);
        $docData['identity_card_front']['id'] = $docInfo[0]['id'];
        $docData['identity_card_front']['file_name'] = $docInfo[0]['file_name'];
        $docData['identity_card_front']['file_rename'] = $docInfo[0]['file_rename'];
        $condition['id'] = $userInfo[0]['identity_card_back'];
        $docInfo = $docObj->getDocInfo($condition);
        $docData['identity_card_back']['id'] = $docInfo[0]['id'];
        $docData['identity_card_back']['file_name'] = $docInfo[0]['file_name'];
        $docData['identity_card_back']['file_rename'] = $docInfo[0]['file_rename'];
        $condition['id'] = $userInfo[0]['financial_audit'];
        $docInfo = $docObj->getDocInfo($condition);
        $docData['financial_audit']['id'] = $docInfo[0]['id'];
        $docData['financial_audit']['file_name'] = $docInfo[0]['file_name'];
        $docData['financial_audit']['file_rename'] = $docInfo[0]['file_rename'];
        $docData['financial_audit']['token'] = md5(addToken($docInfo[0]["id"]));

        if ($_GET['display'] == 'json') {
            header('Content-Type: text/html; charset=utf-8');
            dump($userInfo);
            dump($areaStr);
            dump($docData);
            exit;
        }
        $this->assign('userInfo', $userInfo[0]);
        $this->assign('areaStr', $areaStr);
        $this->assign('docData', $docData);
        $this->display("InnerStaff:providerInfo");
    }

    /**
    **@auth qianqiang
    **@breif 客服->尽职调查
    **@date 2015.12.19
    **/
    public function dueDiligence($projectCode=null, $rtype=null, $getJsonFlag=null){
    	isLogin($_COOKIE['email'], $_COOKIE['mEmail']);
    	$optype = $_POST['optype'] ? $_POST['optype']:$_GET['optype'];
        if( $rtype == null)
        {
            $rtype = $_POST['rtype'] ? $_POST['rtype']:$_GET['rtype'];
        }
        if($projectCode == null)
        {
            $projectCode = 'test1'; //XR4481-633K-X16-831552
            // $projectCode = $_POST['no'] ? $_POST['no']:$_GET['no'];
            // $mProjectCode = $_POST['token'] ? $_POST['token']:$_GET['token'];
            // isProjectCodeRight($projectCode, $mProjectCode);
            //echo $projectCode;exit;
        }
        if($optype == "upload" && $rtype == 1){
            $docFile = array(
                "attachment",
                );
            $doc = D("Doc", "Service");
            $docInfo = $doc->uploadFileAndPictrue($docFile, $docFile);
            if(!empty($docInfo)){
                echo '{"code":"0","msg":"success","id":"'.$docInfo['attachment'].'"}';
            }else{
                echo '{"code":"-1","msg":"上传失败！"}';
            }
        }elseif($optype == "save" && $rtype == 1){
    		$objProject = D("Project", "Service");
    		$objProjectInfo = $objProject->getProjectInfo($projectCode);
    		$projectId = $objProjectInfo['id'];

    		$proData = array();
            if($objProjectInfo['project_type'] == 1){
                $proData['project_id'] = $projectId;
                $proData['housetop_owner'] = $_POST['housetop_owner']; 
                $proData['company_type'] = $_POST['company_type'];
                $proData['plan_build_volume'] = $_POST['plan_build_volume'];
                $proData['project_area'] = $_POST['county'];
                $proData['project_address'] = $_POST['project_address'];
                $proData['housetop_type'] = $_POST['housetop_type'];
                $proData['housetop_type_other'] = $_POST['housetop_type_other'];
                $proData['synchronize_type'] = $_POST['synchronize_type'];
                $proData['plan_financing'] = $_POST['plan_financing'];
                $proData['financing_type'] = $_POST['financing_type'];
            }elseif($objProjectInfo['project_type'] == 2 || $objProjectInfo['project_type'] == 3){
                $proData['project_id'] = $projectId;
                $proData['plan_build_volume'] = $_POST['plan_build_volume'];
                $proData['project_area'] = $_POST['county'];
                $proData['project_address'] = $_POST['project_address'];
                $proData['project_name'] = $_POST['project_name'];
                $proData['project_finish_date'] = $_POST['project_finish_date'];
                $proData['project_electricity_price'] = $_POST['project_electricity_price'];
                $proData['project_investment'] = $_POST['project_investment'];
                $proData['ground_condition'] = $_POST['ground_condition'];
                $proData['ground_property'] = $_POST['ground_property'];
                $proData['ground_property_other'] = $_POST['ground_property_other'];
                $proData['ground_area'] = $_POST['ground_area'];
                $proData['plan_financing'] = $_POST['plan_financing'];
                $proData['financing_type'] = $_POST['financing_type'];
            }
    		
            $evaData = array();
            $evaData['project_id'] = $projectId;
            $evaData['IRR'] = $_POST['IRR'];
            $evaData['evaluation_result'] = $_POST['evaluation_result'];
            $evaData['static_payback_time'] = $_POST['static_payback_time'];
            $evaData['dynamic_payback_time'] = $_POST['dynamic_payback_time'];
            $evaData['LCOE'] = $_POST['LCOE'];
            $evaData['npv'] = $_POST['npv'];
            $evaData['power_asset_current_value'] = $_POST['power_asset_current_value'];
            $evaData['evaluation_content'] = $_POST['evaluation_content'];
            $evaData['document_review'] = $_POST['document_review'];
            $evaData['project_quality_situation'] = $_POST['project_quality_situation'];
            $evaData['project_invest_situation'] = $_POST['project_invest_situation'];
            $evaData['project_earnings_situation'] = $_POST['project_earnings_situation'];
            $evaData['doc_mul'] = implode(",", $_POST['doc_mul']);
// dump($proData);exit;
            $res = $objProject->saveHousetopOrGround($proData, 51, $objProjectInfo['project_type']);
            if($res == true){
            	$objEvaluation = D("Evaluation", "Service");
            	$res = $objEvaluation->saveEvaluationInfo($evaData);
            	if($res == true){
            		echo '{"code":"0","msg":"success"}';
            	}else{
            		echo '{"code":"-1","msg":"Evaluation更新失败！"}';
            	}
            }else{
            	echo '{"code":"-1","msg":"Housetop更新失败！"}';
            }
    	}elseif($optype == "submit" && $rtype == 1){
    		$objProject  = D("Project", "Service");
    		$objProjectInfo = $objProject->getProjectInfo($projectCode);
    		$projectId = $objProjectInfo['id'];

    		$proData = array();
            if($objProjectInfo['project_type'] == 1){
                $proData['project_id'] = $projectId;
                $proData['housetop_owner'] = $_POST['housetop_owner']; 
                $proData['company_type'] = $_POST['company_type'];
                $proData['plan_build_volume'] = $_POST['plan_build_volume'];
                $proData['project_area'] = $_POST['county'];
                $proData['project_address'] = $_POST['project_address'];
                $proData['housetop_type'] = $_POST['housetop_type'];
                $proData['housetop_type_other'] = $_POST['housetop_type_other'];
                $proData['synchronize_type'] = $_POST['synchronize_type'];
                $proData['plan_financing'] = $_POST['plan_financing'];
                $proData['financing_type'] = $_POST['financing_type'];
            }elseif($objProjectInfo['project_type'] == 2 || $objProjectInfo['project_type'] == 3){
                $proData['project_id'] = $projectId;
                $proData['plan_build_volume'] = $_POST['plan_build_volume'];
                $proData['project_area'] = $_POST['county'];
                $proData['project_address'] = $_POST['project_address'];
                $proData['project_name'] = $_POST['project_name'];
                $proData['project_finish_date'] = $_POST['project_finish_date'];
                $proData['project_electricity_price'] = $_POST['project_electricity_price'];
                $proData['project_investment'] = $_POST['project_investment'];
                $proData['ground_condition'] = $_POST['ground_condition'];
                $proData['ground_property'] = $_POST['ground_property'];
                $proData['ground_property_other'] = $_POST['ground_property_other'];
                $proData['ground_area'] = $_POST['ground_area'];
                $proData['plan_financing'] = $_POST['plan_financing'];
                $proData['financing_type'] = $_POST['financing_type'];
            }

            $evaData = array();
            $evaData['project_id'] = $projectId;
            $evaData['IRR'] = $_POST['IRR'];
            $evaData['evaluation_result'] = $_POST['evaluation_result'];
            $evaData['static_payback_time'] = $_POST['static_payback_time'];
            $evaData['dynamic_payback_time'] = $_POST['dynamic_payback_time'];
            $evaData['LCOE'] = $_POST['LCOE'];
            $evaData['npv'] = $_POST['npv'];
            $evaData['power_asset_current_value'] = $_POST['power_asset_current_value'];
            $evaData['evaluation_content'] = $_POST['evaluation_content'];
            $evaData['document_review'] = $_POST['document_review'];
            $evaData['project_quality_situation'] = $_POST['project_quality_situation'];
            $evaData['project_invest_situation'] = $_POST['project_invest_situation'];
            $evaData['project_earnings_situation'] = $_POST['project_earnings_situation'];
            $evaData['doc_mul'] = implode(",", $_POST['doc_mul']);

			$res = $objProject->submitHousetopOrGround($proData, 51, $objProjectInfo['project_type']);
            if($res == true){
            	$objEvaluation = D("Evaluation", "Service");
            	$res = $objEvaluation->submitEvaluationInfo($evaData);
            	if($res == true){
            		echo '{"code":"0","msg":"success"}';
            	}else{
            		echo '{"code":"-1","msg":"Evaluation更新失败！"}';
            	}
            }else{
            	echo '{"code":"-1","msg":"Housetop更新失败！"}';
            }
    	}elseif($rtype != 1){
    		$objProject  = D("Project", "Service");
    		$objProjectInfo = $objProject->getProjectInfo($projectCode);
            //echo json_encode($objProjectInfo);exit;
    		$projectId = $objProjectInfo['id'];
    		$projectDetail = $objProject->getProjectInEvaluation($projectId, $objProjectInfo['project_type']);
            //echo json_encode($projectDetail);exit;
            $projectDetail['state_type'] = $objProject->getTypeAndStateStr($objProjectInfo['project_type'], $objProjectInfo['build_state']);
            
            $area = D("Area", "Service");
            $areaArray = $area->getAreaArrayById($projectDetail['project_area']);
			
			$objEvaluation = D("Evaluation", "Service");
			$evaluationInfo = $objEvaluation->getEvaluation($projectId);

            $objDoc = D("Doc", "Service");
            $condition['id'] = $projectDetail['picture_full'];
            $picture = $objDoc->getDocInfo($condition);
            $docList = explode(',', $evaluationInfo['doc_mul']);
            $docListInfo = $objDoc->getAllDocInfo($docList);

            if ($_GET['display'] == 'json') {
                header('Content-Type: text/html; charset=utf-8');
                dump($picture);
                dump($docListInfo);
                dump($projectDetail);
                dump($areaArray);
                dump($evaluationInfo);
                exit;
            }
            //给项目进度用,直接截断了,返回json了
            if ($getJsonFlag == 1)
            {
              return array($picture[0]['file_rename'],$docListInfo,$projectDetail,$areaArray,$evaluationInfo);
            }

            $this->assign('picture', $picture[0]['file_rename']);
            $this->assign('docListInfo', $docListInfo);
    		$this->assign('projectDetail', $projectDetail);
            $this->assign('areaArray', $areaArray);
    		$this->assign('evaluationInfo', $evaluationInfo);

            if($objProjectInfo['project_type'] == 1){
                if($objProjectInfo['build_state'] == 1){
                    $this->display("InnerStaff:dueDiligence_housetop_nonbuild");
                }elseif($objProjectInfo['build_state'] == 2){
                    $this->display("InnerStaff:dueDiligence_housetop_build");
                }
            }elseif($objProjectInfo['project_type'] == 2 || $objProjectInfo['project_type'] == 3){
                if($objProjectInfo['build_state'] == 1){
                    $this->display("InnerStaff:dueDiligence_ground_nonbuild");
                }elseif($objProjectInfo['build_state'] == 2){
                    $this->display("InnerStaff:dueDiligence_ground_build");
                }
            }
    	}
    }

    /**
    **@auth qianqiang
    **@breif 客服->项目信息
    **@date 2015.12.26
    **/
    public function projectInfo(){
        isLogin($_COOKIE['email'], $_COOKIE['mEmail']);
        $rtype = $_POST['rtype'] ? $_POST['rtype']:$_GET['rtype'];
        // $projectCode = $_POST['project_code'] ? $_POST['project_code']:$_GET['project_code'];
        $projectCode = 'qwertyuio';
        $objProject = D("Project", "Service");
        $projectInfo = $objProject->getProjectInfo($projectCode);
        if($rtype == 1){
            $proData['comment'] = $_POST['comment'];
            // $proData['comment'] = "sldfjiofnosdkfj是的发生的";
            $res = $objProject->saveProjectDetail($projectCode, $projectInfo['project_type'], $proData);
            if($res > 0){
                header('Content-Type: text/html; charset=utf-8');
                echo '{"code":"0","msg":"保存成功"}';
            }else{
                header('Content-Type: text/html; charset=utf-8');
                echo '{"code":"-1","msg":"保存失败"}';
            }
        }else{
            $projectDetail = $objProject->getProjectDetail($projectInfo['id'], $projectInfo['project_type']);
            if ($_GET['display'] == 'json') {
                header('Content-Type: text/html; charset=utf-8');
                dump($projectDetail);
                exit;
            }
            $this->assign("projectDetail", $projectDetail);
            if($projectInfo['project_type'] == 1){
                if($projectInfo['build_state'] == 1){
                    $this->display("InnerStaff:housetop_nonbuild");
                }elseif($projectInfo['build_state'] == 2){
                    $this->display("InnerStaff:housetop_build");
                }
            }elseif($projectInfo['project_type'] == 2 || $projectInfo['project_type'] == 3){
                if($projectInfo['build_state'] == 1){
                    $this->display("InnerStaff:ground_nonbuild");
                }elseif($projectInfo['build_state'] == 2){
                    $this->display("InnerStaff:ground_build");
                }
            }else{
                // 应该是异常界面
                $this->display("User:login");
            }
        }
    }

    /**
    **@auth qianqiang
    **@breif 客服->意向书
    **@date 2015.12.28
    **/
    public function intent(){
        isLogin($_COOKIE['email'], $_COOKIE['mEmail']);
        // $projectCode = $_POST['project_code'] ? $_POST['project_code']:$_GET['project_code'];
        $projectCode = 'test2';
        $optype = $_POST['optype'] ? $_POST['optype']:$_GET['optype'];
        $rtype = $_POST['rtype'] ? $_POST['rtype']:$_GET['rtype'];
        if($optype == "save" && $rtype == 1){
            $intentText = $_POST["yixiangshu"];
            if($intentText == "" || $intentText == null){
                header('Content-Type: text/html; charset=utf-8');
                echo '{"code":"-1","msg":"意向书不能为空"}';
            }
            $project = D("Project", "Service");
            $result = $project->saveIntent($projectCode, $intentText);
            if($result === true)
                echo '{"code":"0","msg":"save success"}';
            else
                echo '{"code":"-1","msg":"save error"}';
        }elseif($optype == "submit" && $rtype == 1){
            $intentText = $_POST["yixiangshu"];
            if($intentText == "" || $intentText == null){
                header('Content-Type: text/html; charset=utf-8');
                echo '{"code":"-1","msg":"意向书不能为空"}';
            }
            $project = D("Project", "Service");
            $result = $project->submitIntent($projectCode, $intentText);
            if($result === true)
                echo '{"code":"0","msg":"save success"}';
            else
                echo '{"code":"-1","msg":"save error"}';
        }elseif($rtype != 1){
            $project = D("Project", "Service");
            $projectInfo = $project->getIntent($projectCode);
            // dump($projectInfo);exit;
            if($_GET['display']=="json"){
                header('Content-Type: text/html; charset=utf-8');
                dump($projectInfo);
                exit;
            }
            $this->assign("projectInfo", $projectInfo);
            $this->display("InnerStaff:intent");
        }
    }

    /**
    **@auth qianqiang
    **@breif 客服->推送项目
    **@date 2015.12.30
    **/
    public function pushProject(){
        isLogin($_COOKIE['email'], $_COOKIE['mEmail']);
        $rtype = $_POST['rtype'] ? $_POST['rtype']:$_GET['rtype'];
        // $projectCode = $_POST['project_code'] ? $_POST['project_code']:$_GET['project_code'];
        $projectCode = 'qwertyuio';
        $investors = $_POST['investors'];
        $investorStr = substr($investors, 0, strlen($investors)-1);
        $investorList = explode(",",$investorStr);
        if($rtype == 1){
            $projectObj = D('Project', 'Service');
            $result = $projectObj->pushProject($projectCode, $investorList);
            if($result === true)
                echo '{"code":"0","msg":"push project success"}';
            else
                echo '{"code":"-1","msg":"push project error"}';
        }else{
            $page = $_GET['page'];
            if(empty($page)) $page=1;
            $pageSize = 6;
            $investor = D('User', 'Service');
            $investorList = $investor->getInvestorPush($projectCode, $page);
            $investorTotal = $investor->getInvestorPush($projectCode, -1);
            $data = array();
            $data["list"] = $investorList;
            $data["page"] = $page;
            $data["count"] = sizeof($investorTotal);
            $data["totalPage"] = ceil($data["count"]/$pageSize+1);
            $data["endPage"] = ceil($data["count"]/$pageSize);
            if($_GET['display']=="json"){
                header('Content-Type: text/html; charset=utf-8');
                dump($data);
                exit;
            }
            $this->assign("arrData", $data);
            $this->display("InnerStaff:pushProject");
        }
    }

    /**
    **@auth qianqiang
    **@breif 客服->综合查询
    **@date 2016.1.8
    **/
    public function search(){
        isLogin($_COOKIE['email'], $_COOKIE['mEmail']);
        $rtype = $_POST['rtype'] ? $_POST['rtype']:$_GET['rtype'];
        $projectObj = D("Project", "Service");
        $userObj = D("User", "Service");
        if($rtype == 2){
            $projectCode = $_POST['project_code'];
            $oldStatus = $_POST['status'];
            $newStatus = $_POST['project_status'];
            // $projectCode = 'testintent';
            // $oldStatus = 13;
            // $newStatus = 12;
            $res = $projectObj->changeProjectStatus($projectCode, $oldStatus, $newStatus);
            if($res === true){
                header('Content-Type: text/html; charset=utf-8');
                echo '{"code":"0","msg":"修改成功！"}';
            }else{
                header('Content-Type: text/html; charset=utf-8');
                echo '{"code":"-1","msg":"'.$res.'"}';
            }
        }else{
            $companyName = $_POST['companyName'];
            $companyType = $_POST['companyType'];
            $situation = $_POST['situation'];
            $startDate = $_POST['startDate'];
            $endDate = $_POST['endDate'];
            $status = $_POST['status'];
            $cooperationType = $_POST['cooperationType'];
            // $companyName = "哈哈哈公司";
            // $companyType = "地面分布式-未建";
            // $situation = '110000';
            // $startDate = '2016-01-01' ;
            // $endDate = '2016-01-11' ;
            // $status = "已签意向书";
            // $cooperationType = "EPC";
            $page = $_GET['page'];
            if(empty($page)) $page=1;
            $pageSize = 6;
            if($rtype == 1){
                $projectList = $projectObj->searchService($companyName, $companyType, $situation, $startDate, $endDate, $status, $cooperationType, $page);
                $projectTotal = $projectObj->searchService($companyName, $companyType, $situation, $startDate, $endDate, $status, $cooperationType, -1);
            }else{
                $projectList = $projectObj->searchService(null, null, null, null, null, null, null, $page);
                $projectTotal = $projectObj->searchService(null, null, null, null, null, null, null, -1);
            }
            $companyNameList = $userObj->getAllCompanyName();
            $data = array();
            $data["list"] = $projectList;
            $data["campanyName"] = $companyNameList;
            $data["page"] = $page;
            $data["count"] = sizeof($projectTotal);
            $data["totalPage"] = ceil($data["count"]/$pageSize+1);
            $data["endPage"] = $data["totalPage"];
            if($_GET['display']=="json"){
                header('Content-Type: text/html; charset=utf-8');
                dump($data);
                exit;
            }
            $this->assign("arrData", $data);
            $this->display("InnerStaff:search");
        }
    }
}