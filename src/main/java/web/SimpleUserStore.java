package web;

import java.util.HashMap;
import java.util.Map;

public final class SimpleUserStore {

    private static final Map<String, String> USERS = new HashMap<>();

    static {
        USERS.put("admin", "admin123");
        USERS.put("teacher", "teacher123");
    }

    private SimpleUserStore() {
    }

    public static boolean isValid(String username, String password) {
        if (username == null || password == null) {
            return false;
        }
        String savedPassword = USERS.get(username.trim());
        return savedPassword != null && savedPassword.equals(password);
    }

    public static boolean createUser(String username, String password) {
        if (username == null || password == null || username.trim().isEmpty()) {
            return false;
        }
        username = username.trim();
        if (USERS.containsKey(username)) {
            return false;
        }
        USERS.put(username, password);
        return true;
    }
}
