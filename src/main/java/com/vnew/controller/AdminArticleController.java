package com.vnew.controller;

import com.vnew.dao.ArticleDAO;
import com.vnew.model.Article;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;

@WebServlet("/admin/articles")
public class AdminArticleController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ArticleDAO articleDAO;

    public void init() {
        articleDAO = new ArticleDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if (action == null) {
            action = "list";
        }
        
        switch (action) {
            case "list":
                listArticles(request, response);
                break;
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteArticle(request, response);
                break;
            default:
                listArticles(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        String idParam = request.getParameter("id");
        String title = request.getParameter("title");
        String summary = request.getParameter("summary");
        String content = request.getParameter("content");
        String category = request.getParameter("category");
        String imageUrl = request.getParameter("imageUrl");
        String author = request.getParameter("author");
        String tagsStr = request.getParameter("tags");
        String featuredStr = request.getParameter("featured");
        String publishedStr = request.getParameter("published");
        
        Article article = new Article();
        article.setTitle(title);
        article.setSummary(summary);
        article.setContent(content);
        article.setCategory(category);
        article.setImageUrl(imageUrl);
        article.setAuthor(author != null ? author : "Admin");
        article.setFeatured("on".equals(featuredStr));
        article.setPublished(publishedStr == null || "on".equals(publishedStr));
        
        if (tagsStr != null && !tagsStr.trim().isEmpty()) {
            List<String> tags = Arrays.asList(tagsStr.split(","));
            article.setTags(tags);
        }
        
        if (idParam != null && !idParam.isEmpty()) {
            // Update existing article
            article.setId(Integer.parseInt(idParam));
            Article existing = articleDAO.getArticleById(article.getId());
            if (existing != null) {
                article.setPublishDate(existing.getPublishDate());
                article.setViews(existing.getViews());
                articleDAO.updateArticle(article);
            }
        } else {
            // Create new article
            article.setPublishDate(LocalDate.now());
            articleDAO.addArticle(article);
        }
        
        response.sendRedirect(request.getContextPath() + "/admin/articles");
    }
    
    private void listArticles(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String pageParam = request.getParameter("page");
        int currentPage = pageParam != null ? Integer.parseInt(pageParam) : 1;
        int pageSize = 10;
        
        List<Article> articles = articleDAO.getArticlesWithPagination(currentPage, pageSize);
        int totalPages = articleDAO.getTotalPages(pageSize);
        
        request.setAttribute("articles", articles);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.getRequestDispatcher("/manage_all_news.jsp").forward(request, response);
    }
    
    private void showCreateForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/edit_news.jsp").forward(request, response);
    }
    
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        Article article = articleDAO.getArticleById(id);
        
        if (article != null) {
            request.setAttribute("article", article);
            request.getRequestDispatcher("/edit_news.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/articles");
        }
    }
    
    private void deleteArticle(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        articleDAO.deleteArticle(id);
        response.sendRedirect(request.getContextPath() + "/admin/articles");
    }
}