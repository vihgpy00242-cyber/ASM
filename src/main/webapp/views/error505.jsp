<%-- error-500.jsp --%>
<%@ page contentType="text/html; charset=UTF-8" language="java" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>500 - Lỗi hệ thống - V News</title>
    <link href="https://fonts.googleapis.com/css2?family=Lora:wght@700&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .error-container {
            text-align: center;
            padding: 100px 20px;
            max-width: 600px;
            margin: 0 auto;
        }
        .error-code {
            font-size: 120px;
            font-weight: 700;
            color: var(--danger-color);
            font-family: var(--font-heading);
            line-height: 1;
            margin-bottom: 20px;
        }
        .error-message {
            font-size: 24px;
            color: var(--text-dark);
            margin-bottom: 15px;
        }
        .error-description {
            color: var(--text-muted);
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
    <header class="site-header">
        <div class="container">
            <div class="logo">
                <a href="${pageContext.request.contextPath}/home">V <span>News</span></a>
            </div>
        </div>
    </header>

    <div class="container">
        <div class="error-container">
            <div class="error-code">500</div>
            <h1 class="error-message">Lỗi hệ thống</h1>
            <p class="error-description">
                Xin lỗi, đã có lỗi xảy ra trên máy chủ. Vui lòng thử lại sau.
            </p>
            <a href="${pageContext.request.contextPath}/home" class="btn btn-primary">
                ← Về trang chủ
            </a>
        </div>
    </div>

    <footer class="site-footer">
        <div class="container">
            <p>&copy; 2025 V News. Mọi quyền được bảo lưu.</p>
        </div>
    </footer>
</body>
</html>