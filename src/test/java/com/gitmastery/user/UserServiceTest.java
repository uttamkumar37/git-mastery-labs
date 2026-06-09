package com.gitmastery.user;

import com.gitmastery.common.IdGenerator;
import com.gitmastery.common.ValidationException;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

class UserServiceTest {
    @Test
    void registersUserWithNormalizedEmail() {
        UserService service = new UserService(new InMemoryUserRepository(), new IdGenerator("usr"));

        User user = service.register("Uttam Kumar", " Uttam@Example.COM ");

        assertEquals("uttam@example.com", user.email());
        assertTrue(user.active());
    }

    @Test
    void rejectsDuplicateEmail() {
        UserService service = new UserService(new InMemoryUserRepository(), new IdGenerator("usr"));
        service.register("Asha Rao", "asha@example.com");

        assertThrows(ValidationException.class, () -> service.register("Asha Duplicate", "ASHA@example.com"));
    }

    @Test
    void deactivatesUser() {
        UserService service = new UserService(new InMemoryUserRepository(), new IdGenerator("usr"));
        User user = service.register("Dev User", "dev@example.com");

        User deactivated = service.deactivate(user.id());

        assertFalse(deactivated.active());
    }
}
