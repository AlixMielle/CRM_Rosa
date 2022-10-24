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
    <jsp:include page="header.jsp"/>

<form class="d-flex" role="search" action="${pageContext.request.contextPath}/clients/search" method="get">
    <input class="form-control me-2" type="search" placeholder="Rechercher" aria-label="Search" name="search">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    <button class="btn btn-outline-success" type="submit">Search</button>
</form>

<div><a href="${pageContext.request.contextPath}/prospects/all">all prospects</a> <a href="${pageContext.request.contextPath}/prospects/add">Ajout de prospect</a></div>

<h1>Liste Clients</h1>
<c:forEach items="${clients}" var="client">
    <div>Prenom: ${client.firstName}</div>
    <div>Nom de famille: ${client.lastName}</div>
    <div><a href="${pageContext.request.contextPath}/clients/details/${client.id}">Details</a> <a href="${pageContext.request.contextPath}/clients/delete/${client.id}">Suppression</a> <a href="${pageContext.request.contextPath}/clients/edit/${client.id}">Mise a jour</a></div>
</c:forEach>

    <jsp:include page="footer.jsp"/>
</div>


</body>

</html>