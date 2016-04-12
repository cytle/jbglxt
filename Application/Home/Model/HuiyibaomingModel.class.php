<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Model;
use Think\Model;
class HuiyibaomingModel extends Model{

    /* 用户模型自动完成 */
    protected $_auto = array(
        array('create_time', NOW_TIME, self::MODEL_INSERT),
        array('status', 1, self::MODEL_INSERT),
        );
    /* 自动验证规则 */
    protected $_validate = array(
        array('huiyi_id', 'checkHuiyiId', '该会议不允许报名', 1 , 'callback', self::MODEL_BOTH),
        array('huiyi_id,mobile', 'checkHuiyi', '该手机已经报名', 1 , 'callback', self::MODEL_BOTH),
        array('mobile', '/^1[3458]\d{9}$/', '手机格式不正确', self::EXISTS_VALIDATE), //手机格式不正确
        array('name', 'require', '姓名不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
        );
    public function baoming($data)
    {
        if($this->create($data)){
            return $this->add();
        }else{
            return false;
        }
    }
    public function edit_baoming($data){

        $id=$data['id'];
        $info=$this->getById($id);
        if(!$info){
            $this->error="原报名不存在";
            return false;
        }
        if($info['uid']!=$data['uid']){
            $this->error="原报名不属于当前用户";
            return false;
        }
        $data=array(
            'id'=>$info['id'],
            'name'=>$data['name'],
            'mobile'=>$data['mobile'],
            'huiyi_id'=>$info['huiyi_id']
            );
        if($this->create($data)){
            return $this->save();
        }else{
            return false;
        }
    }
    protected function checkHuiyiId($huiyi_id){

        $huiyi=M('document')->getFieldById($huiyi_id,'status');
        return 1==$huiyi;
    }
    protected function checkHuiyi($arg){

        $id=$this->where($arg)->getField('id');
        return $id?false:true;
    }


}
