package com.gitmastery.notification;

public class NotificationTemplateRenderer {
    public String paymentApproved(String orderId) {
        return "Payment approved for order " + orderId;
    }
}
