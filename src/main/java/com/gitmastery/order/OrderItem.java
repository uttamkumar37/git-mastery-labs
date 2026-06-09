package com.gitmastery.order;

import com.gitmastery.common.Money;
import com.gitmastery.common.ValidationException;

public record OrderItem(String sku, int quantity, Money unitPrice) {
    public OrderItem {
        if (sku == null || sku.isBlank()) {
            throw new ValidationException("SKU must not be blank");
        }
        if (quantity <= 0) {
            throw new ValidationException("Quantity must be greater than zero");
        }
        if (unitPrice == null || unitPrice.isNegative()) {
            throw new ValidationException("Unit price must not be negative");
        }
        sku = sku.trim();
    }

    public Money lineTotal() {
        return unitPrice.multiply(java.math.BigDecimal.valueOf(quantity));
    }
}
