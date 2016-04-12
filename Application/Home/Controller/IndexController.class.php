<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;
use OT\DataDictionary;

/**
 * 前台首页控制器
 * 主要获取首页聚合数据
 */
class IndexController extends HomeController {

	//系统首页
	public function index(){
		$where=array('status'=>1);
		$field=array('title','jb_document_huiyi.id','xingming','open_time','address');
		$M=M('document_huiyi');
		$data=$M->join('__DOCUMENT__ document on document.id=__DOCUMENT_HUIYI__.id')
		->where($where)
		->order('level')
		->field($field)
		->select();
		$this->assign('huiyis',$data);
		$this->display();
	}

}