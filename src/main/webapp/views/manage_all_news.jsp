<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Bài viết - V News</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Lora:wght@700&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        .admin-header {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--primary-color-darker) 100%);
            padding: 40px 0;
            color: white;
            margin-bottom: 40px;
        }
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        .stat-card {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: var(--shadow-sm);
            border-left: 4px solid var(--primary-color);
        }
        .stat-value {
            font-size: 32px;
            font-weight: 700;
            color: var(--primary-color);
        }
        .stat-label {
            color: #666;
            margin-top: 5px;
        }
        .actions-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: var(--shadow-sm);
        }
        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            margin-top: 30px;
        }
        .pagination a, .pagination span {
            padding: 8px 15px;
            border: 1px solid #e0e0e0;
            border-radius: 5px;
            text-decoration: none;
            color: var(--text-dark);
            transition: all 0.3s;
        }
        .pagination a:hover {
            background: var(--primary-color);
            color: white;
            border-color: var(--primary-color);
        }
        .pagination .active {
            background: var(--primary-color);
            color: white;
            border-color: var(--primary-color);
        }
        .status-badge {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 600;
        }
        .status-published {
            background: #d4edda;
            color: #155724;
        }
        .status-draft {
            background: #fff3cd;
            color: #856404;
        }
        .status-featured {
            background: #cce5ff;
            color: #004085;
        }
    </style>
