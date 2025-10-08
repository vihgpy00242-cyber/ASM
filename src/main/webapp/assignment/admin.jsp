<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="24H News - Trang quản trị hệ thống.">
    <meta name="keywords" content="quản trị, người dùng, loại tin, tin tức, 24H News">
    <meta name="author" content="24H News">
    <title>24H News - Trang Quản Trị</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Open+Sans:wght@400;600&display=swap">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
        <div class="container-3col">
            <section class="left-col">
                <h3>Tin tức gần đây</h3>
                <article class="news-item">
                    <img src="https://picsum.photos/id/21/300/200" alt="Kinh tế">
                    <div class="news-content">
                        <h4><a href="#">Thị trường chứng khoán Việt Nam khởi sắc</a></h4>
                        <p>Chỉ số VN-Index ghi nhận mức tăng trưởng ấn tượng...</p>
                        <span class="news-meta">Đăng ngày: 08/10/2025</span>
                    </div>
                </article>
                <article class="news-item">
                    <img src="https://picsum.photos/id/1018/300/200" alt="Du lịch">
                    <div class="news-content">
                        <h4><a href="#">Khám phá vẻ đẹp tiềm ẩn của Quy Nhơn</a></h4>
                        <p>Thành phố biển miền Trung đang trở thành điểm đến hấp dẫn...</p>
                        <span class="news-meta">Đăng ngày: 08/10/2025</span>
                    </div>
                </article>
            </section>

            <section class="center-col">
                <div class="admin-banner">
                     <img src="https://picsum.photos/id/10/800/200" alt="Admin Banner">
                     <h2>Trung tâm quản trị 24H News</h2>
                </div>
                <div class="admin-stats">
                    <div class="stat-box">
                        <i class="fas fa-newspaper"></i>
                        <h4>218</h4>
                        <p>Bài viết</p>
                    </div>
                    <div class="stat-box">
                        <i class="fas fa-users"></i>
                        <h4>45</h4>
                        <p>Người dùng</p>
                    </div>
                    <div class="stat-box">
                        <i class="fas fa-eye"></i>
                        <h4>52,800</h4>
                        <p>Lượt xem</p>
                    </div>
                </div>
                <h2>Quản trị hệ thống</h2>
                <div class="admin-actions">
                    <a href="manage_users.jsp" class="admin-btn"><i class="fas fa-user-cog"></i> Quản lý người dùng</a>
                    <a href="manage_categories.jsp" class="admin-btn"><i class="fas fa-tags"></i> Quản lý loại tin</a>
                    <a href="manage_all_news.jsp" class="admin-btn"><i class="fas fa-newspaper"></i> Quản lý tất cả tin tức</a>
                </div>
            </section>

            <aside class="right-col">
                <div class="box">
                    <h3>Hoạt động gần đây</h3>
                    <ul>
                        <li><span class="number">1</span><a href="#">Admin vừa thêm loại tin "Du Lịch"</a></li>
                        <li><span class="number">2</span><a href="#">Phóng viên 'Trần An' đăng bài mới.</a></li>
                        <li><span class="number">3</span><a href="#">User 'minh_le' vừa đăng ký tài khoản.</a></li>
                    </ul>
                </div>
            </aside>
        </div>
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