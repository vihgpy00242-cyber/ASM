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


@WebServlet("/home")
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ArticleDAO articleDAO;

    public void init() {
        articleDAO = new ArticleDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        List<Article> articleList = articleDAO.getAllArticles();
        request.setAttribute("articles", articleList);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}