<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>${article.title} - V News</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lora:wght@700&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header class="site-header">
        <div class="container">
            <div class="logo">V <span>News</span></div>
            <nav class="menu"><a href="${pageContext.request.contextPath}/home">Trang chủ</a></nav>
        </div>
    </header>

    <div class="container">
        <article>
            <header class="article-header">
                <div class="category">${article.category}</div>
                <h1 class="page-title">${article.title}</h1>
                <div class="article-meta">Đăng ngày: ${article.publishDate}</div>
            </header>
            
            <img src="${article.imageUrl}" alt="${article.title}" class="article-image">
            
            <div class="article-content">
                <p><strong>${article.content}</strong></p>
                <p>Nội dung chi tiết của bài báo sẽ được hiển thị ở đây. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam.</p>
                <h3>Một tiêu đề phụ</h3>
                <p>Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. Pellentesque congue.</p>
            </div>
        </article>
    </div>

    <footer class="site-footer">
        <div class="container"><p>&copy; 2025 V News. Mọi quyền được bảo lưu.</p></div>
    </footer>
</body>
</html>