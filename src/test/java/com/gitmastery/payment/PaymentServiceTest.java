package com.gitmastery.payment;

import com.gitmastery.common.IdGenerator;
import com.gitmastery.common.Money;
import com.gitmastery.common.ValidationException;
import org.junit.jupiter.api.Test;

import java.math.BigDecimal;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

class PaymentServiceTest {
    @Test
    void calculatesTotalWithTaxAndDiscount() {
        PaymentService service = new PaymentService(new FakePaymentGateway(), new IdGenerator("pay"));

        Money total = service.calculateTotal(Money.usd("100.00"), new BigDecimal("0.10"), Money.usd("5.00"));

        assertEquals(Money.usd("105.00"), total);
    }

    @Test
    void roundsHalfUpToTwoDecimals() {
        PaymentService service = new PaymentService(new FakePaymentGateway(), new IdGenerator("pay"));

        Money total = service.calculateTotal(Money.usd("10.015"), new BigDecimal("0.10"), Money.usd("0.00"));

        assertEquals(Money.usd("11.02"), total);
    }

    @Test
    void rejectsNegativeDiscount() {
        PaymentService service = new PaymentService(new FakePaymentGateway(), new IdGenerator("pay"));

        assertThrows(ValidationException.class,
                () -> service.calculateTotal(Money.usd("20.00"), new BigDecimal("0.10"), Money.usd("-1.00")));
    }
}