</head>
<body>
    <header class="site-header">
        <div class="container">
            <div class="logo">
                <a href="${pageContext.request.contextPath}/home">V <span>News</span></a>
            </div>
            <nav class="menu">
                <a href="${pageContext.request.contextPath}/home">Xem trang chính</a>
                <a href="${pageContext.request.contextPath}/admin/articles" class="active">Quản lý bài viết</a>
                <a href="${pageContext.request.contextPath}/admin.jsp">Tổng quan</a>
            </nav>
            <div class="header-actions">
                <span style="margin-right: 15px;">👤 Admin</span>
            </div>
        </div>
    </header>

    <div class="admin-header">
        <div class="container">
            <h1 style="font-family: var(--font-heading); font-size: 36px; margin: 0;">📰 Quản lý Bài viết</h1>
            <p style="margin-top: 10px; opacity: 0.9;">Quản lý toàn bộ bài viết trên hệ thống</p>
        </div>
    </div>
    
    <main class="container">
        <!-- Statistics -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-value">${articles.size()}</div>
                <div class="stat-label">📄 Bài viết hiện tại</div>
            </div>
            <div class="stat-card">
                <div class="stat-value">
                    <c:set var="publishedCount" value="0"/>
                    <c:forEach var="article" items="${articles}">
                        <c:if test="${article.published}">
                            <c:set var="publishedCount" value="${publishedCount + 1}"/>
                        </c:if>
                    </c:forEach>
                    ${publishedCount}
                </div>
                <div class="stat-label">✅ Đã xuất bản</div>
            </div>
            <div class="stat-card">
                <div class="stat-value">
                    <c:set var="totalViews" value="0"/>
                    <c:forEach var="article" items="${articles}">
                        <c:set var="totalViews" value="${totalViews + article.views}"/>
                    </c:forEach>
                    ${totalViews}
                </div>
                <div class="stat-label">👁️ Tổng lượt xem</div>
            </div>
            <div class="stat-card">
                <div class="stat-value">
                    <c:set var="featuredCount" value="0"/>
                    <c:forEach var="article" items="${articles}">
                        <c:if test="${article.featured}">
                            <c:set var="featuredCount" value="${featuredCount + 1}"/>
                        </c:if>
                    </c:forEach>
                    ${featuredCount}
                </div>
                <div class="stat-label">⭐ Nổi bật</div>
            </div>
        </div>

        <!-- Actions Bar -->
        <div class="actions-bar">
            <div>
                <a href="${pageContext.request.contextPath}/admin/articles?action=create" class="btn btn-primary">
                    ➕ Thêm bài viết mới
                </a>
            </div>
            <div>
                <input type="text" id="searchInput" placeholder="🔍 Tìm kiếm bài viết..." 
                       style="padding: 10px 15px; border: 1px solid #e0e0e0; border-radius: 5px; width: 300px;">
            </div>
        </div>

        <!-- Articles Table -->
        <div style="background: white; border-radius: 8px; overflow: hidden; box-shadow: var(--shadow-sm);">
            <table class="news-table">
                <thead>
                    <tr>
                        <th style="width: 60px;">ID</th>
                        <th>Tiêu đề</th>
                        <th style="width: 120px;">Chuyên mục</th>
                        <th style="width: 120px;">Tác giả</th>
                        <th style="width: 120px;">Ngày đăng</th>
                        <th style="width: 100px;">Lượt xem</th>
                        <th style="width: 120px;">Trạng thái</th>
                        <th style="width: 180px;">Hành động</th>
                    </tr>
                </thead>
                <tbody id="articleTableBody">
                    <c:choose>
                        <c:when test="${not empty articles && articles.size() > 0}">
                            <c:forEach var="article" items="${articles}">
                                <tr>
                                    <td><strong>#${article.id}</strong></td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/article?id=${article.id}" 
                                           target="_blank" style="text-decoration: none; color: var(--text-dark); font-weight: 600;">
                                            ${article.title}
                                        </a>
                                        <c:if test="${article.featured}">
                                            <span class="status-badge status-featured" style="margin-left: 8px;">⭐ Nổi bật</span>
                                        </c:if>
                                    </td>
                                    <td>
                                        <span style="display: inline-block; padding: 4px 10px; background: #f0f0f0; border-radius: 5px; font-size: 12px;">
                                            ${article.category}
                                        </span>
                                    </td>
                                    <td>${article.author}</td>
                                    <td>${article.formattedDate}</td>
                                    <td style="text-align: center;">
                                        <strong style="color: var(--primary-color);">${article.views}</strong>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${article.published}">
                                                <span class="status-badge status-published">✅ Đã xuất bản</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="status-badge status-draft">📝 Nháp</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/admin/articles?action=edit&id=${article.id}" 
                                           class="btn edit-btn" style="padding: 6px 12px; font-size: 13px; margin-right: 5px;">
                                            ✏️ Sửa
                                        </a>
                                        <a href="${pageContext.request.contextPath}/admin/articles?action=delete&id=${article.id}" 
                                           class="btn delete-btn" style="padding: 6px 12px; font-size: 13px;"
                                           onclick="return confirm('⚠️ Bạn có chắc muốn xóa bài viết \"${article.title}\"?')">
                                            🗑️ Xóa
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="8" style="text-align: center; padding: 60px; color: #999;">
                                    <div style="font-size: 48px; margin-bottom: 15px;">📭</div>
                                    <p style="font-size: 18px;">Chưa có bài viết nào</p>
                                    <a href="${pageContext.request.contextPath}/admin/articles?action=create" 
                                       class="btn btn-primary" style="margin-top: 15px;">
                                        Tạo bài viết đầu tiên
                                    </a>
                                </td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>

        <!-- Pagination -->
        <c:if test="${totalPages > 1}">
            <div class="pagination">
                <c:if test="${currentPage > 1}">
                    <a href="?page=${currentPage - 1}">← Trước</a>
                </c:if>
                
                <c:forEach begin="1" end="${totalPages}" var="i">
                    <c:choose>
                        <c:when test="${currentPage == i}">
                            <span class="active">${i}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="?page=${i}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                
                <c:if test="${currentPage < totalPages}">
                    <a href="?page=${currentPage + 1}">Sau →</a>
                </c:if>
            </div>
        </c:if>
    </main>
    
    <footer class="site-footer" style="margin-top: 60px;">
        <div class="container">
            <p>&copy; 2025 V News. Mọi quyền được bảo lưu.</p>
        </div>
    </footer>

    <script>
        // Live search functionality
        document.getElementById('searchInput').addEventListener('input', function(e) {
            const searchTerm = e.target.value.toLowerCase();
            const rows = document.querySelectorAll('#articleTableBody tr');
            
            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                if (text.includes(searchTerm)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });
    </script>
</body>
</html>