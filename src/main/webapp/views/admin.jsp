<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Quản Trị - V News</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Open+Sans:wght@400;600&display=swap">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header class="site-header">
        <div class="container">
            <div class="logo">V <span>News</span></div>
            <nav class="menu">
                <a href="${pageContext.request.contextPath}/home">Xem trang chính</a>
                <a href="admin.jsp" class="active">Quản trị</a>
            </nav>
            <div class="header-actions">
                <span style="margin-right: 15px;">Xin chào, Admin</span>
                <a href="#" class="logout-btn">Đăng xuất</a>
            </div>
        </div>
    </header>

    <main class="container">
        <h1 class="page-title">Bảng điều khiển Quản trị</h1>
        <div class="main-layout">
            <div class="news-list">
                <a href="manage_all_news.jsp" class="btn btn-primary">Quản lý bài viết</a>
                <a href="#" class="btn btn-primary">Quản lý chuyên mục</a>
                <a href="#" class="btn btn-primary">Quản lý người dùng</a>
            </div>
            <aside class="sidebar">
                <div class="box">
                    <h3>Thống kê nhanh</h3>
                    <ul>
                        <li>Tổng số bài viết: 350</li>
                        <li>Lượt xem tháng này: 1.2M</li>
                        <li>Người dùng đăng ký: 5,200</li>
                    </ul>
                </div>
            </aside>
        </div>
    </main>
    
    <footer class="site-footer">
        <p>&copy; 2025 V News. Mọi quyền được bảo lưu.</p>
    </footer>
</body>
</html>