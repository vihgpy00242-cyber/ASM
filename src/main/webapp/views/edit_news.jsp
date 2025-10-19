<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${not empty article.id ? 'Chỉnh sửa' : 'Tạo mới'} Bài viết - V News</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Lora:wght@700&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        .form-container {
            max-width: 900px;
            margin: 0 auto;
            background: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: var(--shadow-md);
        }
        .form-header {
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid var(--primary-color);
        }
        .form-section {
            margin-bottom: 30px;
        }
        .form-section h3 {
            font-family: var(--font-heading);
            color: var(--primary-color);
            margin-bottom: 15px;
            font-size: 20px;
        }
        .checkbox-group {
            display: flex;
            align-items: center;
            gap: 20px;
            margin-top: 10px;
        }
        .checkbox-group label {
            display: flex;
            align-items: center;
            gap: 8px;
            font-weight: normal;
            cursor: pointer;
        }
        .checkbox-group input[type="checkbox"] {
            width: auto;
            cursor: pointer;
        }
        .image-preview {
            margin-top: 15px;
            max-width: 100%;
            border-radius: 8px;
            display: none;
        }
        .char-counter {
            font-size: 12px;
            color: #999;
            text-align: right;
            margin-top: 5px;
        }
        .btn-group {
            display: flex;
            gap: 15px;
            margin-top: 30px;
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
                <a href="${pageContext.request.contextPath}/home">Trang chủ</a>
                <a href="${pageContext.request.contextPath}/admin/articles">Quản lý bài viết</a>
            </nav>
        </div>
    </header>
    
    <main class="container" style="padding: 40px 0;">
        <div class="form-container">
            <div class="form-header">
                <h1 style="font-family: var(--font-heading); font-size: 32px; margin: 0;">
                    ${not empty article.id ? 'Chỉnh sửa bài viết' : 'Tạo bài viết mới'}
                </h1>
                <p style="color: #666; margin-top: 10px;">
                    ${not empty article.id ? 'Cập nhật thông tin bài viết' : 'Điền đầy đủ thông tin để tạo bài viết mới'}
                </p>
            </div>

            <form action="${pageContext.request.contextPath}/admin/articles" method="post" id="articleForm">
                <input type="hidden" name="id" value="${article.id}">
                
                <!-- Basic Information -->
                <div class="form-section">
                    <h3>📝 Thông tin cơ bản</h3>
                    
                    <div class="form-group">
                        <label for="title">Tiêu đề bài viết *</label>
                        <input type="text" id="title" name="title" value="${article.title}" 
                               placeholder="Nhập tiêu đề hấp dẫn cho bài viết" required maxlength="200">
                        <div class="char-counter">
                            <span id="titleCounter">0</span>/200 ký tự
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="summary">Tóm tắt *</label>
                        <textarea id="summary" name="summary" rows="3" 
                                  placeholder="Mô tả ngắn gọn nội dung bài viết (150-300 ký tự)" required>${article.summary}</textarea>
                        <div class="char-counter">
                            <span id="summaryCounter">0</span>/300 ký tự
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="author">Tác giả</label>
                        <input type="text" id="author" name="author" value="${not empty article.author ? article.author : 'Admin'}" 
                               placeholder="Tên tác giả">
                    </div>
                </div>

                <!-- Category and Tags -->
                <div class="form-section">
                    <h3>🏷️ Phân loại</h3>
                    
                    <div class="form-group">
                        <label for="category">Chuyên mục *</label>
                        <select id="category" name="category" required>
                            <option value="">-- Chọn chuyên mục --</option>
                            <option value="Công nghệ" ${article.category == 'Công nghệ' ? 'selected' : ''}>📱 Công nghệ</option>
                            <option value="Khoa học" ${article.category == 'Khoa học' ? 'selected' : ''}>🔬 Khoa học</option>
                            <option value="Kinh tế" ${article.category == 'Kinh tế' ? 'selected' : ''}>💼 Kinh tế</option>
                            <option value="Thời sự" ${article.category == 'Thời sự' ? 'selected' : ''}>📰 Thời sự</option>
                            <option value="Giải trí" ${article.category == 'Giải trí' ? 'selected' : ''}>🎬 Giải trí</option>
                            <option value="Thể thao" ${article.category == 'Thể thao' ? 'selected' : ''}>⚽ Thể thao</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="tags">Tags (phân cách bằng dấu phẩy)</label>
                        <input type="text" id="tags" name="tags" value="${article.tagsAsString}" 
                               placeholder="Ví dụ: AI, Machine Learning, Công nghệ">
                        <small style="color: #666; font-size: 13px;">Tags giúp người đọc tìm kiếm bài viết dễ dàng hơn</small>
                    </div>
                </div>

                <!-- Media -->
                <div class="form-section">
                    <h3>🖼️ Hình ảnh</h3>
                    
                    <div class="form-group">
                        <label for="imageUrl">URL Hình ảnh đại diện</label>
                        <input type="url" id="imageUrl" name="imageUrl" value="${article.imageUrl}" 
                               placeholder="https://example.com/image.jpg" onchange="previewImage()">
                        <small style="color: #666; font-size: 13px;">Nhập URL hình ảnh hoặc sử dụng dịch vụ lưu trữ như Unsplash, Imgur</small>
                        <img id="imagePreview" class="image-preview" alt="Preview">
                    </div>
                </div>

                <!-- Content -->
                <div class="form-section">
                    <h3>📄 Nội dung</h3>
                    
                    <div class="form-group">
                        <label for="content">Nội dung bài viết *</label>
                        <textarea id="content" name="content" rows="15" 
                                  placeholder="Nhập nội dung chi tiết của bài viết..." required>${article.content}</textarea>
                        <div class="char-counter">
                            <span id="contentCounter">0</span> ký tự
                        </div>
                    </div>
                </div>

                <!-- Publishing Options -->
                <div class="form-section">
                    <h3>⚙️ Tùy chọn xuất bản</h3>
                    
                    <div class="checkbox-group">
                        <label>
                            <input type="checkbox" name="featured" ${article.featured ? 'checked' : ''}>
                            <span>⭐ Bài viết nổi bật (hiển thị ở trang chủ)</span>
                        </label>
                        
                        <label>
                            <input type="checkbox" name="published" ${article.published || empty article.id ? 'checked' : ''}>
                            <span>✅ Xuất bản ngay</span>
                        </label>
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="btn-group">
                    <button type="submit" class="btn btn-primary" style="padding: 12px 30px;">
                        💾 ${not empty article.id ? 'Cập nhật' : 'Tạo'} bài viết
                    </button>
                    <a href="${pageContext.request.contextPath}/admin/articles" class="btn" 
                       style="padding: 12px 30px; background: #6c757d; color: white; text-decoration: none;">
                        ❌ Hủy
                    </a>
                </div>
            </form>
        </div>
    </main>
    
    <footer class="site-footer">
        <div class="container">
            <p>&copy; 2025 V News. Mọi quyền được bảo lưu.</p>
        </div>
    </footer>

    <script>
        // Character counter
        function updateCounter(elementId, counterId, maxLength) {
            const element = document.getElementById(elementId);
            const counter = document.getElementById(counterId);
            const count = element.value.length;
            counter.textContent = count;
            if (maxLength && count > maxLength) {
                counter.style.color = 'red';
            } else {
                counter.style.color = '#999';
            }
        }

        document.getElementById('title').addEventListener('input', function() {
            updateCounter('title', 'titleCounter', 200);
        });

        document.getElementById('summary').addEventListener('input', function() {
            updateCounter('summary', 'summaryCounter', 300);
        });

        document.getElementById('content').addEventListener('input', function() {
            updateCounter('content', 'contentCounter');
        });

        // Image preview
        function previewImage() {
            const url = document.getElementById('imageUrl').value;
            const preview = document.getElementById('imagePreview');
            if (url) {
                preview.src = url;
                preview.style.display = 'block';
                preview.onerror = function() {
                    preview.style.display = 'none';
                    alert('Không thể tải hình ảnh. Vui lòng kiểm tra URL.');
                };
            } else {
                preview.style.display = 'none';
            }
        }

        // Initialize counters
        window.addEventListener('load', function() {
            updateCounter('title', 'titleCounter', 200);
            updateCounter('summary', 'summaryCounter', 300);
            updateCounter('content', 'contentCounter');
            if (document.getElementById('imageUrl').value) {
                previewImage();
            }
        });

        // Form validation
        document.getElementById('articleForm').addEventListener('submit', function(e) {
            const summary = document.getElementById('summary').value;
            if (summary.length < 50) {
                e.preventDefault();
                alert('Tóm tắt phải có ít nhất 50 ký tự');
                return false;
            }
            return true;
        });
    </script>
</body>
</html>