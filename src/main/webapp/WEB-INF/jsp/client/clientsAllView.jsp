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
    <title>EasyToTask | Liste des clients</title>
</head>

<body>
<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
    <jsp:include page="../header.jsp"/>
    <div class="page-wrapper">
        <div class="container-fluid">
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">Liste des clients</h1>
                <p><a href="${pageContext.request.contextPath}/prospects/add"
                      class="btn btn-success mx-auto text-white">Créer un client</a></p>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row d-flex align-items-center justify-content-around">
                                <div class="col-10">
                                    <form class="d-flex" role="search"
                                          action="${pageContext.request.contextPath}/clients/search" method="get">
                                        <input class="form-control me-2" type="search" placeholder="Rechercher"
                                               aria-label="Search" name="search">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                        <button class="btn" type="submit"><i class="bi bi-search"></i></button>
                                    </form>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table user-table">
                                    <thead>
                                    <tr>
                                        <th class="border-top-0">Photo</th>
                                        <th class="border-top-0">Nom
                                            <a type="button" id="sortAlphabetButton"><i class="bi bi-sort-alpha-down"></i></a>
                                            <a type="button" id="sortReverseAlphabetButton"><i class="bi bi-sort-alpha-up"></i></a>
                                        </th>
                                        <th class="border-top-0">Informations</th>
                                        <th class="border-top-0">Profession</th>
                                        <th class="border-top-0">Entreprise</th>
                                        <th class="border-top-0">Statut de prospection</th>
                                        <th class="border-top-0">Date de création
                                            <a type="button" id="sortDateButton"><i class="bi bi-sort-numeric-down"></i></a>
                                            <a type="button" id="sortReverseDateButton"><i class="bi bi-sort-numeric-up"></i></a>
                                        </th>
                                        <th class="border-top-0">Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody id="enterpriseSheet">
                                    <c:forEach items="${clients}" var="client">
                                        <tr>
                                            <td>
                                                <img src="${client.profilePictureUrl}" width="40" height="40"
                                                     class="rounded-circle">
                                            </td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/prospects/details/${client.id}"
                                                   class="card-text enterpriseName">${client.lastName} ${client.firstName}</a>
                                            <td>
                                                <div><a href="mailto:${client.email}">${client.email}</a></div>
                                                <div><a href="tel:${client.mobilePhone}">${client.mobilePhone}</a>
                                                </div>
                                                <div>
                                                    <a href="tel:${client.landlinePhone}">${client.landlinePhone}</a>
                                                </div>
                                            </td>
                                            <td>${client.jobTitle}</td>
                                            <td>${client.enterprise.name}</td>
                                            <td>${client.prospectionStatus.inFrench}</td>
                                            <td class="createdAt">${client.createdAt}</td>
                                            <td>
                                                <a type="button" class="btn btn-sm btn-outline-primary"
                                                   href="${pageContext.request.contextPath}/clients/details/${client.id}"><i
                                                        class="bi bi-eye"></i></a>
                                                <a type="button" class="btn btn-sm btn-outline-secondary"
                                                   href="${pageContext.request.contextPath}/clients/edit/${client.id}"><i
                                                        class="bi bi-pencil"></i></a>
                                                <a type="button" class="btn btn-sm btn-outline-danger"
                                                   href="${pageContext.request.contextPath}/clients/delete/${client.id}"><i class="bi bi-trash3"></i></a>
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