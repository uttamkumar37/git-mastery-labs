package com.gitmastery.order;

import com.gitmastery.common.IdGenerator;
import com.gitmastery.common.ValidationException;

import java.util.List;
import java.util.Objects;

public class OrderService {
    private final OrderRepository repository;
    private final IdGenerator idGenerator;

    public OrderService(OrderRepository repository, IdGenerator idGenerator) {
        this.repository = Objects.requireNonNull(repository, "repository must not be null");
        this.idGenerator = Objects.requireNonNull(idGenerator, "idGenerator must not be null");
    }

    public Order createOrder(String userId, List<OrderItem> items) {
        Order order = new Order(idGenerator.nextId(), userId, items, OrderStatus.CREATED);
        return repository.save(order);
    }

    public Order markPaid(String orderId) {
        Order order = repository.findById(orderId)
                .orElseThrow(() -> new ValidationException("Order not found: " + orderId));
        return repository.save(order.markPaid());
    }

    public List<Order> findOrdersForUser(String userId) {
        return repository.findByUserId(userId);
    }
}
