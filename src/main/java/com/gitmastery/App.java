package com.gitmastery;

import com.gitmastery.common.IdGenerator;
import com.gitmastery.common.Money;
import com.gitmastery.notification.ConsoleNotificationService;
import com.gitmastery.order.InMemoryOrderRepository;
import com.gitmastery.order.OrderItem;
import com.gitmastery.order.OrderService;
import com.gitmastery.payment.FakePaymentGateway;
import com.gitmastery.payment.PaymentMethod;
import com.gitmastery.payment.PaymentService;
import com.gitmastery.user.InMemoryUserRepository;
import com.gitmastery.user.User;
import com.gitmastery.user.UserService;

import java.math.BigDecimal;
import java.util.List;

public class App {
    public static void main(String[] args) {
        UserService userService = new UserService(new InMemoryUserRepository(), new IdGenerator("usr"));
        OrderService orderService = new OrderService(new InMemoryOrderRepository(), new IdGenerator("ord"));
        PaymentService paymentService = new PaymentService(new FakePaymentGateway(), new IdGenerator("pay"));
        ConsoleNotificationService notificationService = new ConsoleNotificationService();

        User user = userService.register("Asha Rao", "ASHA@example.com");
        var order = orderService.createOrder(user.id(), List.of(
                new OrderItem("Java Git Workbook", 1, Money.usd("29.99")),
                new OrderItem("Practice Lab Access", 1, Money.usd("19.99"))
        ));
        var payment = paymentService.charge(order.id(), order.total(), new BigDecimal("0.10"), Money.usd("5.00"), PaymentMethod.CARD);
        notificationService.notify(user.email(), "Payment " + payment.status() + " for order " + order.id());

        System.out.println("Created user: " + user.email());
        System.out.println("Order total: " + order.total());
        System.out.println("Payment total: " + payment.total());
    }
}
