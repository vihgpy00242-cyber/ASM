<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="24H News - Thêm/Sửa tin tức dành cho phóng viên.">
    <meta name="keywords" content="thêm tin, sửa tin, phóng viên, 24H News">
    <meta name="author" content="24H News">
    <title>24H News - Thêm/Sửa Tin Tức</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Open+Sans:wght@400;600&display=swap">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header class="site-header">
        <div class="container">
            <div class="logo">24H <span>News</span></div>
            <nav class="menu">
                <a href="index.jsp">Trang chủ</a>
                <a href="#">Văn hóa</a>
                <a href="#">Pháp luật</a>
                <a href="#">Thể thao</a>
                <a href="reporter.jsp" class="active">Quản lý tin</a>
            </nav>
            <div class="header-actions">
                <span class="user-info">Xin chào, Phóng viên <%= session.getAttribute("user") != null ? session.getAttribute("user") : "User" %></span>
                <a href="logout.jsp" class="logout-btn">Đăng xuất</a>
            </div>
        </div>
    </header>

    <div class="container">
        <section class="center-col" style="margin: 25px auto; max-width: 900px;">
            <h2><%= request.getParameter("id") != null ? "Sửa Tin Tức" : "Thêm Tin Tức Mới" %></h2>
            <form action="save_news" method="post" class="news-form">
                <input type="hidden" name="newsId" value="<%= request.getParameter("id") != null ? request.getParameter("id") : "" %>">
                <div class="form-group">
                    <label for="title">Tiêu đề</label>
                    <input type="text" id="title" name="title" placeholder="Nhập tiêu đề tin" required>
                </div>
                <div class="form-group">
                    <label for="category">Loại tin</label>
                    <select id="category" name="category" required>
                        <option value="dulich">Du lịch</option>
                        <option value="kinhte">Kinh tế</option>
                        <option value="giaoduc">Giáo dục</option>
                        <option value="congnghe">Công nghệ</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="image">URL hình ảnh</label>
                    <input type="text" id="image" name="image" placeholder="Nhập URL hình ảnh">
                </div>
                <div class="form-group">
                    <label for="content">Nội dung</label>
                    <textarea id="content" name="content" rows="10" placeholder="Nhập nội dung tin" required></textarea>
                </div>
                <button type="submit" class="submit-btn">Lưu tin</button>
            </form>
        </section>
    </div>

    <footer class="site-footer">
        <div class="container">
            <p>&copy; 2025 24H News. All rights reserved.</p>
            <div class="social-links">
                <a href="#">Facebook</a> | <a href="#">Twitter</a> | <a href="#">Instagram</a>
            </div>
            <p>Liên hệ: contact@24hnews.vn | Hotline: 0123 456 789</p>
        </div>
    </footer>
</body>
</html>