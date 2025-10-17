package com.vnew.controller;

import com.vnew.dao.ArticleDAO;
import com.vnew.model.Article;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet("/article")
public class ArticleController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ArticleDAO articleDAO;

    public void init() {
        articleDAO = new ArticleDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Article article = articleDAO.getArticleById(id);

            if (article != null) {
                request.setAttribute("article", article);
                request.getRequestDispatcher("article-detail.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Article not found");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid article ID");
        }
    }
}