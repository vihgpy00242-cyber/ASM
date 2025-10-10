<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>V News - Tin tức Nóng hổi, Cập nhật 24/7</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Open+Sans:wght@400;600&display=swap">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header class="site-header">
        <div class="container">
            <div class="logo">V <span>News</span></div>
            <nav class="menu">
                <a href="index.jsp" class="active">Trang chủ</a>
                <a href="#">Thời sự</a>
                <a href="#">Công nghệ</a>
                <a href="#">Kinh tế</a>
                <a href="#">Giải trí</a>
            </nav>
            <div class="header-actions">
                <button class="login-btn" onclick="showModal('login-modal')">Đăng nhập</button>
            </div>
        </div>
    </header>

    <div class="container">
        <h1 class="page-title">Tin Mới Nhất</h1>
        <div class="main-layout">
            <main class="news-list">
                <article class="news-item">
                    <img src="https://images.unsplash.com/photo-1677442135703-1787eea5ce01?q=80&w=800" alt="AI">
                    <div class="news-content">
                        <h3><a href="#">Trí tuệ nhân tạo thế hệ mới có khả năng tự học đáng kinh ngạc</a></h3>
                        <p>Một mô hình AI mới vừa được công bố có thể học các tác vụ phức tạp chỉ từ vài ví dụ, mở ra tiềm năng ứng dụng khổng lồ trong tương lai.</p>
                        <span class="news-meta">Đăng ngày: 10/10/2025 - Chuyên mục: Công nghệ</span>
                    </div>
                </article>
                <article class="news-item">
                    <img src="https://images.unsplash.com/photo-1614728263952-84ea256ec676?q=80&w=800" alt="Space">
                    <div class="news-content">
                        <h3><a href="#">NASA xác nhận tìm thấy dấu hiệu của nước lỏng trên Sao Hỏa</a></h3>
                        <p>Dữ liệu từ tàu thám hiểm Perseverance cho thấy bằng chứng rõ ràng về sự tồn tại của các dòng nước mặn chảy theo mùa trên bề mặt Hành tinh Đỏ.</p>
                        <span class="news-meta">Đăng ngày: 09/10/2025 - Chuyên mục: Khoa học</span>
                    </div>
                </article>
                 <article class="news-item">
                    <img src="https://images.unsplash.com/photo-1633435469036-a3d83f06af52?q=80&w=800" alt="Economy">
                    <div class="news-content">
                        <h3><a href="#">Kinh tế xanh: Xu hướng tất yếu cho sự phát triển bền vững</a></h3>
                        <p>Các quốc gia trên thế giới đang đẩy mạnh đầu tư vào năng lượng tái tạo và công nghệ sạch, tạo ra một cuộc cách mạng kinh tế mới.</p>
                        <span class="news-meta">Đăng ngày: 08/10/2025 - Chuyên mục: Kinh tế</span>
                    </div>
                </article>
            </main>
            <aside class="sidebar">
                <div class="box">
                    <h3>Đọc nhiều</h3>
                    <ul>
                        <li><a href="#">AI tự học có thay thế con người?</a></li>
                        <li><a href="#">Cuộc sống trên Sao Hỏa: Viễn cảnh và thách thức.</a></li>
                        <li><a href="#">Cổ phiếu công nghệ xanh tăng vọt.</a></li>
                    </ul>
                </div>
                 <div class="box">
                    <h3>Chuyên mục</h3>
                    <ul>
                        <li><a href="#">Thời sự</a></li>
                        <li><a href="#">Công nghệ</a></li>
                        <li><a href="#">Kinh tế</a></li>
                        <li><a href="#">Khoa học</a></li>
                        <li><a href="#">Giải trí</a></li>
                    </ul>
                </div>
            </aside>
        </div>
    </div>

    <div id="login-modal" class="modal">
        <div class="modal-content">
            <span class="close-btn" onclick="closeModal('login-modal')">&times;</span>
            <h2>Đăng nhập</h2>
            <form action="login" method="post">
                <div class="form-group"><label for="login-email">Email</label><input type="email" id="login-email" required></div>
                <div class="form-group"><label for="login-password">Mật khẩu</label><input type="password" id="login-password" required></div>
                <button type="submit" class="submit-btn" style="width:100%; justify-content:center;">Đăng nhập</button>
            </form>
        </div>
    </div>
    
    <footer class="site-footer">
        <div class="container">
            <p>&copy; 2025 V News. Mọi quyền được bảo lưu.</p>
            <div class="social-links"><a href="#">Facebook</a> | <a href="#">Twitter</a></div>
        </div>
    </footer>
    <script>
        function showModal(id) { document.getElementById(id).style.display = 'flex'; }
        function closeModal(id) { document.getElementById(id).style.display = 'none'; }
    </script>
</body>
</html>