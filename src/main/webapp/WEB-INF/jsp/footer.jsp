<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="th" uri="http://jakarta.apache.org/taglibs/standard/permittedTaglibs" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<footer class="text-center footer-expand-md position-absolute w-100" style="background-color: #F3F3F3;">
    <div class="p-3 container-fluid d-inline-block ">
        <jsp:useBean id="now" class="java.util.Date" scope="request"/>
        <p><fmt:formatDate value="${now}" pattern="yyyy"/> &copy; EasyToTask !</p>
    </div>
</footer>