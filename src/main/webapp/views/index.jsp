<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.vnew.dao.ArticleDAO" %>
<%@ page import="com.vnew.model.Article" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    // Initialize DAO
    ArticleDAO articleDAO = new ArticleDAO();
    
    // Get data
    List<Article> featuredArticles = articleDAO.getFeaturedArticles();
    List<Article> articles = articleDAO.getLatestArticles(10);
    List<Article> popularArticles = articleDAO.getMostViewedArticles(5);
    
    // Set attributes
    request.setAttribute("featuredArticles", featuredArticles);
    request.setAttribute("articles", articles);
    request.setAttribute("popularArticles", popularArticles);
    request.setAttribute("totalArticles", articleDAO.getPublishedArticleCount());
    request.setAttribute("totalViews", articleDAO.getTotalViews());
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>V News - Tin tức Nóng hổi, Cập nhật 24/7</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lora:wght@700&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header class="site-header">
        <div class="container">
            <div class="logo">
                <a href="index.jsp">V <span>News</span></a>
            </div>
            <nav class="menu">
                <a href="index.jsp" class="active">Trang chủ</a>
                <a href="category.jsp?name=Công nghệ">Công nghệ</a>
                <a href="category.jsp?name=Khoa học">Khoa học</a>
                <a href="category.jsp?name=Kinh tế">Kinh tế</a>
                <a href="manage_all_news.jsp">Quản trị</a>
            </nav>
        </div>
    </header>

    <div class="container">
        <!-- Featured Article -->
        <c:if test="${not empty featuredArticles && featuredArticles.size() > 0}">
            <c:set var="featuredArticle" value="${featuredArticles[0]}" />
            <section class="featured-article">
                <img src="${featuredArticle.imageUrl}" alt="${featuredArticle.title}">
                <div class="featured-content">
                    <div class="category">${featuredArticle.category}</div>
                    <h2><a href="article-detail.jsp?id=${featuredArticle.id}">${featuredArticle.title}</a></h2>
                    <p>${featuredArticle.summary}</p>
                    <div class="article-meta" style="margin-bottom: 15px;">
                        <span>Bởi ${featuredArticle.author}</span> • 
                        <span>${featuredArticle.formattedDate}</span> • 
                        <span>${featuredArticle.views} lượt xem</span>
                    </div>
                    <a href="article-detail.jsp?id=${featuredArticle.id}" class="read-more">Đọc tiếp →</a>
                </div>
            </section>
        </c:if>

        <div class="main-layout">
            <main class="news-list">
                <h2 class="page-title" style="margin-top:0; font-size: 28px;">Tin Mới Nhất</h2>
                
                <c:forEach var="article" items="${articles}">
                    <article class="news-item">
                        <div class="image-container">
                            <img src="${article.imageUrl}" alt="${article.title}">
                        </div>
                        <div class="news-content">
                            <div class="category" style="color: var(--primary-color); font-weight: 700; font-size: 12px; text-transform: uppercase; margin-bottom: 8px;">
                                ${article.category}
                            </div>
                            <h3><a href="article-detail.jsp?id=${article.id}">${article.title}</a></h3>
                            <p>${article.summary}</p>
                            <div class="news-meta">
                                <span>Đăng ngày: ${article.formattedDate}</span> • 
                                <span>Bởi ${article.author}</span> • 
                                <span>${article.views} lượt xem</span>
                            </div>
                        </div>
                    </article>
                </c:forEach>
            </main>
            
            <aside class="sidebar">
                <div class="box" style="background: white; padding: 20px; border-radius: 8px; border: 1px solid #e0e0e0; margin-bottom: 20px;">
                    <h3 style="font-family: var(--font-heading); margin-bottom: 15px;">Đọc nhiều nhất</h3>
                    <ul style="list-style: none;">
                        <c:forEach var="popular" items="${popularArticles}" varStatus="status">
                            <li style="margin-bottom: 15px; padding-bottom: 15px; border-bottom: 1px solid #f0f0f0;">
                                <span style="font-size: 24px; font-weight: 700; color: var(--primary-color); margin-right: 10px;">${status.index + 1}</span>
                                <a href="article-detail.jsp?id=${popular.id}" 
                                   style="text-decoration: none; color: var(--text-dark); font-weight: 600;">
                                    ${popular.title}
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

                <div class="box" style="background: linear-gradient(135deg, var(--primary-color) 0%, var(--primary-color-darker) 100%); padding: 20px; border-radius: 8px; color: white;">
                    <h3 style="margin-bottom: 15px;">Thống kê</h3>
                    <ul style="list-style: none;">
                        <li style="margin-bottom: 10px;">📄 Tổng số bài viết: <strong>${totalArticles}</strong></li>
                        <li>👁️ Tổng lượt xem: <strong>${totalViews}</strong></li>
                    </ul>
                </div>
            </aside>
        </div>
    </div>
    
    <footer class="site-footer">
        <div class="container">
            <p>&copy; 2025 V News. Mọi quyền được bảo lưu.</p>
        </div>
    </footer>
</body>
</html>