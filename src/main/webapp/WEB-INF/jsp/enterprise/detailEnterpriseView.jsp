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
    <title>EasyToTask | Détails entreprise</title>

    <style>
        @media screen and (max-width: 560px) {
            .left-sidebar {
                max-width: 100px;
            }
            .page-wrapper {
                margin-left: 100px !important;
            }
        }
    </style>
</head>

<body>
<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
    <jsp:include page="../header.jsp"/>


    <div class="page-wrapper">
        <div class="container-fluid min-vh-100">

            <div class="d-sm-flex align-items-center justify-content-between mb-2">
                <h1 class="h3 mb-0 text-gray-800">Informations de l'entreprise</h1>
            </div>
            <div class="row">
                <div class="col-lg-4 col-xlg-3 col-md-5">
                    <div class="card shadow">
                        <div class="card-body profile-card">
                            <center class="mt-4"> <img src="${enterprise.logo}"
                                    class="rounded-circle img-fluid" width="150"/>
                                <h4 class="card-title mt-2">${enterprise.name}</h4>
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
                                    <label class="col-md-12 mb-0">Nom</label>
                                    <div class="col-md-12">
                                        <h5 class="my-3">${enterprise.name}</h5>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">SIRET</label>
                                    <div class="col-md-12">
                                        <h5 class="my-3">${enterprise.siret}</h5>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Email</label>
                                    <div class="col-md-12">
                                        <h5 class="my-3"><a href="mailto:${enterprise.email}">${enterprise.email}</a></h5>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12 mb-0">Numéro de téléphone fixe</label>
                                    <div class="col-md-12">
                                        <h5 class="my-3"><a href="tel:${enterprise.phone}">${enterprise.phone}</a></h5>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12 mb-0">Numéro de téléphone portable</label>
                                    <div class="col-md-12">
                                        <h5 class="my-3"><a href="tel:${enterprise.mobile}">${enterprise.mobile}</a></h5>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12 mb-0">Site web</label>
                                    <div class="col-md-12">
                                        <h5 class="my-3"><a href="${enterprise.website}">Visiter le site web</a></h5>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12 mb-0">Adresse postale</label>
                                    <div class="col-md-12">
                                        <h5 class="my-3"><a href="https://www.google.com/maps/dir/${enterprise.address} ${enterprise.zipcode} ${enterprise.city}">
                                            ${enterprise.address} (${enterprise.additionalAddress})</a></h5>
                                        <h5 class="my-3"><a href="https://www.google.com/maps/dir/${enterprise.address} ${enterprise.zipcode} ${enterprise.city}">${enterprise.zipcode} ${enterprise.city}</a></h5>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12 mb-0">Secteur d'activité</label>
                                    <div class="col-md-12">
                                        <h5 class="my-3">${enterprise.sector}</h5>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12 mb-0">Date de création</label>
                                    <div class="col-md-12">
                                        <h5 class="my-3">${enterprise.createdAt}</h5>
                                    </div>
                                </div>
                                <div class="form-group m-2 p-2">
                                    <div class="col-sm-12 d-flex p-2">
                                        <a type="button" class="btn btn-success mx-auto text-white" href="${pageContext.request.contextPath}/enterprises/edit/${enterprise.id}">Modifier une entreprise</a>
                                        <a type="button" class="btn btn-success mx-auto text-white" href="${pageContext.request.contextPath}/enterprises/all">Retour à la liste</a>

                                        <c:import url="deleteEnterpriseAction.jsp"></c:import>
                                    </div>
                                </div>
                            </form>
                            <c:if test="${isDeleteForm}">
                                <div>
                                    <form action="${pageContext.request.contextPath}/enterprises/delete/${enterprise.id}" method="post">
                                        <input id="id" name="id" type="text" value="${enterprise.id}" required hidden=/>
                                        <div>Voulez-vous supprimer cette entreprise ?</div>
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                        <button type="submit">Oui</button>
                                    </form>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <jsp:include page="../footer.jsp"/>
    </div>
</body>

</html>