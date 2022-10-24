<footer class="text-center footer-expand-md fixed-bottom" style="background-color: #F3F3F3;">
    <div class="p-4 container-fluid d-inline-block">
        <jsp:useBean id="now" class="java.util.Date" scope="request"/>
        <p><fmt:formatDate value="${now}" pattern="yyyy"/> &copy; EasyToTask !</p>
    </div>
</footer>