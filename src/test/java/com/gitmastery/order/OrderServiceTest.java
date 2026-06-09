package com.gitmastery.order;

import com.gitmastery.common.IdGenerator;
import com.gitmastery.common.Money;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

class OrderServiceTest {
    @Test
    void createsOrderAndCalculatesTotal() {
        OrderService service = new OrderService(new InMemoryOrderRepository(), new IdGenerator("ord"));

        Order order = service.createOrder("usr-1001", List.of(
                new OrderItem("BOOK", 2, Money.usd("12.50")),
                new OrderItem("LAB", 1, Money.usd("20.00"))
        ));

        assertEquals(Money.usd("45.00"), order.total());
        assertEquals(OrderStatus.CREATED, order.status());
    }

    @Test
    void marksOrderPaid() {
        OrderService service = new OrderService(new InMemoryOrderRepository(), new IdGenerator("ord"));
        Order order = service.createOrder("usr-1001", List.of(new OrderItem("BOOK", 1, Money.usd("10.00"))));

        Order paid = service.markPaid(order.id());

        assertEquals(OrderStatus.PAID, paid.status());
    }
}
