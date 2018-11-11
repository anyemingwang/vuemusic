// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import vueResource from'vue-resource'
Vue.use(vueResource);
Vue.config.productionTip = false
import'mint-ui/lib/style.css'
import './lib/mui/css/mui.css'
import './lib/mui/css/icons-extra.css'
import './lib/mui/js/mui.js'
import {Header,Swipe,SwipeItem,Button,Popup,Switch} from "mint-ui"
//注册header组件
Vue.component(Header.name,Header);
Vue.component(Swipe.name,Swipe);
Vue.component(SwipeItem.name,SwipeItem);
Vue.component(Button.name,Button);
Vue.component(Popup.name,Popup);
Vue.component(Switch.name, Switch);
/* eslint-disable no-new */
//设置全局ajax访问基础路径
Vue.http.options.root="http://58.87.107.202:5001/";
//设置全局ajax post 访问格式
Vue.http.options.emulateJSON=true;

import Vuex from "vuex" //引入Vuex组件
import {mapActions} from 'vuex'
Vue.use(Vuex) //注册组建中所有的内容
//创建Vuex对象:共享数据,操作方法,获取并监听数据方法
var store=new Vuex.Store({
  state:{        //共享数据
    likeCount:0, //喜欢的歌的数量
    uname:"",
    login:"true"
  },  
  mutations:{     //操作共享数据方法
    increment(state){
      state.likeCount++               
	    sessionStorage.setItem("k",state.likeCount);
    },  
    substract(state){
      state.likeCount--
      sessionStorage.setItem("k",state.likeCount);
    },  
    uname(state,msg){
      state.uname=msg;
      localStorage.setItem("uname",msg)
    },
    login_in(state){
      state.login = true;
      sessionStorage.setItem("login",state.login);            
      
    },
    login_out(state){
      state.login = false;
      sessionStorage.setItem("login",state.login);
    },
  },
  getters:{   //获取并监听数据方法
    optCount:function(state){
	  if(sessionStorage.getItem("k")){
		state.likeCount=sessionStorage.getItem("k");
	  }
      return state.likeCount;
    },
    baiCount:function(state){
      state.login=sessionStorage.login;
      return state.login;
    }
  } 
}); 
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>',
  store,
  created(){
    if(localStorage.getItem("uname")===null){
      localStorage.setItem("uname",'');
    }
    this.$store.state.uname=localStorage.getItem('uname');
  }
})
