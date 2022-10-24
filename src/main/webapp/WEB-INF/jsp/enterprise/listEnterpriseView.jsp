<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="th" uri="http://jakarta.apache.org/taglibs/standard/permittedTaglibs" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicon.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link href="../../../css/style.min.css" rel="stylesheet">
    <script defer src="../../../js/main.js"></script>
    <title>EasyToTask | Liste des entreprises</title>
</head>

<body>
<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
    <jsp:include page="../header.jsp"/>

    <div class="page-wrapper">
        <div class="container-fluid">
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">Liste des entreprises</h1>
                <p><a href="${pageContext.request.contextPath}/enterprises/add"
                      class="btn btn-success mx-auto text-white">Créer une entreprise</a></p>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row d-flex align-items-center justify-content-around">
                                <div class="col-10">
                                    <form action="${pageContext.request.contextPath}/enterprises/all"
                                          class="d-flex justify-content-between" role="search">
                                        <input class="form-control me-2" type="search" name="keyword" value="${keyword}"
                                               id="keyword"
                                               placeholder="Rechercher une entreprise" aria-label="Search"
                                               style="color: darkslategray">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="btn-group">
                                                <button type="submit" class="btn"><i class="bi bi-search"></i></button>
                                                <button type="button" id="clearButton" class="btn"
                                                        onclick="clearSearch()"><i class="bi bi-arrow-clockwise"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table user-table">
                                    <thead>
                                    <tr>
                                        <th class="border-top-0">Logo</th>
                                        <th class="border-top-0">Nom
                                            <form action="${pageContext.request.contextPath}/enterprises/all/sorted">
                                                <button type="submit" class="btn"><i class="bi bi-sort-alpha-down"></i>
                                                </button>
                                            </form>
                                            <form action="${pageContext.request.contextPath}/enterprises/all/resorted">
                                                <button type="submit" class="btn"><i class="bi bi-sort-alpha-up"></i>
                                                </button>
                                            </form>
                                        </th>
                                        <th class="border-top-0">SIRET</th>
                                        <th class="border-top-0">Informations</th>
                                        <th class="border-top-0">Adresse</th>
                                        <th class="border-top-0">Date de création</th>
                                        <th class="border-top-0">Prospects de l'entreprise</th>
                                        <th class="border-top-0">Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${enterpriseList}" var="enterprise">
                                        <tr>
                                            <td>
                                                <img src="${enterprise.logo}" width="40" height="40"
                                                     class="rounded-circle">
                                            </td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/enterprises/details/${enterprise.id}"
                                                   class="card-text">${enterprise.name}</a>
                                            </td>
                                            <td>
                                                    ${enterprise.siret}
                                            </td>
                                            <td>
                                                <div><a href="mailto:${enterprise.email}">${enterprise.email}</a></div>
                                                <div><a href="tel:${enterprise.mobile}">${enterprise.mobile}</a></div>
                                                <div><a href="tel:${enterprise.phone}">${enterprise.phone}</a></div>
                                                <div><a href="${enterprise.website}">Visiter le site web</a></div>
                                            </td>
                                            <td><div><a href="https://www.google.com/maps/dir/${enterprise.address} ${enterprise.zipcode} ${enterprise.city}">${enterprise.address} ${enterprise.zipcode} ${enterprise.city}</a></div></td>
                                            <td>${enterprise.createdAt}</td>
                                            <td>
                                                <c:forEach items="${enterprise.prospects}" var="prospect">
                                                    <div>
                                                        <a href="${pageContext.request.contextPath}/prospects/details/${prospect.id}"
                                                           class="card-text">${prospect.firstName} ${prospect.lastName}</a>
                                                    </div>
                                                </c:forEach>
                                            </td>
                                            <td>
                                                <a type="button" class="btn btn-sm btn-outline-primary"
                                                   href="${pageContext.request.contextPath}/enterprises/details/${enterprise.id}"><i
                                                        class="bi bi-eye"></i></a>
                                                <a type="button" class="btn btn-sm btn-outline-secondary"
                                                   href="${pageContext.request.contextPath}/enterprises/edit/${enterprise.id}"><i
                                                        class="bi bi-pencil"></i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="../footer.jsp"/>
        </div>
    </div>
</div>
</body>

</html>