<template>
    <div id="app_login">   
        <div class="imgagelogin">
            <img src="../../common/img/index/moren.jpg" v-if="is_img==false">
            <img :src="list.img" v-else>
        </div>
        <div class="input">
         <p class="tishi" v-html="user_tishi" :class="{onError:user_tishi}" v-show="user_yz"></p>
            <p class="input-row border">
                <span class="title">账号：</span>
                <input type="text" placeholder="请输入账号" style="width:75%;" v-model="uname" @blur="ublur('uname')">
            </p >
            <p class="input-row">
                <span class="title">密码：</span>
                <input type="password" placeholder="请输入密码" style="width:75%;" v-model="upwd" @blur="ublur('upwd')">
            </p>
        </div>
        <div class="autologin">  
            <span>自动登录</span>
            <mt-switch class="at"></mt-switch>
        </div>
        <mt-button type="primary" size="large" @click="login">登录</mt-button>
        <div class="action-row">
           <router-link  to="/home/register"><a>注册账号</a></router-link>
            <span>|</span>
            <router-link  to="/home"><a>忘记密码</a></router-link>
        </div>
   <div class="more"><span>其他方式登录</span></div>
   <div class="mui-content-padded mui-content loginnn">
			<a><img class="mui-icon" src="../../common/img/icons/weibo.png"></a>
            <a><img class="mui-icon" src="../../common/img/icons/qq.png"></a>
            <a><img class="mui-icon weixin" src="../../common/img/icons/weixin.png"></a>
        </div>
    </div>
</template>
<script>
import {Toast} from "mint-ui";
    export default{
        data(){
            return {
                uname:"",
                upwd:"",
                user_tishi:"",
                user_yz:true,
                list:[],
                is_img:false,                   
            }
        },
        methods:{
           ublur(str){
               if(str=='uname'){
                    if(!this.uname){
                        this.user_tishi="账号不能为空";
                        this.user_yz=true;
                    }
                    if(this.user_yz){
                        var url="login/img?uname="+this.uname;
                        this.$http.get(url).then(result=>{
                            if(result.body.code==200){
                                this.is_img=true;
                                this.list=result.body.msg[0];
                            }   
                        })
                    }
                }else if(str=='upwd'){
                    if(!this.upwd){
                        this.user_tishi="密码不能为空";
                        this.user_yz=true;
                    }else{
                        this.user_tishi="" 
                    }
                }
              },
           login(){
                var url="login/login?uname="+this.uname+"&upwd="+this.upwd;
                this.$http.get(url).then(result=>{
                   if(result.body.code === 200){
                        Toast("欢迎回来:"+this.uname);
                        setTimeout(function(){
                               window.location.href="/index";
                        },1000)
                        this.$store.commit("uname",this.uname);
                        this.$store.commit("login_in");                        
                   }else{
                       Toast("用户名或密码错误");
                   }
               })
           },
        },
        created() {
        },
    }
</script>
<style scoped>
.onError{ color: red; }
.input-group {
        background-color: #F7F7F7;
        margin-top: 40px;
        position: relative;
    }
    .input-group::before {
        position: absolute;
        right: 0;
        top: 0;
        left: 0;
        height: 1px;
        content: '';
        -webkit-transform: scaleY(.5);
        transform: scaleY(.5);
        background-color: #c8c7cc;
    }
    .input-group::after {
        position: absolute;
        right: 0;
        bottom: 0;
        left: 0;
        height: 1px;
        content: '';
        -webkit-transform: scaleY(.5);
        transform: scaleY(.5);
        background-color: #c8c7cc;
    }
    .input-row {
        display: flex;
        flex-direction: row;
        position: relative;
    }
    .input-row .title {
        width: 20%;
        height: 50px;
        min-height: 50px;
        padding: 15px 0;
        padding-left: 30px;
        line-height: 50px;
    }
    .input-row input {
        width: 80%;
        height: 50px;
        min-height: 50px;
        padding: 15px 0;
        padding-right: 30px;
        line-height: 50px;
    }
    .input-row.border::after {
        position: absolute;
        right: 0;
        bottom: 0;
        left: 15px;
        height: 1px;
        content: '';
        -webkit-transform: scaleY(.5);
        transform: scaleY(.5);
        background-color: #c8c7cc;
    }
.more{
    text-align:center;
    font-size:15px;
    color:#666;
    margin-top:34px;
}
.tishi {
    margin:0 0 10px 35px;
    font-size:16px;
    height:20px;
}
.loginnn img{
    width:30px;
    height:30px;
}
.input-row input{
    min-height:0;
    padding:15px 5px
}
.imgagelogin img{
    width:85px;
    height:85px;
    border-radius:50%;
    border:1px solid #fff;
    margin:10px 0 0 135px;
}
			.mui-content-padded {
				padding: 10px;
			}
			.mui-content-padded a {
				margin: 3px;
				width: 50px;
				height: 50px;
				display: inline-block;
				text-align: center;
				background-color: #fff;
				border: 1px solid #ddd;
				border-radius: 25px;
				background-clip: padding-box;
                margin-left:20px;
			}
			.mui-content-padded a .mui-icon {
				margin-top: 10px;
			}
            .app_login{
                position:relative;
            }
            .loginnn{
                position:absolute;
                left:50px;
            }
.input{
    background:#fff;
    margin-top:5px;
    height:177px;
    padding-top:10px;
}
.input .title{
    color:#000;
    font-size:17px;
}
.autologin{
    background:#fff;
    height:50px;
    margin:15px 0;
}
.autologin span{
    float:left;
    line-height:50px;
    margin-left:30px;
}
.autologin .at{
    float:right;
    margin:10px 15px 0 0;
}
    .input-row{
        display:block;
    }
    .action-row {
        display: flex;
        flex-direction: row;
        justify-content: center;
        margin-top:15px;
    }

    .action-row a {
        color: #007aff;
        padding: 0 20px;
    }
    .mui-bar-nav ~ .mui-content{
        padding-top:0;
    }
</style>