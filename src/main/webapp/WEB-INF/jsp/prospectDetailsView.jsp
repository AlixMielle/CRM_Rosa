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
    <title>EasyToTask | Détails d'un prospect</title>


</head>

<body>
<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
    <jsp:include page="header.jsp"/>

<h1>Contact details</h1>
<div><img src="${prospect.profilePictureUrl}" class="max-width=500px max-height=500px"></div>
<div>Prenom: ${prospect.firstName}</div>
<div>Nom de famille: ${prospect.lastName}</div>
<div>Email: ${prospect.email}</div>
<div>Telephone portable: ${prospect.mobilePhone}</div>
<div>Telephone fixe: ${prospect.landlinePhone}</div>
<div>Prospection status: ${prospect.prospectionStatus}</div>

<c:if test="${isDeleteForm}">
    <div>
        <form action="${pageContext.request.contextPath}/prospects/delete/${prospect.id}" method="post">
            <input id="id" name="id" type="text" value="${prospect.id}" required hidden=/>
            <div>Etes vous sur de vouloir supprimer ce prospect?</div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <button type="submit">Oui</button>
        </form>
    </div>
</c:if>
<div><a href="${pageContext.request.contextPath}/notes/${prospect.id}">Notes du prospect</a></div>
<div><a href="${pageContext.request.contextPath}/prospects/all">Retour</a></div>

    <jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>