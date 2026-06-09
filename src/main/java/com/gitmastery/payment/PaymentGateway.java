package com.gitmastery.payment;

import com.gitmastery.common.Money;

public interface PaymentGateway {
    boolean authorize(String orderId, Money amount, PaymentMethod method);
}
