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
    <title>EasyToTask | Modifier un utilisateur</title>

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
            <div class="row">
                <div class="col-lg-4 col-xlg-3 col-md-5">
                    <form action="${pageContext.request.contextPath}/users/edit/${user.id}"
                          method="post"
                          enctype="multipart/form-data">
                        <input type="hidden" name="id" value="${user.id}">
                        <div class="card shadow">
                            <div class="card-body profile-card">
                                <center class="mt-4"><img src="${user.pictureUrl}"
                                                          class="rounded-circle img-fluid" width="150"/>
                                    <h4 class="card-title mt-2">${user.firstname} ${user.lastname}</h4>
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
                                <div class="form-group">
                                    <label class="col-sm-12" for="lastname">Nom</label>
                                    <div class="col-md-12">
                                        <input class="form-control ps-0 form-control-line" type="text" name="lastname"
                                               id="lastname"
                                               value="${user.lastname}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-12" for="firstname">Prénom</label>
                                    <div class="col-md-12">
                                        <input class="form-control ps-0 form-control-line" type="text" name="firstname"
                                               id="firstname"
                                               value="${user.firstname}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-12" for="mobile">Téléphone portable</label>
                                    <div class="col-md-12">
                                        <input class="form-control ps-0 form-control-line" type="text" name="mobile"
                                               id="mobile"
                                               value="${user.mobile}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-12" for="phone">Téléphone fixe</label>
                                    <div class="col-md-12">
                                        <input class="form-control ps-0 form-control-line" type="text" name="phone"
                                               id="phone"
                                               value="${user.phone}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-12" for="email">Email</label>
                                    <div class="col-md-12">
                                        <input class="form-control ps-0 form-control-line" type="text" name="email"
                                               id="email"
                                               value="${user.email}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-sm-12">Mot de passe</label>
                                    <div class="col-md-12">
                                        <input type="password" class="form-control" id="password" name="password"
                                               value="${user.password}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-12" for="job">Profession</label>
                                    <div class="col-md-12">
                                        <input class="form-control ps-0 form-control-line" type="text" name="job"
                                               id="job"
                                               value="${user.job}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-12" for="enterprise">Entreprise</label>
                                    <input class="form-control ps-0 form-control-line" type="text" name="enterprise"
                                           id="enterprise"
                                           value="${user.enterpriseName}">
                                </div>
                                <div class="form-group m-2 p-2">
                                    <div class="col-sm-12 d-flex p-2">
                                        <input class="form-control ps-0 form-control-line" type="hidden"
                                               name="${_csrf.parameterName}" value="${_csrf.token}">
                                        <button class="btn btn-success mx-auto text-white" type="submit">Modifier le
                                            profil
                                        </button>
                                    </div>
                                </div>
                                </form>
                            </div>
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
