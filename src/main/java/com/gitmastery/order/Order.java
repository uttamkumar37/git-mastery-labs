package com.gitmastery.order;

import com.gitmastery.common.Money;
import com.gitmastery.common.ValidationException;

import java.util.List;

public record Order(String id, String userId, List<OrderItem> items, OrderStatus status) {
    public Order {
        if (id == null || id.isBlank()) {
            throw new ValidationException("Order id must not be blank");
        }
        if (userId == null || userId.isBlank()) {
            throw new ValidationException("Order user id must not be blank");
        }
        if (items == null || items.isEmpty()) {
            throw new ValidationException("Order must contain at least one item");
        }
        items = List.copyOf(items);
        status = status == null ? OrderStatus.CREATED : status;
    }

    public Money total() {
        return items.stream()
                .map(OrderItem::lineTotal)
                .reduce(Money.usd("0.00"), Money::add);
    }

    public Order markPaid() {
        return new Order(id, userId, items, OrderStatus.PAID);
    }
}
