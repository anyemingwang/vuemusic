<template>
    <div id="app_register">   

        <div class="input">
            <p class="input-row tishi" v-html="user_tishi" :class="{onError:user_tishi}" v-if="user_yz"></p>
            <p class="input-row border">
                <span class="title">账号：</span>
                <input type="text" placeholder="用户名3-12位" style="width:70%;" maxlength="12" v-model="uname" @blur="ublur('uname')" >
            </p >
            <p class="input-row border">
                <span class="title">密码：</span>
                <input type="password" placeholder="密码6-12位" maxlength="12" style="width:70%;" v-model="upwd" @blur="ublur('upwd')" >
            </p>
            <p class="input-row border">
                <span class="title" style="padding-left:0;">确认密码：</span>
                <input type="password" placeholder="确认密码要与密码保持一致" style="width:70%;" @blur="ublur('cpwd')" v-model="cpwd" >
            </p>
            <p class="input-row border">
                <span class="title" style="padding-left:30px;" >性别：</span>
                <span><input type="radio" name="sex" id="sex1" value="1" v-model="sexval"/><label for="sex1">男</label></span>
				<span><input type="radio" name="sex" id="sex2" value="0" v-model="sexval"/><label for="sex2">女</label></span>
            </p>
            <p class="input-row">
                <input type="checkbox"  required id="again"  @click="again"/><span>我已经认真阅读并同意</span>&nbsp;<a href="#">用户协议</a>、<a href="#">隐私协议</a>
            </p>
        </div>
        <mt-button type="primary" size="large" :disabled="disabled" @click="register">注册</mt-button>
          <div class="more"><span>其他方式注册</span></div>
        <div class="mui-content-padded mui-content loginnn">
			<a><img class="mui-icon" src="../../common/img/icons/weibo.png"></a>
            <a><img class="mui-icon" src="../../common/img/icons/qq.png"></a>
            <a><img class="mui-icon weixin" src="../../common/img/icons/weixin.png"></a>
        </div>
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
                cpwd:"",
                user_tishi:"",
                user_yz:false,
                rules:0,
                rules_yz:false,
                disabled: true, 
                sexval:'',
                can:[0,0,0],
                count:0,
                name:false,
            }
        },
        methods:{
            ublur(str){
                if(str=='uname'){
                    if(this.uname.length<3){
                        this.user_tishi="账号名不能低于3位";
                        this.user_yz=true;
                        this.can[0]=0;
                        this.count=0;
                        this.name=false;
                    }else{
                        var url="register/checkUname?uname="+this.uname;
                        this.$http.get(url).then(result=>{
                            this.user_tishi=result.body.msg;
                            this.user_yz=true; 
                            this.can[0]=1;
                            if(result.body.msg=='用户名可用')this.name=true;
                            else this.name=false;
                        })
                    }
                }else if(str=='upwd'){
                    if(this.upwd.length<6){
                        this.user_tishi="密码不能低于6位";  
                        this.user_yz=true;
                        this.can[1]=0;
                        this.count=0;
                    }else{
                        this.can[1]=1;
                    }
                }else{
                    if(this.upwd!=this.cpwd){
                        this.user_tishi="确认密码与密码不一致";
                        this.user_yz=true;
                        this.can[2]=0;
                        this.count=0;
                    }else{
                        this.user_tishi="";
                        this.can[2]=1;
                    }
                }
            },
            again(){
                this.rules++;
                if(this.rules%2==0){
                    this.rules_yz=false;
                }else{
                     this.rules_yz=true;
                }
                var count=0;
                for(var i=0;i<3;i++){
                    count+=this.can[i];     
                }
                if(this.rules_yz){  
                     this.disabled=!this.disabled;
                }
            },
            register(){
                for(var i=0;i<3;i++){
                    this.count+=this.can[i];     
                }
                if(this.count=3&&this.name){ 
                    var obj={uname:this.uname,upwd:this.upwd,sex:this.sexval};
                    var url="register/regadd";
                    this.$http.post(url,obj).then(result=>{
                            Toast("注册成功,2s后返回登录页面"); 
                            setTimeout(function(){
                                window.location.href="/index/login";
                            },2000)
                    })
                }else{
                    Toast("注册失败,请检查注册信息"); 
                }
            }
        },
        created(){
           
        },
    }
</script>

<style scoped>
.onError{ color: red; }
.input .tishi {
    margin:0 0 10px 35px;
    font-size:16px;
    height:20px;
}
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
        padding-right: 30px;
        line-height: 50px;
         min-height:0;
        padding:15px 5px
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
p{margin-left: 20px;}
.more{
    text-align:center;
    font-size:15px;
    color:#666;
    margin-top:20px;
}
#sex1,#sex2,#again{
    width:17px;height:17px;min-height:0;margin-right:10px;
}
#again{
    margin:10px 8px 0 40px;
}
label{
    font-size:17px;width:20px;margin-right:10px;
}
.loginnn img{
    width:30px;
    height:30px;
}
.imgagelogin img{
    width:100px;
    height:100px;
    border-radius:50%;
    border:1px solid #fff;
    margin:20px 0 0 135px;
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
    margin:15px 0;
    height:375px;
    padding-top:20px;
}
.input .title{
    color:#000;
    font-size:16px;
    margin-left:8px;
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
    .mui-bar-nav ~ .mui-content{
        padding-top:0;
    }
</style>
