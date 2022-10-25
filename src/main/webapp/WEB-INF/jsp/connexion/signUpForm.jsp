<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>EasyToTask | Créer un profil</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css">
</head>

<body style="background-color: #1D4851">
<section id="section1" class="container-fluid">
    <div class="row justify-content-center text-center">
        <div class="col-12 col-sm-8 col-md-7 col-lg-6 col-xl-4">
            <div class="bloc">

                <form action="${pageContext.request.contextPath}/signup" method="post">

                    <div>
                        <img src="img/logo.png" alt="logo" class="img-fluid mt-5 mb-5 mx-auto d-block">
                        <h3 class="lead text-white mb-5">Simplifiez-vous la vie !</h3>
                    </div>
                    <div class="form-outline mb-4">
                        <input type="text" name="lastname" id="lastname" class="form-control" placeholder="Nom"
                               required>
                    </div>
                    <div class="form-outline mb-4">
                        <input type="text" name="firstname" id="firstname" class="form-control" placeholder="Prénom"
                               required>
                    </div>
                    <div class="form-outline mb-4">
                        <input type="email" name="email" id="email" class="form-control" placeholder="Email" required>
                    </div>
                    <div class="form-outline mb-4">
                        <input type="password" name="password" id="password" class="form-control"
                               placeholder="Mot de passe" required>
                    </div>

                    <div class="row">
                        <%-- Toogle switch --%>
                        <div class="form-outline mb-4">
                            <div class="col-sm-12 form-check form-switch">
                                <label class="form-check-label text-white my-1" for="toggleLogoOptions">Photo de profil
                                    <input id="toggleLogoOptions" class="form-check-input" type="checkbox" role="switch"
                                           checked>
                                </label>
                            </div>
                            <%-- Picture file --%>
                            <div class="col-sm-12 mb-1">
                                <div class="mb-3">
                                    <label for="pictureFile" class="text-white">Chargez un fichier :</label>
                                    <input class="form-control form-control-sm" name="pictureFile" id="pictureFile"
                                           type="file" required="">
                                    <div class="invalid-feedback">Un fichier valide est demandé.</div>
                                </div>
                            </div>
                            <%-- Picture Url --%>
                            <div class="col-sm-12 mb-3">
                                <label for="pictureUrl" class="text-white">ou saisissez une adresse URL :</label>
                                <input id="pictureUrl" type="text" class="form-control" name="pictureUrl"
                                       placeholder="http://www.picture.website.fr/my-picture.png" required="">
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
                    <div class="form-group p-2">
                        <div class="col-sm-12 d-flex align-items-center justify-content-between mb-4">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                            <button type="submit" class="btn my-2 text-dark" style="background-color: gold">Créer
                            </button>
                            <a href="${pageContext.request.contextPath}/signin" type="button" class="btn my-2 text-dark"
                               style="background-color: gold">Annuler</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>


<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

</body>
</html>