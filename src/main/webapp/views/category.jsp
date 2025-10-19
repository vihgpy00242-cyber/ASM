<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${categoryName} - V News</title>
    <link href="https://fonts.googleapis.com/css2?family=Lora:wght@700&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <header class="site-header">
        <div class="container">
            <div class="logo">
                <a href="${pageContext.request.contextPath}/home">V <span>News</span></a>
            </div>
            <nav class="menu">
                <a href="${pageContext.request.contextPath}/home">Trang chủ</a>
                <a href="${pageContext.request.contextPath}/category?name=Công nghệ" ${categoryName == 'Công nghệ' ? 'class="active"' : ''}>Công nghệ</a>
                <a href="${pageContext.request.contextPath}/category?name=Khoa học" ${categoryName == 'Khoa học' ? 'class="active"' : ''}>Khoa học</a>
                <a href="${pageContext.request.contextPath}/category?name=Kinh tế" ${categoryName == 'Kinh tế' ? 'class="active"' : ''}>Kinh tế</a>
            </nav>
        </div>
    </header>

    <div class="container">
        <div style="background: linear-gradient(135deg, var(--primary-color) 0%, var(--primary-color-darker) 100%); padding: 40px; border-radius: 8px; margin-bottom: 40px; color: white;">
            <h1 class="page-title" style="color: white; border: none; margin: 0; padding: 0; font-size: 48px;">
                ${categoryName}
            </h1>
            <p style="font-size: 18px; margin-top: 10px; opacity: 0.9;">${articleCount} bài viết</p>
        </div>

        <div class="main-layout">
            <main class="news-list">
                <c:choose>
                    <c:when test="${not empty articles && articles.size() > 0}">
                        <c:forEach var="article" items="${articles}">
                            <article class="news-item">
                                <div class="image-container">
                                    <img src="${article.imageUrl}" alt="${article.title}">
                                </div>
                                <div class="news-content">
                                    <h3><a href="${pageContext.request.contextPath}/article?id=${article.id}">${article.title}</a></h3>
                                    <p>${article.summary}</p>
                                    <div class="news-meta">
                                        <span>Đăng ngày: ${article.formattedDate}</span> • 
                                        <span>Bởi ${article.author}</span> • 
                                        <span>${article.views} lượt xem</span>
                                    </div>
                                    <c:if test="${not empty article.tags && article.tags.size() > 0}">
                                        <div class="tags" style="margin-top: 10px;">
                                            <c:forEach var="tag" items="${article.tags}">
                                                <a href="${pageContext.request.contextPath}/search?tag=${tag}" 
                                                   style="display: inline-block; background: #f0f0f0; padding: 4px 10px; margin-right: 5px; border-radius: 3px; font-size: 12px; text-decoration: none; color: #666;">
                                                    #${tag}
                                                </a>
                                            </c:forEach>
                                        </div>
                                    </c:if>
                                </div>
                            </article>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div style="text-align: center; padding: 60px 0; background: white; border-radius: 8px;">
                            <p style="font-size: 18px; color: #999;">Chưa có bài viết nào trong chuyên mục này</p>
                            <a href="${pageContext.request.contextPath}/home" class="btn btn-primary" style="margin-top: 20px;">Về trang chủ</a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </main>

            <aside class="sidebar">
                <div class="box" style="background: white; padding: 20px; border-radius: 8px; border: 1px solid #e0e0e0;">
                    <h3 style="font-family: var(--font-heading); margin-bottom: 15px; border-bottom: 2px solid var(--primary-color); padding-bottom: 10px;">
                        Chuyên mục khác
                    </h3>
                    <ul style="list-style: none;">
                        <li style="margin-bottom: 10px;">
                            <a href="${pageContext.request.contextPath}/category?name=Công nghệ" 
                               style="text-decoration: none; color: var(--text-dark); display: block; padding: 8px; border-radius: 5px;">
                                📱 Công nghệ
                            </a>
                        </li>
                        <li style="margin-bottom: 10px;">
                            <a href="${pageContext.request.contextPath}/category?name=Khoa học" 
                               style="text-decoration: none; color: var(--text-dark); display: block; padding: 8px; border-radius: 5px;">
                                🔬 Khoa học
                            </a>
                        </li>
                        <li style="margin-bottom: 10px;">
                            <a href="${pageContext.request.contextPath}/category?name=Kinh tế" 
                               style="text-decoration: none; color: var(--text-dark); display: block; padding: 8px; border-radius: 5px;">
                                💼 Kinh tế
                            </a>
                        </li>
                        <li style="margin-bottom: 10px;">
                            <a href="${pageContext.request.contextPath}/category?name=Thời sự" 
                               style="text-decoration: none; color: var(--text-dark); display: block; padding: 8px; border-radius: 5px;">
                                📰 Thời sự
                            </a>
                        </li>
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