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
    <title>EasyToTask | Ajouter un prospect</title>
</head>

<body>
<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
    <jsp:include page="../header.jsp"/>

    <div class="page-wrapper">
        <div class="container-fluid">
            <div class="d-sm-flex align-items-center justify-content-between mb-2">
                <h1 class="h3 mb-0 text-gray-800"><c:choose><c:when
                        test="${empty prospect}">Créer un prospect</c:when><c:otherwise>Modifier un prospect</c:otherwise></c:choose></h1>
            </div>
            <div class="row">
                <div class="col-lg-4 col-xlg-3 col-md-5">
                    <form action="${pageContext.request.contextPath}/prospects<c:choose><c:when test="${empty prospect}">/add</c:when><c:otherwise>/edit</c:otherwise></c:choose>"
                              method="post"
                              enctype="multipart/form-data">
                        <div class="card shadow">
                            <div class="card-body profile-card">
                                <center class="mt-4"><img src="${prospect.profilePictureUrl}"
                                                          class="rounded-circle img-fluid" width="150"/>
                                    <h4 class="card-title mt-2">${prospect.firstName} ${prospect.lastName}</h4>
                                    <h6 class="card-subtitle">${prospect.jobTitle}</h6>
                                    <div class="row text-center justify-content-center">
                                    </div>
                                </center>
                            </div>
                            <div class="card-footer bg-dark text-white">
                                <div class="text-white form-check form-switch">
                                    <label class="form-check-label" for="toggleLogoOptions">Photo de profil</label>
                                    <input id="toggleLogoOptions" class="form-check-input" type="checkbox" role="switch"
                                           checked>
                                </div>
                                <div class="col-sm-12 mb-1">
                                    <label for="pictureFile">Chargez une photo :</label>
                                    <input id="pictureFile" type="file" name="pictureFile" required="" disabled
                                           value="${user.pictureUrl}">
                                    <div class="invalid-feedback">Un fichier valide est demandé.</div>
                                </div>

                                <div class="col-sm-12 mb-3">
                                    <label for="pictureUrl">ou saisissez une adresse URL :</label>
                                    <input id="pictureUrl" type="text" class="form-control" name="pictureUrl"
                                           placeholder="http://www.picture.website.fr/my-picture.png" required=""
                                           value="${user.pictureUrl}">
                                    <div class="invalid-feedback">Une URL valide est obligatoire.</div>
                                </div>
                            </div>
                            <script>
                                let checkboxPictures = document.getElementById("toggleLogoOptions");
                                checkboxPictures.addEventListener('change', function () {
                                    document.getElementById("pictureUrl").disabled = !this.checked;
                                    document.getElementById("pictureFile").disabled = this.checked;
                                });
                            </script>
                        </div>
                    </div>
                <div class="col-lg-8 col-xlg-9 col-md-7">
                    <div class="card shadow mb-5">
                        <div class="card-body">
                            <div class="form-horizontal form-material mx-2">
                                <c:if test="${!empty prospect}"><input hidden type="text" name="id"
                                                                       value="${prospect.id}"></c:if>
                                <div class="form-group">
                                    <label class="col-sm-12" for="firstName">Prénom</label>
                                    <div class="col-md-12">
                                        <input class="form-control ps-0 form-control-line" type="text" name="firstName" id="firstName"
                                               <c:if test="${!empty prospect}">value="${prospect.firstName}"</c:if>>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-12" for="lastName">Nom</label>
                                    <div class="col-md-12">
                                        <input class="form-control ps-0 form-control-line" type="text" name="lastName" id="lastName"
                                               <c:if test="${!empty prospect}">value="${prospect.lastName}"</c:if>>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-12" for="mobilePhone">Télephone portable</label>
                                    <div class="col-md-12">
                                        <input class="form-control ps-0 form-control-line" type="text" name="mobilePhone" id="mobilePhone"
                                               <c:if test="${!empty prospect}">value="${prospect.mobilePhone}"</c:if>>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-12" for="landlinePhone">Télephone fixe</label>
                                    <div class="col-md-12">
                                        <input class="form-control ps-0 form-control-line" type="text" name="landlinePhone" id="landlinePhone"
                                               <c:if test="${!empty prospect}">value="${prospect.landlinePhone}"</c:if>>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-12" for="email">Email</label>
                                    <div class="col-md-12">
                                        <input class="form-control ps-0 form-control-line" type="text" name="email" id="email"
                                               <c:if test="${!empty prospect}">value="${prospect.email}"</c:if>>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-12" for="jobTitle">Profession</label>
                                    <div class="col-md-12">
                                        <input class="form-control ps-0 form-control-line" type="text" name="jobTitle" id="jobTitle"
                                               <c:if test="${!empty prospect}">value="${prospect.jobTitle}"</c:if>>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-12" for="enterprise">Entreprise</label>
                                    <select class="form-select shadow-none ps-0 border-0 form-control-line" id="enterprise" required name="enterpriseId">
                                        <option
                                                <c:if test="${empty prospect}">selected</c:if> value="-1">Aucune
                                        </option>
                                        <c:forEach items="${enterprises}" var="enterprise">
                                            <option
                                                    <c:if test="${prospect.enterprise==enterprise}">selected</c:if>
                                                    value="${enterprise.id}">${enterprise.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <!--When adding a Client the prospectionStatus is necessarily CLIENT-->
                                    <c:choose>
                                    <c:when test="${addingClient}">
                                        <input type="text" name="prospectionStatus" value="CLIENT" hidden>
                                    </c:when>
                                    <c:otherwise>
                                    <div class="form-group">
                                        <label class="col-sm-12" for="prospectionStatus">Statut de prospection</label>
                                        <select class="form-select shadow-none ps-0 border-0 form-control-line" id="prospectionStatus" required
                                                name="prospectionStatus">
                                            <c:forEach items="${prospectionStatuses}" var="prospectionStatus">
                                                <option
                                                        <c:if test="${prospect.prospectionStatus==prospectionStatus}">selected</c:if>
                                                        value="${prospectionStatus}">${prospectionStatus.inFrench}</option>
                                            </c:forEach>
                                        </select>
                                        </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                <div class="form-group m-2 p-2">
                                    <div class="col-sm-12 d-flex p-2">
                                        <input class="form-control ps-0 form-control-line" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                        <button class="btn btn-success mx-auto text-white" type="submit"><c:choose><c:when
                                                test="${empty prospect}">Créer un profil</c:when><c:otherwise>Modifier le profil</c:otherwise></c:choose></button>
                                    </div>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                <jsp:include page="../footer.jsp"/>
            </div>
        </div>
</body>

</html>