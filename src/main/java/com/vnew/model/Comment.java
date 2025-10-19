package com.vnew.model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

class Comment {
    private int id;
    private int articleId;
    private String userId;
    private String userName;
    private String content;
    private LocalDateTime createdDate;
    private boolean approved;
    
    public Comment() {
        this.createdDate = LocalDateTime.now();
        this.approved = false;
    }
    
    public Comment(int id, int articleId, String userName, String content) {
        this();
        this.id = id;
        this.articleId = articleId;
        this.userName = userName;
        this.content = content;
    }
    
    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public int getArticleId() { return articleId; }
    public void setArticleId(int articleId) { this.articleId = articleId; }
    
    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }
    
    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }
    
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    
    public LocalDateTime getCreatedDate() { return createdDate; }
    public void setCreatedDate(LocalDateTime createdDate) { 
        this.createdDate = createdDate; 
    }
    
    public boolean isApproved() { return approved; }
    public void setApproved(boolean approved) { this.approved = approved; }
    
    public String getFormattedDate() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
        return createdDate.format(formatter);
    }
}