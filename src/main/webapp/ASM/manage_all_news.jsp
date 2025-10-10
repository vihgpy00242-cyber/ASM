<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Bài viết - V News</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Open+Sans:wght@400;600&display=swap">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header class="site-header">
        <div class="container">
            <div class="logo">V <span>News</span></div>
            <nav class="menu">
                <a href="index.jsp">Xem trang chính</a>
                <a href="admin.jsp" class="active">Quản trị</a>
            </nav>
            <div class="header-actions">
                <a href="#" class="logout-btn">Đăng xuất</a>
            </div>
        </div>
    </header>

    <main class="container">
        <h1 class="page-title">Quản lý tất cả bài viết</h1>
        <a href="edit_news.jsp" class="btn btn-primary" style="margin-bottom: 20px;">Thêm bài viết mới</a>
        <table class="news-table">
            <thead>
                <tr>
                    <th>Tiêu đề</th>
                    <th>Chuyên mục</th>
                    <th>Ngày đăng</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Trí tuệ nhân tạo thế hệ mới có khả năng tự học...</td>
                    <td>Công nghệ</td>
                    <td>10/10/2025</td>
                    <td>
                        <a href="edit_news.jsp?id=1" class="edit-btn">Sửa</a>
                        <a href="#" class="delete-btn">Xóa</a>
                    </td>
                </tr>
                 <tr>
                    <td>NASA xác nhận tìm thấy dấu hiệu của nước lỏng...</td>
                    <td>Khoa học</td>
                    <td>09/10/2025</td>
                    <td>
                        <a href="edit_news.jsp?id=2" class="edit-btn">Sửa</a>
                        <a href="#" class="delete-btn">Xóa</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </main>

    <footer class="site-footer">
        <p>&copy; 2025 V News. Mọi quyền được bảo lưu.</p>
    </footer>
</body>
</html>