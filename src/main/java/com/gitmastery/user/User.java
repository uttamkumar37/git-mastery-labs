package com.gitmastery.user;

import com.gitmastery.common.ValidationException;

import java.util.Objects;

public record User(String id, String name, String email, boolean active) {
    public User {
        if (isBlank(id)) {
            throw new ValidationException("User id must not be blank");
        }
        if (isBlank(name)) {
            throw new ValidationException("User name must not be blank");
        }
        if (isBlank(email) || !email.contains("@")) {
            throw new ValidationException("User email must be valid");
        }
        id = id.trim();
        name = name.trim();
        email = email.trim().toLowerCase();
    }

    public User deactivate() {
        return new User(id, name, email, false);
    }

    private static boolean isBlank(String value) {
        return Objects.isNull(value) || value.isBlank();
    }
}
