package com.gitmastery.payment;

import com.gitmastery.common.Money;

public class FakePaymentGateway implements PaymentGateway {
    @Override
    public boolean authorize(String orderId, Money amount, PaymentMethod method) {
        return orderId != null && !amount.isNegative() && method != null;
    }
}
