package com.gitmastery.user;

import com.gitmastery.common.IdGenerator;
import com.gitmastery.common.ValidationException;

import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.Objects;

public class UserService {
    private final UserRepository repository;
    private final IdGenerator idGenerator;

    public UserService(UserRepository repository, IdGenerator idGenerator) {
        this.repository = Objects.requireNonNull(repository, "repository must not be null");
        this.idGenerator = Objects.requireNonNull(idGenerator, "idGenerator must not be null");
    }

    public User register(String name, String email) {
        String normalizedEmail = normalizeEmail(email);
        repository.findByEmail(normalizedEmail).ifPresent(existing -> {
            throw new ValidationException("User already exists with email " + normalizedEmail);
        });
        User user = new User(idGenerator.nextId(), name, normalizedEmail, true);
        return repository.save(user);
    }

    public User deactivate(String userId) {
        User user = repository.findById(userId)
                .orElseThrow(() -> new ValidationException("User not found: " + userId));
        return repository.save(user.deactivate());
    }

    public List<User> listActiveUsers() {
        return repository.findAll().stream()
                .filter(User::active)
                .sorted(Comparator.comparing(User::email))
                .toList();
    }

    String normalizeEmail(String email) {
        if (email == null || email.isBlank()) {
            throw new ValidationException("Email must not be blank");
        }
        return email.strip().toLowerCase(Locale.ROOT);
    }
}
