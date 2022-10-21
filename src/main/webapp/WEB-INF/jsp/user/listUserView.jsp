<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="th" uri="http://jakarta.apache.org/taglibs/standard/permittedTaglibs" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>EasyToTask | Liste Utilisateurs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/src/main/resources/static/css/style.css">--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css">
</head>
<body>

<%--<jsp:include page="header.jsp"/>--%>

<main>

    <section class="py-2 text-center container">
        <div class="row py-lg-5">
            <div class="col-lg-6 col-md-8 mx-auto">
                <h1 class="fw-light">EasyToTask</h1>
                <p class="lead text-muted">Simplifiez-vous la vie !</p>
                <p>
                    <a href="${pageContext.request.contextPath}/signup" class="btn my-2 text-white" style="background-color: darkslategray">Créer un compte</a>
                </p>
            </div>
        </div>
    </section>

    <div class="album py-5 bg-light">
        <div class="container">

            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <c:forEach items="${userList}" var="user">
                    <div class="col">
                        <div class="card shadow-sm">
                            <img src="${user.pictureUrl}" alt="photo">
                            <div class="card-body">
                                <h3 class="card-text">${user.firstname} ${user.lastname}</h3>
                                    <%--<c:forEach items="${enterprises.prospects}" var="prospect">
                                        <h5 class="card-text">${prospect.firstname} ${prospect.lastname}</h5>
                                    </c:forEach>--%>
                                <h5 class="card-text">${user.email}</h5>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <a type="button" class="btn btn-sm btn-outline-secondary" href="${pageContext.request.contextPath}/users/details/${user.id}">Voir</a>
                                        <a type="button" class="btn btn-sm btn-outline-secondary" href="${pageContext.request.contextPath}/users/edit/${user.id}">Modifier</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

</main>

<%--<jsp:include page="footer.jsp"/>--%>

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>