package com.gitmastery.payment;

import com.gitmastery.common.IdGenerator;
import com.gitmastery.common.Money;
import com.gitmastery.common.ValidationException;

import java.math.BigDecimal;
import java.util.Objects;

public class PaymentService {
    private final PaymentGateway gateway;
    private final IdGenerator idGenerator;

    public PaymentService(PaymentGateway gateway, IdGenerator idGenerator) {
        this.gateway = Objects.requireNonNull(gateway, "gateway must not be null");
        this.idGenerator = Objects.requireNonNull(idGenerator, "idGenerator must not be null");
    }

    public Payment charge(String orderId, Money subtotal, BigDecimal taxRate, Money discount, PaymentMethod method) {
        Money total = calculateTotal(subtotal, taxRate, discount);
        boolean approved = gateway.authorize(orderId, total, method);
        return new Payment(idGenerator.nextId(), orderId, total, method,
                approved ? PaymentStatus.APPROVED : PaymentStatus.DECLINED);
    }

    public Money calculateTotal(Money subtotal, BigDecimal taxRate, Money discount) {
        validateCalculationInput(subtotal, taxRate, discount);
        Money tax = calculateTax(subtotal, taxRate);
        return subtotal.add(tax).subtract(discount);
    }

    private Money calculateTax(Money subtotal, BigDecimal taxRate) {
        return subtotal.multiply(taxRate);
    }

    private void validateCalculationInput(Money subtotal, BigDecimal taxRate, Money discount) {
        if (subtotal == null || subtotal.isNegative()) {
            throw new ValidationException("Subtotal must not be negative");
        }
        if (taxRate == null || taxRate.signum() < 0) {
            throw new ValidationException("Tax rate must not be negative");
        }
        if (discount == null || discount.isNegative()) {
            throw new ValidationException("Discount must not be negative");
        }
    }
}
