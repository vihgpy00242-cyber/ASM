package com.vnew.dao;

import com.vnew.model.Article;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

public class ArticleDAO {
    private static final List<Article> articles = new ArrayList<>();
    private static int nextId = 1;

    static {
        // Khởi tạo dữ liệu mẫu
        Article a1 = new Article(nextId++, 
            "Trí tuệ nhân tạo thế hệ mới có khả năng tự học đáng kinh ngạc", 
            "Một mô hình AI mới vừa được công bố có thể học các tác vụ phức tạp chỉ từ vài ví dụ",
            "Các nhà nghiên cứu từ OpenAI đã công bố một mô hình AI mới có khả năng tự học và thích nghi với các tác vụ phức tạp chỉ từ một vài ví dụ. Công nghệ này được gọi là 'few-shot learning' và có tiềm năng cách mạng hóa cách chúng ta tương tác với máy móc. Theo các chuyên gia, đây là bước đột phá quan trọng trong việc tạo ra AI tổng quát có thể áp dụng trong nhiều lĩnh vực khác nhau.", 
            "https://images.unsplash.com/photo-1677442135703-1787eea5ce01?q=80&w=800", 
            "Công nghệ", LocalDate.of(2025, 10, 10), "Nguyễn Văn A");
        a1.setFeatured(true);
        a1.setViews(1520);
        a1.setTags(Arrays.asList("AI", "Machine Learning", "Công nghệ"));
        articles.add(a1);
        
        Article a2 = new Article(nextId++, 
            "NASA xác nhận tìm thấy dấu hiệu của nước lỏng trên Sao Hỏa", 
            "Dữ liệu từ tàu thám hiểm Perseverance cho thấy bằng chứng rõ ràng về sự tồn tại của nước",
            "Cơ quan Hàng không Vũ trụ Mỹ (NASA) đã công bố phát hiện quan trọng về dấu hiệu của nước lỏng trên Sao Hỏa. Tàu thám hiểm Perseverance đã phát hiện các khoáng chất chỉ có thể hình thành trong môi trường có nước. Phát hiện này mở ra triển vọng về khả năng tồn tại sự sống trên Hành tinh Đỏ và là bước tiến quan trọng trong kế hoạch đưa con người lên Sao Hỏa trong tương lai.", 
            "https://images.unsplash.com/photo-1614728263952-84ea256ec676?q=80&w=800", 
            "Khoa học", LocalDate.of(2025, 10, 9), "Trần Thị B");
        a2.setViews(2340);
        a2.setTags(Arrays.asList("Vũ trụ", "NASA", "Sao Hỏa"));
        articles.add(a2);
            
        Article a3 = new Article(nextId++, 
            "Kinh tế xanh: Xu hướng tất yếu cho sự phát triển bền vững", 
            "Các quốc gia trên thế giới đang đẩy mạnh đầu tư vào năng lượng tái tạo",
            "Trong bối cảnh biến đổi khí hậu ngày càng nghiêm trọng, kinh tế xanh đã trở thành xu hướng phát triển tất yếu của nhiều quốc gia. Các chính phủ đang đầu tư hàng tỷ đô la vào các dự án năng lượng tái tạo, công nghệ sạch và giảm phát thải carbon. Chuyên gia kinh tế dự báo rằng nền kinh tế xanh không chỉ giúp bảo vệ môi trường mà còn tạo ra hàng triệu việc làm mới và thúc đẩy tăng trưởng kinh tế bền vững.", 
            "https://images.unsplash.com/photo-1633435469036-a3d83f06af52?q=80&w=800", 
            "Kinh tế", LocalDate.of(2025, 10, 8), "Lê Văn C");
        a3.setViews(890);
        a3.setTags(Arrays.asList("Kinh tế xanh", "Môi trường", "Năng lượng"));
        articles.add(a3);
        
        Article a4 = new Article(nextId++, 
            "Cách mạng 5G đang thay đổi cách chúng ta kết nối", 
            "Công nghệ 5G không chỉ nhanh hơn mà còn mở ra vô số khả năng mới",
            "Mạng 5G đang được triển khai rộng rãi trên toàn cầu, hứa hẹn mang lại tốc độ internet siêu nhanh và độ trễ cực thấp. Công nghệ này không chỉ cải thiện trải nghiệm smartphone mà còn là nền tảng cho Internet of Things (IoT), xe tự lái, thực tế ảo tăng cường và nhiều ứng dụng công nghệ tiên tiến khác.", 
            "https://images.unsplash.com/photo-1558346490-a72e53ae2d4f?q=80&w=800", 
            "Công nghệ", LocalDate.of(2025, 10, 7), "Phạm Thị D");
        a4.setViews(1200);
        a4.setTags(Arrays.asList("5G", "Viễn thông", "IoT"));
        articles.add(a4);
        
        Article a5 = new Article(nextId++, 
            "Blockchain và tương lai của tài chính phi tập trung", 
            "Công nghệ blockchain đang định hình lại hệ thống tài chính toàn cầu",
            "Blockchain, công nghệ đằng sau các loại tiền điện tử, đang tạo ra một cuộc cách mạng trong ngành tài chính. Tài chính phi tập trung (DeFi) cho phép giao dịch ngang hàng mà không cần trung gian, giảm chi phí và tăng tính minh bạch. Nhiều ngân hàng và tổ chức tài chính lớn đang nghiên cứu và áp dụng công nghệ này.", 
            "https://images.unsplash.com/photo-1639762681485-074b7f938ba0?q=80&w=800", 
            "Kinh tế", LocalDate.of(2025, 10, 6), "Hoàng Văn E");
        a5.setViews(750);
        a5.setTags(Arrays.asList("Blockchain", "Cryptocurrency", "DeFi"));
        articles.add(a5);
    }

