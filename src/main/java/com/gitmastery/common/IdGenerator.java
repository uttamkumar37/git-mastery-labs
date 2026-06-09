package com.gitmastery.common;

import java.util.Objects;
import java.util.concurrent.atomic.AtomicLong;

public class IdGenerator {
    private final String prefix;
    private final AtomicLong sequence = new AtomicLong(1000);

    public IdGenerator(String prefix) {
        if (prefix == null || prefix.isBlank()) {
            throw new ValidationException("ID prefix must not be blank");
        }
        this.prefix = prefix.trim().toLowerCase();
    }

    public String nextId() {
        return prefix + "-" + sequence.incrementAndGet();
    }

    public boolean owns(String id) {
        return Objects.requireNonNull(id, "id must not be null").startsWith(prefix + "-");
    }
}
