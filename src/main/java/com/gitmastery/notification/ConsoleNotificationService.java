package com.gitmastery.notification;

import com.gitmastery.common.ValidationException;

import java.util.ArrayList;
import java.util.List;

public class ConsoleNotificationService implements NotificationService {
    private final List<String> sentMessages = new ArrayList<>();

    @Override
    public void notify(String recipient, String message) {
        if (recipient == null || recipient.isBlank()) {
            throw new ValidationException("Recipient must not be blank");
        }
        if (message == null || message.isBlank()) {
            throw new ValidationException("Message must not be blank");
        }
        String formatted = recipient.trim().toLowerCase() + " :: " + message.trim();
        sentMessages.add(formatted);
        System.out.println("NOTIFICATION " + formatted);
    }

    public List<String> sentMessages() {
        return List.copyOf(sentMessages);
    }
}
