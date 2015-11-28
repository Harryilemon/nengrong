<?php
namespace Home\Controller;

use Think\Controller;

class UserController extends Controller
{
    public function index()
    {
        $this->display();
    }

    //登录
    public function login(){
        $email = $_POST['email'];
        $password = $_POST['password'];
        $dynamicCode = $_POST['dynamicCode'];
        $mDynamicCode = $_POST['mDynamicCode'];
        if (empty($email) || empty($password) || empty($dynamicCode)) {
            echo '{"code":"-1","msg":"邮箱或者密码或者动态码为空！"}';
        }
        if (!($mDynamicCode == MD5($dynamicCode."ENFENF"))) {
            echo '{"code":"-1","msg":"验证码错误"}';
        }

        $user = M("User");
        $users = $user->where("email='%s' and password='%s' and status!=9999", array($email, MD5($password)))->select();

        setcookie("email", $email, time()+3600);
        setcookie("mEmail", MD5($email."ENFENF"), time()+3600);
        setcookie("userType", $users->user_type, time()+3600);
        
        $display = $_GET['display'];
        if ($display == 'json') {
            dump($users);
            echo json_encode($users);
            exit();
        }
        if (sizeof($users) == 1) {
            echo '{"code":"0","msg":""}';

        } else {
            echo '{"code":"-1","msg":"登录信息错误"}';
        }

    }

    //注册
    public function register(){
        $email = $_POST['email'];
        $password = $_POST['password'];
        $userType = $_POST['userType'];
        if (empty($email) || empty($password)) {
            echo '{"code":"-1","msg":"邮箱或者密码为空！"}';
        }
        $user = M("User");
        $users = $user->where("email='%s' and status!=9999", array($email) )->select();
        if (sizeof($users) == 1) {
            echo '{"code":"-1","msg":"该邮箱已经注册"}';

        } 

        $userAdd = M('user');
        $userAdd->email = $email;
        $userAdd->password = md5($password);
        $userAdd->status = 0;
        if(empty($userType) ) {
            $userAdd->user_type = 3;
        }
        else{
            $userAdd->user_type = $userType;
        }
        $user->add();

        $users = $user->where("email='%s' and status!=9999", array($email) )->select();
        if (sizeof($users) == 1) {
            echo '{"code":"0","msg":""}';

        } else {
            echo '{"code":"-1","msg":"mysql error!"}';
        }
    }

    //修改密码
    public function changePassword(){
        $email = $_POST['email'];
        $mEmail = $_POST['mEmail'];
        $pwd = $_POST['password'];
        $newPwd = $_POST['newPassword'];
        if ( empty($email) || empty($mEmail) || empty($pwd) || empty($newPwd) ) {
            echo '{"code":"-1","msg":"邮箱或者新旧密码为空！"}';
        }
        if (!($mEmail == MD5($email."ENFENF"))) {
            echo '{"code":"-1","msg":"登录信息错误"}';
        }

        $user = M('User');
        $users = $user->where("email='%s' and password='%s' and status!=9999", array($email, $pwd))->select();
        if(sizeof($users) == 0){
            echo '{"code":"-1","msg":"原密码错误!"}';
        }

        $user->email = $email;
        $user->password = $newPwd;
        $user->save();
        // $test_user = M('User');
        // $test_user->id = $id;
        // $test_user->password = $pwd;
        // $test_user->save();
    }

    //忘记密码时修改密码
    public function resetPassword(){
        $email = $_POST['email'];
        $newPwd = $_POST['newPassword'];
        if ( empty($email) || empty($newPwd) ) {
            echo '{"code":"-1","msg":"邮箱或者新密码为空！"}';
        }

        $user = M('User');
        $user->email = $email;
        $user->password = $newPwd;
        $user->save();
    }

    //用户激活
    public function activeUser(){
        $email = $_POST['email'];
        $mEmail = $_POST['mEmail'];
        if (!($mEmail == MD5($email."ENFENF"))) {
            echo '{"code":"-1","msg":"登录信息错误"}';
        }
        
    }

    //显示用户详细信息
    public function userInfo(){
        $email = $_POST['email'];
        $mEmail = $_POST['mEmail'];
        if (!($mEmail == MD5($email."ENFENF"))) {
            echo '{"code":"-1","msg":"登录信息错误"}';
        }

    }

    //修改资料
    public function changeUserInfo(){
        $email = $_POST['email'];
        $mEmail = $_POST['mEmail'];
        if (!($mEmail == MD5($email."ENFENF"))) {
            echo '{"code":"-1","msg":"登录信息错误"}';
        }

    }


    public function getDynamicCode(){
        code();
    }

    public function test1(){
        $User = M("User");
        $email = $User->where('id=3 and password=123')->getField('email');
        echo json_encode($email);
        $list = $User->getField('id,email');
        dump($list);
        echo json_encode(sizeof($list));
        // $news = M('news');
        // $new = $news->select(1);
        // echo json_encode($new);
        // $test_user = D('User');
        // $test = $test_user->mytest();
        // echo json_encode($test);
    }

}
