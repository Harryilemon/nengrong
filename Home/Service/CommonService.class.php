<?php 
namespace Home\Service;

use Think\Model;

class CommonService extends Model{

	/**
    **@auth qianqiang
    **@breif 获取用户企业类型
    **@date 2016.1.28
	**/
	public function getUserCompanyType($no){
		if(1 == $no){
			$companyTypeStr = '央企国企';
		}elseif(2 == $no){
			$companyTypeStr = '中外合资';
		}elseif(3 == $no){
			$companyTypeStr = '外商独资';
		}elseif(4 == $no){
			$companyTypeStr = '大型民营';
		}elseif(5 == $no){
			$companyTypeStr = '小型民营';
		}else{
			$companyTypeStr = '其他';
		}
		return $companyTypeStr;
	}

	/**
    **@auth qianqiang
    **@breif 获取项目企业类型
    **@date 2016.1.28
	**/
	public function getProjectCompanyType($no){
		if(1 == $no){
			$companyTypeStr = '国企（上市公司）';
		}elseif(2 == $no){
			$companyTypeStr = '外企（上市公司）';
		}elseif(3 == $no){
			$companyTypeStr = '私企（上市公司）';
		}elseif(4 == $no){
			$companyTypeStr = '国企（非上市公司）';
		}elseif(5 == $no){
			$companyTypeStr = '外企（非上市公司）';
		}elseif(6 == $no){
			$companyTypeStr = '私企（非上市公司）';
		}else{
			$companyTypeStr = '其他';
		}
		return $companyTypeStr;
	}

	/**
    **@auth qianqiang
    **@breif 获取并网方式
    **@date 2016.1.28
	**/
	public function getSynchronizeType($no){
		if(1 == $no){
			$synchronizeTypeStr = '自发自用';
		}elseif(2 == $no){
			$synchronizeTypeStr = '全额上网';
		}elseif(3 == $no){
			$synchronizeTypeStr = '自发自用全额上网';
		}else{
			$synchronizeTypeStr = '其他';
		}
		return $synchronizeTypeStr;
	}

	/**
    **@auth qianqiang
    **@breif 获取融资方式
    **@date 2016.1.28
	**/
	public function getFinancingType($no){
		if(1 == $no){
			$financingTypeStr = '融资租赁（直租）';
		}elseif(2 == $no){
			$financingTypeStr = '融资租赁（回租）';
		}elseif(3 == $no){
			$financingTypeStr = '股权融资';
		}else{
			$financingTypeStr = '其他';
		}
		return $financingTypeStr;
	}

	/**
    **@auth qianqiang
    **@breif 获取电价结算方式
    **@date 2016.1.28
	**/
	public function getElectricityClearType($no){
		if(1 == $no){
			$str = '峰谷平电价打折';
		}elseif(2 == $no){
			$str = '平均电价打折';
		}elseif(3 == $no){
			$str = '固定电价';
		}else{
			$str = '其他';
		}
		return $str;
	}

	/**
    **@auth qianqiang
    **@breif 获取土地性质
    **@date 2016.1.28
	**/
	public function getGroundProperty($no){
		if(1 == $no){
			$str = '一般农田';
		}elseif(2 == $no){
			$str = '林地';
		}elseif(3 == $no){
			$str = '荒地';
		}elseif(4 == $no){
			$str = '鱼塘';
		}elseif(5 == $no){
			$str = '基本农田';
		}else{
			$str = '其他';
		}
		return $str;
	}

	/**
    **@auth qianqiang
    **@breif 获取土地平整情况
    **@date 2016.1.28
	**/
	public function getGroundCondition($no){
		if(1 == $no){
			$str = '平地';
		}elseif(2 == $no){
			$str = '山坡';
		}elseif(3 == $no){
			$str = '水面';
		}else{
			$str = '其他';
		}
		return $str;
	}

	/**
    **@auth qianqiang
    **@breif 获取项目支架类型
    **@date 2016.1.28
	**/
	public function getProjectHolderType($no){
		if(1 == $no){
			$str = '地面固定式';
		}elseif(2 == $no){
			$str = '单轴';
		}elseif(3 == $no){
			$str = '双轴';
		}else{
			$str = '其他';
		}
		return $str;
	}

	/**
    **@auth qianqiang
    **@breif 获取土地项目类型
    **@date 2016.1.28
	**/
	public function getGroundProjectType($no){
		if(1 == $no){
			$str = '地面';
		}elseif(2 == $no){
			$str = '农光互补';
		}elseif(3 == $no){
			$str = '鱼光互补';
		}else{
			$str = '其他';
		}
		return $str;
	}
}