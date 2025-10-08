<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="24H News - Quản lý người dùng.">
    <meta name="keywords" content="quản lý người dùng, quản trị, 24H News">
    <meta name="author" content="24H News">
    <title>24H News - Quản lý người dùng</title>
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
                <a href="admin.jsp" class="active">Quản trị</a>
            </nav>
            <div class="header-actions">
                <span class="user-info">Xin chào, Quản trị <%= session.getAttribute("user") != null ? session.getAttribute("user") : "Admin" %></span>
                <a href="logout.jsp" class="logout-btn">Đăng xuất</a>
            </div>
        </div>
    </header>

    <div class="container">
        <section class="center-col" style="margin: 25px auto; max-width: 900px;">
            <h2>Quản lý người dùng</h2>
            <div class="action-bar">
                <a href="#add-user" class="add-news-btn" onclick="showModal('add-user-modal')">Thêm người dùng</a>
            </div>
            <table class="news-table">
                <thead>
                    <tr>
                        <th>Tên</th>
                        <th>Email</th>
                        <th>Vai trò</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Nguyễn Admin</td>
                        <td>admin@24hnews.vn</td>
                        <td>Quản trị</td>
                        <td>
                            <a href="#" class="edit-btn">Sửa</a>
                            <a href="#" class="delete-btn">Xóa</a>
                        </td>
                    </tr>
                     <tr>
                        <td>Trần An</td>
                        <td>tran.an@24hnews.vn</td>
                        <td>Phóng viên</td>
                        <td>
                            <a href="#" class="edit-btn">Sửa</a>
                            <a href="#" class="delete-btn">Xóa</a>
                        </td>
                    </tr>
                    <tr>
                        <td>Lê Minh</td>
                        <td>le.minh@24hnews.vn</td>
                        <td>Phóng viên</td>
                        <td>
                            <a href="#" class="edit-btn">Sửa</a>
                            <a href="#" class="delete-btn">Xóa</a>
                        </td>
                    </tr>
                </tbody>
            </table>
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
    
     <script>
        function showModal(modalId) { /* your JS code */ }
    </script>
</body>
</html>