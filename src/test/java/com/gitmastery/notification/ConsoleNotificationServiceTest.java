package com.gitmastery.notification;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class ConsoleNotificationServiceTest {
    @Test
    void storesFormattedNotification() {
        ConsoleNotificationService service = new ConsoleNotificationService();

        service.notify(" USER@example.COM ", " Payment approved ");

        assertEquals("user@example.com :: Payment approved", service.sentMessages().get(0));
    }
}
