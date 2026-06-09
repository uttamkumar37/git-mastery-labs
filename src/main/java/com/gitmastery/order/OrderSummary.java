package com.gitmastery.order;

import com.gitmastery.common.Money;

public record OrderSummary(String orderId, String userId, Money total, OrderStatus status) {
    public static OrderSummary from(Order order) {
        return new OrderSummary(order.id(), order.userId(), order.total(), order.status());
    }
}
