package com.gitmastery.payment;

import com.gitmastery.common.Money;

public record Payment(String id, String orderId, Money total, PaymentMethod method, PaymentStatus status) {
}
