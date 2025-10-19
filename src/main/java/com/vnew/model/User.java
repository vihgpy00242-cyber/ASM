package com.vnew.model;

import java.time.LocalDateTime;

// ============================================
// User Model
// ============================================
public class User {
    private int id;
    private String username;
    private String password;
    private String email;
    private String fullName;
    private String role; // ADMIN, REPORTER, USER
    private LocalDateTime registeredDate;
    private boolean active;
    private String avatar;
    
    public User() {
        this.registeredDate = LocalDateTime.now();
        this.active = true;
        this.role = "USER";
    }
    
    public User(int id, String username, String email, String fullName, String role) {
        this();
        this.id = id;
        this.username = username;
        this.email = email;
        this.fullName = fullName;
        this.role = role;
    }
    
    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }
    
    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
    
    public LocalDateTime getRegisteredDate() { return registeredDate; }
    public void setRegisteredDate(LocalDateTime registeredDate) { 
        this.registeredDate = registeredDate; 
    }
    
    public boolean isActive() { return active; }
    public void setActive(boolean active) { this.active = active; }
    
    public String getAvatar() { return avatar; }
    public void setAvatar(String avatar) { this.avatar = avatar; }
    
    // Utility methods
    public boolean isAdmin() { return "ADMIN".equals(role); }
    public boolean isReporter() { return "REPORTER".equals(role); }
    public boolean isUser() { return "USER".equals(role); }
}