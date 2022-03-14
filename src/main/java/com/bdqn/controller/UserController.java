package com.bdqn.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.bdqn.entity.Orders;
import com.bdqn.entity.User;
import com.bdqn.service.OrdersService;
import com.bdqn.service.UserService;
import com.bdqn.utils.PasswordUtil;
import com.bdqn.utils.SystemConstant;
import com.bdqn.utils.UUIDUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;
    @Resource
    private OrdersService ordersService;


    /**
     * 注册
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping("/register")
    public String register(User user){
        //创建Map集合，保存结果信息
        Map<String,Object> map = new HashMap<String,Object>();
        //调用注册的方法
        if(userService.addUser(user)>0){
            map.put(SystemConstant.SUCCESS,true);
            map.put(SystemConstant.MESSAGE,"恭喜你,注册成功!");
        }else{
            map.put(SystemConstant.SUCCESS,false);
            map.put(SystemConstant.MESSAGE,"很遗憾,注册失败,请重新尝试!");
        }
        return JSON.toJSONString(map);
    }


    /**
     * 检查用户名是否存在
     * @param loginName
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkName")
    public String checkName(String loginName){
        //创建Map集合，保存结果信息
        Map<String,Object> map = new HashMap<String,Object>();
        //调用根据用户名查询用户信息的方法
        if(userService.findUserByName(loginName)!=null){
            map.put(SystemConstant.EXIST,true);
            map.put(SystemConstant.MESSAGE,"用户名已被使用,请重新输入！");
        }else{
            map.put(SystemConstant.EXIST,false);
        }
        return JSON.toJSONString(map);
    }

    /**
     * 登录
     * @return
     */
    @ResponseBody
    @RequestMapping("/login")
    public String login(String loginName, String password, HttpSession session){
        //创建Map集合，保存结果信息
        Map<String,Object> map = new HashMap<String,Object>();
        //调用登录的方法
        User currentUser = userService.login(loginName, password);
        //判断对象是否为空
        if(currentUser!=null){
            map.put(SystemConstant.SUCCESS,true);
            //currentUser.setPassword(null);//清空
            //保存用户信息到会话中
            session.setAttribute(SystemConstant.FRONT_LOGIN_USER,currentUser);
        }else{
            map.put(SystemConstant.SUCCESS,false);
            map.put(SystemConstant.MESSAGE,"用户名或密码错误，请重新输入！");
        }
        return JSON.toJSONString(map);
    }
    /**
     * 前台用户退出登录
     * @param session
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        //清空session
        session.removeAttribute(SystemConstant.FRONT_LOGIN_USER);
        //session.invalidate();
        //重定向到登录页面
        return "redirect:/index.html";
    }
    /**
     * 去到个人信息界面
     */
    @RequestMapping("/setting.html")
    public String setting(){
        return  "user/user-setting";
    }

    /**
     * 去到个人订单界面
     */
    @RequestMapping("/orders.html")
    public String orders(){
        return  "user/user-orders";
    }

    /**
     * 个人订单列表
     * */
    @RequestMapping("/orders/list")
    @ResponseBody
    public String list(HttpSession session){
        JSONObject json = new JSONObject();
        User user = (User) session.getAttribute(SystemConstant.FRONT_LOGIN_USER);
        long id =user.getId();
        Integer accountId = (int)id;
        List<Orders> ordersList = ordersService.findOrdersListById(accountId);
        json.put("code", 0);
        json.put("data", ordersList);
        return  JSON.toJSONString(json);
    }

    /**
     * 取消订单
     */
    @RequestMapping("/orders/cancelOrder")
    @ResponseBody
    public String cancelOrder(int id){
        Map<String,Object> map = new HashMap<String,Object>();
        System.out.println("取消的"+id);
        if(ordersService.deleteById(id)>0){
            map.put(SystemConstant.SUCCESS, true);
            map.put(SystemConstant.MESSAGE, "取消成功");
        }else{
            map.put(SystemConstant.SUCCESS, false);
            map.put(SystemConstant.MESSAGE, "取消失败");
        }
        return JSON.toJSONString(map);
    }
    /**
     * 去到修改密码界面
     */
    @RequestMapping("/password.html")
    public String updatePassword(){
        return  "user/user-password";
    }
    /**
     * 检查旧密码否存是否正确
     * @param loginPwd
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkPwd")
    public String checkPwd(String loginPwd,HttpSession session){
        //创建Map集合，保存结果信息
        Map<String,Object> map = new HashMap<String,Object>();
        User user = (User) session.getAttribute(SystemConstant.FRONT_LOGIN_USER);
        //密码加密
        String newPwd = PasswordUtil.md5(loginPwd,user.getSalt(), SystemConstant.PASSWORD_COUNT);
        System.out.println(newPwd);
        System.out.println(user.getPassword());
        //是否相等
        if(newPwd.equals(user.getPassword())){
            map.put(SystemConstant.EXIST,false);
        }else{
            map.put(SystemConstant.EXIST,true);
            map.put(SystemConstant.MESSAGE,"旧密码不正确,请重新输入！");
        }
        return JSON.toJSONString(map);
    }
    /**
     * 修改密码
     * @param new_password
     * @return
     */
    @ResponseBody
    @RequestMapping("/updatePwd")
    public String update(String new_password,HttpSession session){
        //创建Map集合，保存结果信息
        Map<String,Object> map = new HashMap<String,Object>();
        User user = (User) session.getAttribute(SystemConstant.FRONT_LOGIN_USER);
        //密码加密
        System.out.println(new_password);
        user.setSalt(UUIDUtils.randomUUID());//生成新加密盐值
        user.setPassword(PasswordUtil.md5(new_password,user.getSalt(), SystemConstant.PASSWORD_COUNT));

        //调用新增员工的方法
        if(userService.updateUser(user)>0) {
            map.put(SystemConstant.SUCCESS, true);
            map.put(SystemConstant.MESSAGE, "密码修改成功,请重新登录！");
        }else{
            map.put(SystemConstant.SUCCESS, false);
            map.put(SystemConstant.MESSAGE, "修改失败");
        }
        return JSON.toJSONString(map);
    }


}
