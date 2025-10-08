<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<footer class="site-footer">
    <div class="container">
        <p>&copy; 2025 ABC News. All rights reserved.</p>
        <div class="social-links">
            <a href="#">Facebook</a> | <a href="#">Twitter</a> | <a href="#">Instagram</a>
        </div>
        <p>Liên hệ: contact@abcnews.vn | Hotline: 0123 456 789</p>
    </div>
</footer>

<%-- Scripts chung cho toàn bộ trang --%>
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