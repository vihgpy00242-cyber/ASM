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

@WebServlet("/search")
public class SearchController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ArticleDAO articleDAO;

    public void init() {
        articleDAO = new ArticleDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String keyword = request.getParameter("q");
        String category = request.getParameter("category");
        String tag = request.getParameter("tag");
        
        List<Article> results;
        String searchType = "";
        
        if (keyword != null && !keyword.trim().isEmpty()) {
            results = articleDAO.searchArticles(keyword);
            searchType = "Kết quả tìm kiếm cho: \"" + keyword + "\"";
        } else if (category != null && !category.trim().isEmpty()) {
            results = articleDAO.getArticlesByCategory(category);
            searchType = "Chuyên mục: " + category;
        } else if (tag != null && !tag.trim().isEmpty()) {
            results = articleDAO.getArticlesByTag(tag);
            searchType = "Tag: " + tag;
        } else {
            results = articleDAO.getPublishedArticles();
            searchType = "Tất cả bài viết";
        }
        
        request.setAttribute("articles", results);
        request.setAttribute("searchType", searchType);
        request.setAttribute("resultCount", results.size());
        request.getRequestDispatcher("/search-results.jsp").forward(request, response);
    }
}