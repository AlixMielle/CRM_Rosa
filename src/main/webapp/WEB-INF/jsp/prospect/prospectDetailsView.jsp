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
    <title>EasyToTask | Détails du prospect</title>
</head>

<body>
<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
    <jsp:include page="../header.jsp"/>


    <div class="page-wrapper">
        <div class="container-fluid">

            <div class="d-sm-flex align-items-center justify-content-between mb-2">
                <h1 class="h3 mb-0 text-gray-800">Informations du prospect</h1>
            </div>
            <div class="row">
                <div class="col-lg-4 col-xlg-3 col-md-5">
                    <div class="card shadow">
                        <div class="card-body profile-card">
                            <center class="mt-4"> <img src="${prospect.profilePictureUrl}"
                                                       class="rounded-circle img-fluid" width="150"/>
                                <h4 class="card-title mt-2">${prospect.firstName} ${prospect.lastName}</h4>
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
                                        <h5 class="my-3"><a href="mailto:${prospect.email}">${prospect.email}</a></h5>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12 mb-0">Téléphone fixe</label>
                                    <div class="col-md-12">
                                        <h5 class="my-3"><a href="tel:${prospect.landlinePhone}">${prospect.landlinePhone}</a></h5>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12 mb-0">Téléphone portable</label>
                                    <div class="col-md-12">
                                        <h5 class="my-3"><a href="tel:${prospect.mobilePhone}">${prospect.mobilePhone}</a></h5>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12 mb-0">Adresse postale</label>
                                    <div class="col-md-12">
                                        <h5 class="my-3"><a href="https://www.google.com/maps/dir/${prospect.address}">${prospect.address}</a></h5>
                                        </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12 mb-0">Profession</label>
                                    <div class="col-md-12">
                                        <h5 class="my-3">${prospect.jobTitle}</h5>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12 mb-0">Entreprise</label>
                                    <div class="col-md-12">
                                        <h5 class="my-3">${prospect.enterprise.name}</h5>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12 mb-0">Date de création</label>
                                    <div class="col-md-12">
                                        <h5 class="my-3">${prospect.createdAt}</h5>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12 mb-0">Statut de prospection</label>
                                    <div class="col-md-12">
                                        <h5 class="my-3">${prospect.prospectionStatus}</h5>
                                    </div>
                                </div>
                                <div class="form-group m-2 p-2">
                                    <div class="col-sm-12 d-flex p-2">
                                        <a type="button" class="btn btn-success mx-auto text-white" href="${pageContext.request.contextPath}/notes/${prospect.id}">Notes du prospect</a>
                                        <a type="button" class="btn btn-success mx-auto text-white" href="${pageContext.request.contextPath}/prospects/all">Retour à la liste</a>
                                    </div>
                                    <c:if test="${isDeleteForm}">
                                        <div>
                                            <form action="${pageContext.request.contextPath}/prospects/delete/${prospect.id}" method="post">
                                                <input id="id" name="id" type="text" value="${prospect.id}" required hidden=/>
                                                <div>Voulez-vous supprimer ce prospect ?</div>
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                                <button type="submit">Oui</button>
                                            </form>
                                        </div>
                                    </c:if>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        <jsp:include page="../footer.jsp"></jsp:include>
        </div>
    </div>
</body>
</html>