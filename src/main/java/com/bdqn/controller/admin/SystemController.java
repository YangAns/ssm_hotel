package com.bdqn.controller.admin;

import com.alibaba.fastjson.JSON;
import com.bdqn.entity.Employee;
import com.bdqn.service.EmployeeService;
import com.bdqn.utils.PasswordUtil;
import com.bdqn.utils.SystemConstant;
import com.bdqn.utils.UUIDUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;


/**
 * 负责跳转页面(后台管理页面)
 */
@Controller
@RequestMapping("/admin")
public class SystemController {
    @Resource
    private EmployeeService employeeService;

    /**
     * 去到登录页面
     * @return
     */
    @RequestMapping("/login.html")
    public String login(){
        return "admin/login";
    }


    /**
     * 去到后台首页
     * @return
     */
    @RequestMapping("/home.html")
    public String home(){
        return "admin/home";
    }

    @RequestMapping("/desktop")
    public String desktop(){
        return "admin/desktop";
    }

    /**
     * 去到个人信息界面
     */
    @RequestMapping("/setting.html")
    public String setting(){
        return  "admin/setting";
    }

       /**
     * 去到修改密码界面
     */
    @RequestMapping("/password.html")
    public String updatePassword(){
        return  "admin/password";
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
        Employee employee = (Employee) session.getAttribute(SystemConstant.LOGINUSER);
        //密码加密
        String newPwd = PasswordUtil.md5(loginPwd,employee.getSalt(), SystemConstant.PASSWORD_COUNT);
        //是否相等
        if(newPwd.equals(employee.getLoginPwd())){
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
        Employee employee = (Employee) session.getAttribute(SystemConstant.LOGINUSER);
        //密码加密
        System.out.println(new_password);
        employee.setSalt(UUIDUtils.randomUUID());//生成新加密盐值
        employee.setLoginPwd(PasswordUtil.md5(new_password,employee.getSalt(), SystemConstant.PASSWORD_COUNT));

        //调用新增员工的方法
        if(employeeService.updateEmployee(employee)>0) {
            map.put(SystemConstant.SUCCESS, true);
            map.put(SystemConstant.MESSAGE, "修改成功,请重新登录");
        }else{
            map.put(SystemConstant.SUCCESS, false);
            map.put(SystemConstant.MESSAGE, "修改失败");
        }
        return JSON.toJSONString(map);
    }

    /**
     * 退出登录
     * @param session
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        //清空session
        session.removeAttribute(SystemConstant.LOGINUSER);
        //session.invalidate();
        //重定向到登录页面
        return "redirect:/admin/login.html";
    }

    /**
     * 去到部门管理页面
     * @return
     */
    @RequestMapping("/toDeptManager")
    public String toDeptManager(){
        return "admin/dept/deptManager";
    }


    /**
     * 去到角色管理页面
     * @return
     */
    @RequestMapping("/toRoleManager")
    public String toRoleManager(){
        return "admin/role/roleManager";
    }


    /**
     * 去到员工管理页面
     * @return
     */
    @RequestMapping("/toEmployeeManager")
    public String toEmployeeManager(){
        return "admin/employee/employeeManager";
    }

    /**
     * 去到菜单管理页面
     * @return
     */
    @RequestMapping("/toMenuManager")
    public String toMenuManager(){
        return "admin/menu/menuManager";
    }

    /**
     * 去到楼层管理页面
     * @return
     */
    @RequestMapping("/toFloorManager")
    public String toFloorManager(){
        return "admin/floor/floorManager";
    }

    /**
     * 去到房型管理页面
     * @return
     */
    @RequestMapping("/toRoomTypeManager")
    public String toRoomTypeManager(){
        return "admin/roomType/roomTypeManager";
    }

    /**
     * 去到房间管理页面
     * @return
     */
    @RequestMapping("/toRoomManager")
    public String toRoomManager(){
        return "admin/room/roomManager";
    }

    /**
     * 去到预订管理页面
     * @return
     */
    @RequestMapping("/toOrdersManager")
    public String toOrdersManager(){
        return "admin/orders/ordersManager";
    }
    /**
     * 去到入住管理页面
     * @return
     */
    @RequestMapping("/toCheckinManager")
    public String toCheckinManager(){
        return "admin/checkin/checkinManager";
    }


    /**
     * 去到年度营业额报表统计分析页面
     * @return
     */
    @RequestMapping("/toYearTotalPriceManager")
    public String toYearTotalPriceManager(){
        return "admin/charts/yearTotalPriceCharts";
    }


    /**
     * 去到月营业额报表统计分析页面
     * @return
     */
    @RequestMapping("/toYearOfMonthCharts")
    public String toYearOfMonthCharts(){
        return "admin/charts/yearOfMonthCharts";
    }

    /**
     * 去到季度营业额报表统计分析页面
     * @return
     */
    @RequestMapping("/toQuarterTotalPriceCharts")
    public String toQuarterTotalPriceCharts(){
        return "admin/charts/quarterTotalPriceCharts";
    }

    /**
     * 去到房型预订报表统计分析页面
     * @return
     */
    @RequestMapping("/toRoomTypePieCharts")
    public String toRoomTypePieCharts(){
        return "admin/charts/roomTypePieCharts";
    }

    /**
     * 当日开房报表
     * @return
     */
    @RequestMapping({"/toCurrentDateCheckinCharts"})
    public String toCurrentDateCheckinCharts(){
        return "admin/charts/currentDateCheckinCharts";
    }


}
