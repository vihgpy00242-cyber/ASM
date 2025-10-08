<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="24H News - Trang tin tức hàng đầu Việt Nam, cập nhật tin tức nhanh chóng, chính xác và đa chiều.">
    <meta name="keywords" content="tin tức, Việt Nam, văn hóa, pháp luật, thể thao, 24H News">
    <meta name="author" content="24H News">
    <title>24H News - Trang chủ</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Open+Sans:wght@400;600&display=swap">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header class="site-header">
        <div class="container">
            <div class="logo">24H <span>News</span></div>
            <nav class="menu">
                <a href="index.jsp" class="active">Trang chủ</a>
                <a href="#">Văn hóa</a>
                <a href="#">Pháp luật</a>
                <a href="#">Thể thao</a>
            </nav>
            <div class="header-actions">
                <input type="text" placeholder="Tìm kiếm..." class="search-bar">
                <button class="login-btn" onclick="showModal('login-modal')">Đăng nhập</button>
                <button class="register-btn" onclick="showModal('register-modal')">Đăng ký</button>
            </div>
        </div>
    </header>

    <div id="login-modal" class="modal">
        <div class="modal-content">
            <span class="close-btn" onclick="closeModal('login-modal')">&times;</span>
            <h2>Đăng nhập</h2>
            <form action="login" method="post">
                <div class="form-group">
                    <label for="login-email">Email</label>
                    <input type="email" id="login-email" name="email" placeholder="Nhập email" required>
                </div>
                <div class="form-group">
                    <label for="login-password">Mật khẩu</label>
                    <input type="password" id="login-password" name="password" placeholder="Nhập mật khẩu" required>
                </div>
                <button type="submit" class="submit-btn">Đăng nhập</button>
            </form>
            <p class="modal-link">Chưa có tài khoản? <a onclick="switchModal('login-modal', 'register-modal')">Đăng ký ngay</a></p>
        </div>
    </div>

    <div id="register-modal" class="modal">
        <div class="modal-content">
            <span class="close-btn" onclick="closeModal('register-modal')">&times;</span>
            <h2>Đăng ký tài khoản</h2>
            <form action="register" method="post">
                 <div class="form-group">
                    <label for="fullName">Họ và tên</label>
                    <input type="text" id="fullName" name="fullName" placeholder="Nhập họ và tên" required>
                </div>
                <div class="form-group">
                    <label for="register-email">Email</label>
                    <input type="email" id="register-email" name="email" placeholder="Nhập email" required>
                </div>
                <div class="form-group">
                    <label for="register-password">Mật khẩu</label>
                    <input type="password" id="register-password" name="password" placeholder="Nhập mật khẩu" required>
                </div>
                <button type="submit" class="submit-btn">Đăng ký</button>
            </form>
            <p class="modal-link">Đã có tài khoản? <a onclick="switchModal('register-modal', 'login-modal')">Đăng nhập ngay</a></p>
        </div>
    </div>

    <div class="container">
        <div class="container-3col">
            <section class="left-col">
                <article class="news-item">
                    <img src="https://picsum.photos/id/1018/300/200" alt="Du lịch Quy Nhơn">
                    <div class="news-content">
                        <h3><a href="#">Khám phá vẻ đẹp tiềm ẩn của Quy Nhơn - Bình Định</a></h3>
                        <p>Thành phố biển miền Trung này đang trở thành điểm đến hấp dẫn với bãi biển hoang sơ...</p>
                        <span class="news-meta">Đăng ngày: 08/10/2025</span>
                    </div>
                </article>
                <article class="news-item">
                    <img src="https://picsum.photos/id/1078/300/200" alt="Giáo dục số">
                    <div class="news-content">
                        <h3><a href="#">Chuyển đổi số trong giáo dục: Thách thức và cơ hội</a></h3>
                        <p>Các trường học đang đẩy mạnh ứng dụng công nghệ để nâng cao chất lượng giảng dạy...</p>
                        <span class="news-meta">Đăng ngày: 07/10/2025</span>
                    </div>
                </article>
            </section>

            <section class="center-col">
                <h2>Bản tin mới nhất</h2>
                <article class="featured">
                    <img src="https://picsum.photos/id/21/500/300" alt="Thị trường chứng khoán">
                    <div class="featured-content">
                        <h3><a href="#">Thị trường chứng khoán Việt Nam khởi sắc cuối năm</a></h3>
                        <p>Chỉ số VN-Index ghi nhận mức tăng trưởng ấn tượng trong quý 4, thu hút dòng vốn đầu tư nước ngoài mạnh mẽ...</p>
                        <span class="news-meta">Đăng ngày: 08/10/2025</span>
                    </div>
                </article>
                 <article class="news-item">
                    <img src="https://picsum.photos/id/431/400/250" alt="Xe điện VinFast">
                    <div class="news-content">
                        <h3><a href="#">VinFast ra mắt mẫu xe điện thông minh mới</a></h3>
                        <p>Mẫu xe mới được trang bị nhiều tính năng tự lái và công nghệ pin tiên tiến, hứa hẹn tạo nên cơn sốt...</p>
                        <span class="news-meta">Đăng ngày: 06/10/2025</span>
                    </div>
                </article>
            </section>

            <aside class="right-col">
                 <div class="box">
                    <h3>Tin được xem nhiều</h3>
                    <ul>
                        <li><span class="number">1</span><a href="#">Thị trường chứng khoán Việt Nam khởi sắc</a></li>
                        <li><span class="number">2</span><a href="#">Khám phá vẻ đẹp tiềm ẩn của Quy Nhơn</a></li>
                        <li><span class="number">3</span><a href="#">VinFast ra mắt mẫu xe điện thông minh</a></li>
                        <li><span class="number">4</span><a href="#">Cập nhật chính sách visa mới cho du khách</a></li>
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

    <script>
        function showModal(modalId) {
            document.getElementById(modalId).style.display = 'flex';
        }
        function closeModal(modalId) {
            document.getElementById(modalId).style.display = 'none';
        }
        function switchModal(currentModalId, targetModalId) {
            closeModal(currentModalId);
            showModal(targetModalId);
        }
    </script>
</body>
</html>