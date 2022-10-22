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
    <title>EasyToTask | Liste Entreprises</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/src/main/resources/static/css/root.css">--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <script defer src="../../../js/main.js"></script>
</head>
<body>

<%--<jsp:include page="header.jsp"/>--%>

<main>
    <section class="py-5 text-center container">
        <div class="row py-lg-5">
            <div class="col-lg-6 col-md-8 mx-auto">
                <h1 class="fw-light">Liste des entreprises</h1>
                <p>
                    <a href="${pageContext.request.contextPath}/enterprises/add" class="btn my-2 text-white" style="background-color: lightcoral">Ajouter une entreprise</a>
                </p>
            </div>
        </div>
    </section>

        <div class="container">
           <h5>Filtres</h5>
            <div class="row navbar-brand d-flex align-items-center justify-content-around">
                <div class="col-10">
                    <form action="${pageContext.request.contextPath}/enterprises/all" class="navbar-brand d-flex justify-content-between" role="search">
                        <input class="form-control me-2" type="search" name="keyword" value="${keyword}" id="keyword" placeholder="Rechercher une entreprise" aria-label="Search" style="color: darkslategray">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group">
                                <button type="submit" class="btn btn-sm btn-outline-secondary">Rechercher</button>
                                <button type="button" id="clearButton" class="btn btn-sm btn-outline-secondary" onclick="clearSearch()">Effacer</button>
                                <button type="button" id="alphaButton" class="btn btn-sm btn-outline-secondary" onclick="alphabeticSearch()">A-Z</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

    <table class="table table-hover">
        <h3>Liste des entreprises</h3>
        <thead>
        <tr>
            <th scope="col">Entreprise</th>
            <th scope="col">Informations</th>
            <th scope="col">Date de création</th>
            <th scope="col">Liste des prospects</th>
            <th scope="col">Nombre de clients</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${enterpriseList}" var="enterprise">
        <tr>
            <th scope="row">
                <h5>
                    <a href="${pageContext.request.contextPath}/enterprises/details/${enterprise.id}" class="card-text">${enterprise.name}</a>
                </h5>
                <img src="${enterprise.logo}" alt="photo" width="20%">
            </th>
            <td>
                <p>
                    <i class="bi bi-envelope"></i> <a href="mailto:${enterprise.email}">${enterprise.email}</a>
                </p>
                <p>
                    <i class="bi bi-phone"></i> <a href="tel:${enterprise.mobile}">${enterprise.mobile}</a>
                </p>
                <p>
                    <i class="bi bi-telephone"></i> <a href="tel:${enterprise.phone}">${enterprise.phone}</a>
                </p>
                <p>
                    <i class="bi bi-globe"></i> <a href="${enterprise.website}">Visiter le site web</a>
                </p>
            </td>
            <td>${enterprise.createdAt}</td>
            <td>
                <c:forEach items="${enterprise.prospects}" var="prospect">
                    <p>
                        <a href="${pageContext.request.contextPath}/prospects/details/${prospect.id}" class="card-text">${prospect.firstName} ${prospect.lastName}</a>
                    </p>
                </c:forEach>
            </td>
            <td>nombre à définir</td>
            <td>
                <div class="btn-group">
                <a type="button" class="btn btn-sm btn-outline-secondary" href="${pageContext.request.contextPath}/enterprises/details/${enterprise.id}">Voir</a>
                <a type="button" class="btn btn-sm btn-outline-secondary" href="${pageContext.request.contextPath}/enterprises/edit/${enterprise.id}">Modifier</a>
            </div>
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
        </div>
</main>

<%--<jsp:include page="footer.jsp"/>--%>

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>