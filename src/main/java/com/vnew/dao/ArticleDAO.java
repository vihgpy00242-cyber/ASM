package com.vnew.dao;

import com.vnew.model.Article;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ArticleDAO {
    private static final List<Article> articles = new ArrayList<>();

    // Khối static để khởi tạo dữ liệu mẫu
    static {
        articles.add(new Article(1, 
            "Trí tuệ nhân tạo thế hệ mới có khả năng tự học đáng kinh ngạc", 
            "Một mô hình AI mới vừa được công bố có thể học các tác vụ phức tạp chỉ từ vài ví dụ, mở ra tiềm năng ứng dụng khổng lồ trong tương lai.", 
            "https://images.unsplash.com/photo-1677442135703-1787eea5ce01?q=80&w=800", 
            "Công nghệ", LocalDate.of(2025, 10, 10)));
        
        articles.add(new Article(2, 
            "NASA xác nhận tìm thấy dấu hiệu của nước lỏng trên Sao Hỏa", 
            "Dữ liệu từ tàu thám hiểm Perseverance cho thấy bằng chứng rõ ràng về sự tồn tại của các dòng nước mặn chảy theo mùa trên bề mặt Hành tinh Đỏ.", 
            "https://images.unsplash.com/photo-1614728263952-84ea256ec676?q=80&w=800", 
            "Khoa học", LocalDate.of(2025, 10, 9)));
            
        articles.add(new Article(3, 
            "Kinh tế xanh: Xu hướng tất yếu cho sự phát triển bền vững", 
            "Các quốc gia trên thế giới đang đẩy mạnh đầu tư vào năng lượng tái tạo và công nghệ sạch, tạo ra một cuộc cách mạng kinh tế mới.", 
            "https://images.unsplash.com/photo-1633435469036-a3d83f06af52?q=80&w=800", 
            "Kinh tế", LocalDate.of(2025, 10, 8)));
    }

    public List<Article> getAllArticles() {
        return articles;
    }

    public Article getArticleById(int id) {
        for (Article article : articles) {
            if (article.getId() == id) {
                return article;
            }
        }
        return null; // Trả về null nếu không tìm thấy
    }
}