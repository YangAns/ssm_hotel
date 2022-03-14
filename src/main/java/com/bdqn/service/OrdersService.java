package com.bdqn.service;

import com.bdqn.entity.Orders;
import com.bdqn.vo.OrdersVo;

import java.util.List;

public interface OrdersService {
    /**
     * 添加订单
     * @param orders
     * @return
     */
    int addOrders(Orders orders);

    /**
     * 查询订单列表
     * @param ordersVo
     * @return
     */
    List<Orders> findOrdersList(OrdersVo ordersVo);

    /**
     * 按用户id查询订单列表
     */
    List<Orders> findOrdersListById(Integer accountId);

    /**
     * 修改订单
     * @param orders
     * @return
     */
    int updateOrders(Orders orders);

    int deleteById(Integer id);
}
