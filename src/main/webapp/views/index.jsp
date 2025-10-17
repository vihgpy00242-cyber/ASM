<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>V News - Tin tức Nóng hổi, Cập nhật 24/7</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lora:wght@700&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header class="site-header">
        <div class="container">
            <div class="logo">V <span>News</span></div>
            <nav class="menu">
                <a href="${pageContext.request.contextPath}/home" class="active">Trang chủ</a>
                <a href="#">Thời sự</a>
                <a href="#">Công nghệ</a>
            </nav>
            <div class="header-actions"><button class="login-btn">Đăng nhập</button></div>
        </div>
    </header>

    <div class="container">
        <c:set var="featuredArticle" value="${articles[0]}" />
        <section class="featured-article">
            <img src="${featuredArticle.imageUrl}" alt="${featuredArticle.title}">
            <div class="featured-content">
                <div class="category">${featuredArticle.category}</div>
                <h2><a href="${pageContext.request.contextPath}/article?id=${featuredArticle.id}">${featuredArticle.title}</a></h2>
                <p>${featuredArticle.content}</p>
                <a href="${pageContext.request.contextPath}/article?id=${featuredArticle.id}" class="read-more">Đọc tiếp →</a>
            </div>
        </section>

        <div class="main-layout">
            <main class="news-list">
                <h2 class="page-title" style="margin-top:0; font-size: 28px;">Tin Mới Nhất</h2>
                <c:forEach var="article" items="${articles}" begin="1">
                    <article class="news-item">
                        <div class="image-container"><img src="${article.imageUrl}" alt="${article.title}"></div>
                        <div class="news-content">
                            <h3><a href="${pageContext.request.contextPath}/article?id=${article.id}">${article.title}</a></h3>
                            <p>${article.content}</p>
                            <span class="news-meta">Đăng ngày: ${article.publishDate} - Chuyên mục: ${article.category}</span>
                        </div>
                    </article>
                </c:forEach>
            </main>
            <aside class="sidebar">
                <div class="box">
                    <h3>Đọc nhiều</h3>
                    <ul>
                        <li><a href="#">AI tự học có thay thế con người?</a></li>
                        <li><a href="#">Cuộc sống trên Sao Hỏa: Viễn cảnh và thách thức.</a></li>
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