    // CRUD Operations
    public List<Article> getAllArticles() {
        return new ArrayList<>(articles);
    }
    
    public List<Article> getPublishedArticles() {
        return articles.stream()
                .filter(Article::isPublished)
                .sorted(Comparator.comparing(Article::getPublishDate).reversed())
                .collect(Collectors.toList());
    }

    public Article getArticleById(int id) {
        return articles.stream()
                .filter(a -> a.getId() == id)
                .findFirst()
                .orElse(null);
    }
    
    public boolean addArticle(Article article) {
        article.setId(nextId++);
        return articles.add(article);
    }
    
    public boolean updateArticle(Article article) {
        for (int i = 0; i < articles.size(); i++) {
            if (articles.get(i).getId() == article.getId()) {
                articles.set(i, article);
                return true;
            }
        }
        return false;
    }
    
    public boolean deleteArticle(int id) {
        return articles.removeIf(a -> a.getId() == id);
    }

    // Advanced queries
    public List<Article> getArticlesByCategory(String category) {
        return articles.stream()
                .filter(a -> a.isPublished() && category.equals(a.getCategory()))
                .sorted(Comparator.comparing(Article::getPublishDate).reversed())
                .collect(Collectors.toList());
    }
    
    public List<Article> getFeaturedArticles() {
        return articles.stream()
                .filter(a -> a.isPublished() && a.isFeatured())
                .sorted(Comparator.comparing(Article::getPublishDate).reversed())
                .limit(5)
                .collect(Collectors.toList());
    }
    
    public List<Article> getMostViewedArticles(int limit) {
        return articles.stream()
                .filter(Article::isPublished)
                .sorted(Comparator.comparing(Article::getViews).reversed())
                .limit(limit)
                .collect(Collectors.toList());
    }
    
    public List<Article> getLatestArticles(int limit) {
        return articles.stream()
                .filter(Article::isPublished)
                .sorted(Comparator.comparing(Article::getPublishDate).reversed())
                .limit(limit)
                .collect(Collectors.toList());
    }
    
    public List<Article> getArticlesByAuthor(String author) {
        return articles.stream()
                .filter(a -> a.isPublished() && author.equals(a.getAuthor()))
                .sorted(Comparator.comparing(Article::getPublishDate).reversed())
                .collect(Collectors.toList());
    }
    
    public List<Article> searchArticles(String keyword) {
        String lowerKeyword = keyword.toLowerCase();
        return articles.stream()
                .filter(a -> a.isPublished() && 
                    (a.getTitle().toLowerCase().contains(lowerKeyword) ||
                     a.getContent().toLowerCase().contains(lowerKeyword) ||
                     a.getSummary().toLowerCase().contains(lowerKeyword)))
                .sorted(Comparator.comparing(Article::getPublishDate).reversed())
                .collect(Collectors.toList());
    }
    
    public List<Article> getArticlesByTag(String tag) {
        return articles.stream()
                .filter(a -> a.isPublished() && a.getTags().contains(tag))
                .sorted(Comparator.comparing(Article::getPublishDate).reversed())
                .collect(Collectors.toList());
    }
    
    // Pagination
    public List<Article> getArticlesWithPagination(int page, int pageSize) {
        int start = (page - 1) * pageSize;
        return articles.stream()
                .filter(Article::isPublished)
                .sorted(Comparator.comparing(Article::getPublishDate).reversed())
                .skip(start)
                .limit(pageSize)
                .collect(Collectors.toList());
    }
    
    public int getTotalPages(int pageSize) {
        long totalArticles = articles.stream()
                .filter(Article::isPublished)
                .count();
        return (int) Math.ceil((double) totalArticles / pageSize);
    }
    
    // Statistics
    public int getTotalArticleCount() {
        return articles.size();
    }
    
    public int getPublishedArticleCount() {
        return (int) articles.stream().filter(Article::isPublished).count();
    }
    
    public int getTotalViews() {
        return articles.stream()
                .mapToInt(Article::getViews)
                .sum();
    }
}