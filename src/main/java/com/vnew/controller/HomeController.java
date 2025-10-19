package com.vnew.controller;

import com.vnew.dao.ArticleDAO;
import com.vnew.model.Article;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet({"/home", "/"})
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ArticleDAO articleDAO;

    public void init() {
        articleDAO = new ArticleDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get featured articles for hero section
        List<Article> featuredArticles = articleDAO.getFeaturedArticles();
        
        // Get latest articles
        List<Article> latestArticles = articleDAO.getLatestArticles(10);
        
        // Get most viewed articles for sidebar
        List<Article> popularArticles = articleDAO.getMostViewedArticles(5);
        
        // Get articles by category for different sections
        List<Article> techArticles = articleDAO.getArticlesByCategory("Công nghệ");
        List<Article> scienceArticles = articleDAO.getArticlesByCategory("Khoa học");
        List<Article> economyArticles = articleDAO.getArticlesByCategory("Kinh tế");
        
        // Set attributes
        request.setAttribute("featuredArticles", featuredArticles);
        request.setAttribute("articles", latestArticles);
        request.setAttribute("popularArticles", popularArticles);
        request.setAttribute("techArticles", techArticles);
        request.setAttribute("scienceArticles", scienceArticles);
        request.setAttribute("economyArticles", economyArticles);
        
        // Statistics
        request.setAttribute("totalArticles", articleDAO.getPublishedArticleCount());
        request.setAttribute("totalViews", articleDAO.getTotalViews());
        
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}