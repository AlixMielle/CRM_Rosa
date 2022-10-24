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
    <title>EasyToTask | Editer l'utilisateur</title>


</head>

<body>
<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
    <jsp:include page="../header.jsp"/>

<div class="container">
    <main>
        <div class="py-5">
            <h2>Modifiez votre profil</h2>
            <p class="lead">C'est l'occasion de mettre à jour vos coordonnées</p>
            <hr class="my-1">
        </div>

        <div class="row g-3">
            <div class="col-md-7 col-lg-8">
                <form action="${pageContext.request.contextPath}/users/edit/${user.id}" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="${user.id}">
                    <div class="row">
                        <div class="col-sm-6">
                            <label for="lastname" class="form-label">Nom</label>
                            <input type="text" class="form-control" id="lastname" name="lastname" value="${user.lastname}">
                        </div>
                        <div class="col-sm-6 mb-3">
                            <label for="firstname" class="form-label">Prénom</label>
                            <input type="text" class="form-control" id="firstname" name="firstname" value="${user.firstname}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" value="${user.email}">
                        </div>
                        <div class="col-sm-6">
                            <label for="password" class="form-label">Mot de passe</label>
                            <input type="password" class="form-control" id="password" name="password" value="${user.password}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <label for="mobile" class="form-label">Portable</label>
                            <input type="text" class="form-control" id="mobile" name="mobile" value="${user.mobile}">
                        </div>
                        <div class="col-sm-6">
                            <label for="phone" class="form-label">Téléphone fixe</label>
                            <input type="text" class="form-control" id="phone" name="phone" value="${user.phone}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <label for="address" class="form-label">Adresse</label>
                            <input type="text" class="form-control" id="address" name="address" value="${user.address}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <label for="city" class="form-label">Ville</label>
                            <input type="text" class="form-control" id="city" name="city" value="${user.city}">
                        </div>
                        <div class="col-sm-6">
                            <label for="zipcode" class="form-label">Code postal</label>
                            <input type="text" class="form-control" id="zipcode" name="zipcode" value="${user.zipcode}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <label for="enterpriseName" class="form-label">Nom de l'entreprise</label>
                            <input type="text" class="form-control" id="enterpriseName" name="enterpriseName" value="${user.enterpriseName}">
                        </div>
                        <div class="col-sm-6">
                            <label for="job" class="form-label">Intitulé du poste</label>
                            <input type="text" class="form-control" id="job" name="job" value="${user.job}">
                        </div>
                    </div>
                    <%-- Toogle switch --%>
                    <div class="row g-3">
                        <div class="col-sm-12 form-check form-switch">
                            <label class="form-check-label" for="togglePictureOptions">Photo de profil</label>
                            <input id="togglePictureOptions" class="form-check-input" type="checkbox" role="switch"
                                   checked>
                        </div>
                        <%-- Picture file --%>
                        <div class="col-sm-12 mb-1">
                            <label for="pictureFile">Chargez une photo :</label>
                            <input id="pictureFile" type="file" name="pictureFile" required="" disabled value="${user.pictureUrl}">
                            <div class="invalid-feedback">Un fichier valide est demandé.</div>
                        </div>
                        <%-- Picture Url --%>
                        <div class="col-sm-12 mb-3">
                            <label for="pictureUrl">ou saisissez une adresse URL :</label>
                            <input id="pictureUrl" type="text" class="form-control" name="pictureUrl"
                                   placeholder="http://www.picture.website.fr/my-picture.png" required="" value="${user.pictureUrl}">
                            <div class="invalid-feedback">Une URL valide est obligatoire.</div>
                        </div>
                    </div>
                    <script>
                        let checkboxPictures = document.getElementById("togglePictureOptions");
                        checkboxPictures.addEventListener('change', function () {
                            document.getElementById("pictureUrl").disabled = !this.checked;
                            document.getElementById("pictureFile").disabled = this.checked;
                        });
                    </script>


                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    <button class="btn my-2 text-white" style="background-color: darkslategray" type="submit">Modifier le profil</button>
                    <button class="btn my-2 text-white" style="background-color: darkslategray" type="reset">Annuler</button>
                    <div>
                        <a href="${pageContext.request.contextPath}/users/all" style="color: darkslategray">Retour à la liste</a>
                    </div>
                </form>
            </div>
        </div>

    </main>


    <jsp:include page="../footer.jsp"/>
</div>
</div>

<script src="${pageContext.request.contextPath}/docs/5.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

<script src="form-validation.js"></script>


</body>