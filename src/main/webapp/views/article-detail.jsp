<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${article.title} - V News</title>
    <meta name="description" content="${article.summary}">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lora:wght@700&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <header class="site-header">
        <div class="container">
            <div class="logo">
                <a href="${pageContext.request.contextPath}/home">V <span>News</span></a>
            </div>
            <nav class="menu">
                <a href="${pageContext.request.contextPath}/home">Trang chủ</a>
                <a href="${pageContext.request.contextPath}/category?name=Công nghệ">Công nghệ</a>
                <a href="${pageContext.request.contextPath}/category?name=Khoa học">Khoa học</a>
                <a href="${pageContext.request.contextPath}/category?name=Kinh tế">Kinh tế</a>
            </nav>
        </div>
    </header>

    <div class="container" style="max-width: 1000px;">
        <article style="background: white; padding: 40px; border-radius: 8px; margin: 40px 0; box-shadow: var(--shadow-sm);">
            <header class="article-header">
                <div class="category" style="color: var(--primary-color); font-weight: 700; text-transform: uppercase; margin-bottom: 15px;">
                    <a href="${pageContext.request.contextPath}/category?name=${article.category}" style="text-decoration: none; color: inherit;">
                        ${article.category}
                    </a>
                </div>
                <h1 class="page-title" style="margin-bottom: 20px; font-size: 42px; line-height: 1.3;">${article.title}</h1>
                
                <div class="article-meta" style="color: #666; font-size: 14px; margin-bottom: 20px; padding-bottom: 20px; border-bottom: 1px solid #e0e0e0;">
                    <span><strong>Tác giả:</strong> ${article.author}</span> • 
                    <span><strong>Ngày đăng:</strong> ${article.formattedDate}</span> • 
                    <span><strong>Lượt xem:</strong> ${article.views}</span>
                </div>
                
                <div class="article-summary" style="font-size: 20px; color: var(--text-muted); font-weight: 500; line-height: 1.6; margin-bottom: 30px; padding: 20px; background: #f8f8f8; border-left: 4px solid var(--primary-color); border-radius: 5px;">
                    ${article.summary}
                </div>
            </header>
            
            <img src="${article.imageUrl}" alt="${article.title}" class="article-image" style="width: 100%; border-radius: 8px; margin-bottom: 30px;">
            
            <div class="article-content" style="font-size: 18px; line-height: 1.8; color: var(--text-dark);">
                <p>${article.content}</p>
                
                <!-- Additional content paragraphs -->
                <p style="margin-top: 20px;">Theo các chuyên gia trong lĩnh vực, đây là một bước tiến quan trọng và có ý nghĩa lớn đối với sự phát triển trong tương lai. Nhiều ứng dụng thực tế đã được đề xuất và đang trong giai đoạn thử nghiệm.</p>
                
                <h3 style="font-family: var(--font-heading); margin-top: 30px; margin-bottom: 15px; font-size: 24px;">Tác động và ý nghĩa</h3>
                <p>Sự phát triển này không chỉ ảnh hưởng đến ngành công nghiệp liên quan mà còn tác động đến nhiều khía cạnh khác của xã hội. Các nhà nghiên cứu tiếp tục theo dõi và đánh giá tác động dài hạn.</p>
                
                <h3 style="font-family: var(--font-heading); margin-top: 30px; margin-bottom: 15px; font-size: 24px;">Triển vọng tương lai</h3>
                <p>Với những tiến bộ đạt được, tương lai hứa hẹn nhiều cơ hội và thách thức mới. Cộng đồng chuyên gia đang tích cực nghiên cứu và phát triển để mở rộng ứng dụng và tối ưu hóa hiệu quả.</p>
            </div>
            
            <!-- Tags -->
            <c:if test="${not empty article.tags && article.tags.size() > 0}">
                <div class="tags" style="margin-top: 40px; padding-top: 20px; border-top: 1px solid #e0e0e0;">
                    <strong style="margin-right: 10px;">Tags:</strong>
                    <c:forEach var="tag" items="${article.tags}">
                        <a href="${pageContext.request.contextPath}/search?tag=${tag}" 
                           style="display: inline-block; background: #f0f0f0; padding: 6px 12px; margin-right: 8px; border-radius: 5px; font-size: 14px; text-decoration: none; color: #666; transition: all 0.3s;">
                            #${tag}
                        </a>
                    </c:forEach>
                </div>
            </c:if>
            
            <!-- Social Share -->
            <div class="social-share" style="margin-top: 30px; padding: 20px; background: #f8f8f8; border-radius: 8px; text-align: center;">
                <p style="margin-bottom: 15px; font-weight: 600;">Chia sẻ bài viết này:</p>
                <button class="btn" style="margin: 0 5px; background: #3b5998; color: white;">Facebook</button>
                <button class="btn" style="margin: 0 5px; background: #1da1f2; color: white;">Twitter</button>
                <button class="btn" style="margin: 0 5px; background: #0077b5; color: white;">LinkedIn</button>
                <button class="btn" style="margin: 0 5px; background: #25d366; color: white;">WhatsApp</button>
            </div>
        </article>

        <!-- Related Articles -->
        <c:if test="${not empty relatedArticles && relatedArticles.size() > 0}">
            <section style="margin: 40px 0;">
                <h2 class="page-title" style="font-size: 28px; margin-bottom: 30px;">Bài viết liên quan</h2>
                <div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 20px;">
                    <c:forEach var="related" items="${relatedArticles}">
                        <article class="news-item" style="margin-bottom: 0;">
                            <div class="image-container">
                                <img src="${related.imageUrl}" alt="${related.title}" style="height: 180px;">
                            </div>
                            <div class="news-content">
                                <div class="category" style="color: var(--primary-color); font-weight: 700; font-size: 12px; text-transform: uppercase; margin-bottom: 8px;">
                                    ${related.category}
                                </div>
                                <h3 style="font-size: 18px;"><a href="${pageContext.request.contextPath}/article?id=${related.id}">${related.title}</a></h3>
                                <span class="news-meta">${related.formattedDate}</span>
                            </div>
                        </article>
                    </c:forEach>
                </div>
            </section>
        </c:if>

        <!-- Comment Section -->
        <section style="background: white; padding: 40px; border-radius: 8px; margin: 40px 0; box-shadow: var(--shadow-sm);">
            <h2 class="page-title" style="font-size: 28px; margin-bottom: 30px;">Bình luận (${article.commentCount})</h2>
            
            <!-- Comment Form -->
            <form class="comment-form" style="margin-bottom: 40px; padding: 20px; background: #f8f8f8; border-radius: 8px;">
                <div class="form-group">
                    <label for="name">Tên của bạn</label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="comment">Nội dung bình luận</label>
                    <textarea id="comment" name="comment" rows="4" placeholder="Nhập bình luận của bạn..." required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Gửi bình luận</button>
            </form>
            
            <!-- Comments List -->
            <div class="comments-list">
                <c:choose>
                    <c:when test="${not empty article.comments && article.comments.size() > 0}">
                        <c:forEach var="comment" items="${article.comments}">
                            <div style="padding: 20px; border-bottom: 1px solid #e0e0e0; margin-bottom: 20px;">
                                <div style="display: flex; align-items: center; margin-bottom: 10px;">
                                    <div style="width: 40px; height: 40px; background: var(--primary-color); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white; font-weight: 700; margin-right: 15px;">
                                        ${comment.userName.substring(0,1).toUpperCase()}
                                    </div>
                                    <div>
                                        <strong style="display: block;">${comment.userName}</strong>
                                        <span style="font-size: 12px; color: #999;">${comment.formattedDate}</span>
                                    </div>
                                </div>
                                <p style="color: var(--text-dark); line-height: 1.6; margin-left: 55px;">${comment.content}</p>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p style="text-align: center; color: #999; padding: 40px;">Chưa có bình luận nào. Hãy là người đầu tiên bình luận!</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </section>
    </div>

    <footer class="site-footer">
        <div class="container">
            <p>&copy; 2025 V News. Mọi quyền được bảo lưu.</p>
        </div>
    </footer>
</body>
</html>