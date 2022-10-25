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
    <title>EasyToTask | Détails de l'utilisateur</title>
</head>

<body>
<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
    <jsp:include page="../header.jsp"/>

        <div class="page-wrapper">
            <div class="container-fluid">

                <div class="d-sm-flex align-items-center justify-content-between mb-2">
                    <h1 class="h3 mb-0 text-gray-800">Mon profil</h1>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-xlg-3 col-md-5">
                        <div class="card shadow">
                            <div class="card-body profile-card">
                                <center class="mt-4"> <img src="${user.pictureUrl}"
                                                           class="rounded-circle img-fluid" width="150"/>
                                    <h4 class="card-title mt-2">${user.firstname} ${user.lastname}</h4>
                                    <div class="row text-center justify-content-center">
                                    </div>
                                </center>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8 col-xlg-9 col-md-7">
                        <div class="card shadow mb-5">
                            <div class="card-body">
                                <form class="form-horizontal form-material mx-2">
                                    <div class="form-group">
                                        <label class="col-md-12">Email</label>
                                        <div class="col-md-12">
                                            <h5 class="my-3"><a href="mailto:${user.email}">${user.email}</a></h5>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12 mb-0">Téléphone fixe</label>
                                        <div class="col-md-12">
                                            <h5 class="my-3"><a href="tel:${user.phone}">${user.phone}</a></h5>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12 mb-0">Téléphone portable</label>
                                        <div class="col-md-12">
                                            <h5 class="my-3"><a href="tel:${user.mobile}">${user.mobile}</a></h5>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12 mb-0">Adresse</label>
                                        <div class="col-md-12">
                                            <h5 class="my-3"><a href="https://www.google.com/maps/dir/${user.address} ${user.zipcode} ${user.city}">
                                                ${user.address}</a></h5>
                                            <h5 class="my-3"><a href="https://www.google.com/maps/dir/${user.address} ${user.zipcode} ${user.city}">${user.zipcode} ${user.city}</a></h5>
                                        </div>
                                    </div>

                                    <div class="form-group m-2 p-2">
                                        <div class="col-sm-12 d-flex p-2">
                                            <c:if test="${user.id == currentUser.id}">
                                                <a type="button" class="btn btn-success mx-auto text-white" href="${pageContext.request.contextPath}/users/edit/${user.id}">Modifier le profil</a>
                                            </c:if>
                                            <c:if test="${user.id == currentUser.id || currentUser.isAdmin}">
                                                <a type="button" class="btn btn-sm btn-outline-danger" href="${pageContext.request.contextPath}/users/delete/${user.id}">Supprimer le profil</a>
                                            </c:if>
                                        </div>
                                    </div>
                                </form>
                                <c:if test="${isDeleteForm}">
                                    <div>
                                        <form action="${pageContext.request.contextPath}/users/delete/${user.id}" method="post">
                                            <input id="id" name="id" type="text" value="${user.id}" required hidden=/>
                                            <div>Voulez-vous supprimer ce prospect ?</div>
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                            <button type="submit">Oui</button>
                                        </form>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
                <jsp:include page="../footer.jsp"/>
            </div>
        </div>
</body>

</html>