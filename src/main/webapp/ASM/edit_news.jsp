<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm/Sửa Bài viết - V News</title>
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
        <h1 class="page-title"><%= request.getParameter("id") != null ? "Chỉnh sửa bài viết" : "Tạo bài viết mới" %></h1>
        <form action="#" method="post" style="max-width: 800px; margin: 0 auto;">
            <div class="form-group">
                <label for="title">Tiêu đề</label>
                <input type="text" id="title" name="title" required>
            </div>
             <div class="form-group">
                <label for="category">Chuyên mục</label>
                <select id="category" name="category">
                    <option value="cong-nghe">Công nghệ</option>
                    <option value="khoa-hoc">Khoa học</option>
                    <option value="kinh-te">Kinh tế</option>
                </select>
            </div>
             <div class="form-group">
                <label for="image">URL Hình ảnh</label>
                <input type="text" id="image" name="image">
            </div>
             <div class="form-group">
                <label for="content">Nội dung</label>
                <textarea id="content" name="content" rows="15"></textarea>
            </div>
            <button type="submit" class="submit-btn">Lưu bài viết</button>
        </form>
    </main>

    <footer class="site-footer">
        <p>&copy; 2025 V News. Mọi quyền được bảo lưu.</p>
    </footer>
</body>
</html>