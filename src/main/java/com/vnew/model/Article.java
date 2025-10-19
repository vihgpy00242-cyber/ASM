package com.vnew.model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.xml.stream.events.Comment;

public class Article {
    private int id;
    private String title;
    private String summary;
    private String content;
    private String imageUrl;
    private String category;
    private LocalDate publishDate;
    private String author;
    private int views;
    private boolean featured;
    private boolean published;
    private List<String> tags;
    private List<Comment> comments;
    
    // Constructors
    public Article() {
        this.tags = new ArrayList<>();
        this.comments = new ArrayList<>();
        this.publishDate = LocalDate.now();
        this.views = 0;
        this.featured = false;
        this.published = true;
    }

    public Article(int id, String title, String summary, String content, String imageUrl, 
                   String category, LocalDate publishDate, String author) {
        this();
        this.id = id;
        this.title = title;
        this.summary = summary;
        this.content = content;
        this.imageUrl = imageUrl;
        this.category = category;
        this.publishDate = publishDate;
        this.author = author;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    
    public String getSummary() { return summary; }
    public void setSummary(String summary) { this.summary = summary; }
    
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
    
    public LocalDate getPublishDate() { return publishDate; }
    public void setPublishDate(LocalDate publishDate) { this.publishDate = publishDate; }
    
    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }
    
    public int getViews() { return views; }
    public void setViews(int views) { this.views = views; }
    public void incrementViews() { this.views++; }
    
    public boolean isFeatured() { return featured; }
    public void setFeatured(boolean featured) { this.featured = featured; }
    
    public boolean isPublished() { return published; }
    public void setPublished(boolean published) { this.published = published; }
    
    public List<String> getTags() { return tags; }
    public void setTags(List<String> tags) { this.tags = tags; }
    public void addTag(String tag) { this.tags.add(tag); }
    
    public List<Comment> getComments() { return comments; }
    public void setComments(List<Comment> comments) { this.comments = comments; }
    public void addComment(Comment comment) { this.comments.add(comment); }
    
    // Utility methods
    public String getFormattedDate() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        return publishDate.format(formatter);
    }
    
    public String getShortContent(int maxLength) {
        if (content == null) return "";
        return content.length() > maxLength ? 
               content.substring(0, maxLength) + "..." : content;
    }
    
    public int getCommentCount() {
        return comments.size();
    }
    
    public String getTagsAsString() {
        return String.join(", ", tags);
    }
}