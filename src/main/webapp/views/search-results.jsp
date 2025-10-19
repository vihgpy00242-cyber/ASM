<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kết quả tìm kiếm - V News</title>
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
                <a href="${pageContext.request.contextPath}/category?name=Công nghệ">Công nghệ</a>
                <a href="${pageContext.request.contextPath}/category?name=Khoa học">Khoa học</a>
                <a href="${pageContext.request.contextPath}/category?name=Kinh tế">Kinh tế</a>
            </nav>
            <div class="header-actions">
                <form action="${pageContext.request.contextPath}/search" method="get" style="display: inline-block;">
                    <input type="text" name="q" value="${param.q}" placeholder="Tìm kiếm..." style="padding: 8px 15px; border: 1px solid #e0e0e0; border-radius: 5px;">
                    <button type="submit" class="btn btn-primary" style="padding: 8px 15px;">Tìm</button>
                </form>
            </div>
        </div>
    </header>

    <div class="container">
        <h1 class="page-title">${searchType}</h1>
        <p style="color: #666; margin-bottom: 30px;">Tìm thấy <strong>${resultCount}</strong> kết quả</p>

        <c:choose>
            <c:when test="${not empty articles && articles.size() > 0}">
                <div style="display: grid; gap: 25px;">
                    <c:forEach var="article" items="${articles}">
                        <article class="news-item" style="display: grid; grid-template-columns: 250px 1fr; gap: 20px;">
                            <div class="image-container">
                                <img src="${article.imageUrl}" alt="${article.title}">
                            </div>
                            <div class="news-content">
                                <div class="category" style="color: var(--primary-color); font-weight: 700; font-size: 12px; text-transform: uppercase; margin-bottom: 8px;">
                                    ${article.category}
                                </div>
                                <h3 style="font-size: 22px; margin-bottom: 10px;">
                                    <a href="${pageContext.request.contextPath}/article?id=${article.id}">${article.title}</a>
                                </h3>
                                <p style="color: var(--text-muted); margin-bottom: 12px;">${article.summary}</p>
                                <div class="news-meta">
                                    <span>${article.formattedDate}</span> • 
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
                </div>
            </c:when>
            <c:otherwise>
                <div style="text-align: center; padding: 60px 0;">
                    <svg style="width: 120px; height: 120px; margin-bottom: 20px;" fill="none" stroke="#ccc" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                    </svg>
                    <h2 style="font-size: 24px; color: #666; margin-bottom: 10px;">Không tìm thấy kết quả</h2>
                    <p style="color: #999;">Vui lòng thử lại với từ khóa khác</p>
                    <a href="${pageContext.request.contextPath}/home" class="btn btn-primary" style="margin-top: 20px;">Về trang chủ</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <footer class="site-footer">
        <div class="container">
            <p>&copy; 2025 V News. Mọi quyền được bảo lưu.</p>
        </div>
    </footer>
</body>
</html>