<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="th" uri="http://jakarta.apache.org/taglibs/standard/permittedTaglibs" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>EasyToTask | Création entreprise</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/src/main/resources/static/css/root.css">--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>
<body class="bg-light">

<%--<jsp:include page="header.jsp"/>--%>

<div class="container">
    <main>
        <div class="py-5">
            <h2>Créer une nouvelle entreprise</h2>
            <p class="lead">Saisissez le moindre détail !</p>
            <hr class="my-1">
        </div>

        <div class="row g-3">
            <div class="col-md-7 col-lg-8">
                <form action="${pageContext.request.contextPath}/enterprises/add" method="post"
                      enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-sm-6">
                            <label for="name" class="form-label">Nom de l'entreprise</label>
                            <input type="text" class="form-control" id="name" name="name">
                        </div>
                        <div class="col-sm-6 mb-3">
                            <label for="siret" class="form-label">N° siret</label>
                            <input type="text" class="form-control" id="siret" name="siret">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email">
                        </div>
                        <div class="col-sm-6 mb-3">
                            <label for="website" class="form-label">Site web </label>
                            <input type="text" class="form-control" id="website" name="website">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 mb-3">
                            <label for="mobile" class="form-label">Portable</label>
                            <input type="text" class="form-control" id="mobile" name="mobile">
                        </div>
                        <div class="col-sm-6">
                            <label for="phone" class="form-label">Téléphone fixe</label>
                            <input type="text" class="form-control" id="phone" name="phone">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <label for="address" class="form-label">Adresse</label>
                            <input type="text" class="form-control" id="address" name="address">
                        </div>
                        <div class="col-sm-6 mb-3">
                            <label for="additionalAddress" class="form-label">Complément d'adresse</label>
                            <input type="text" class="form-control" id="additionalAddress" name="additionalAddress">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 mb-3">
                            <label for="zipcode" class="form-label">Code Postal</label>
                            <input type="number" class="form-control" id="zipcode" name="zipcode" required>
                        </div>
                        <div class="col-sm-6">
                            <label for="city" class="form-label">Ville</label>
                            <input type="text" class="form-control" id="city" name="city">
                        </div>
                    </div>
                    <%-- Toogle switch --%>
                    <div class="row g-3">
                        <div class="col-sm-12 form-check form-switch">
                            <label class="form-check-label" for="toggleLogoOptions">Logo de l'entreprise</label>
                            <input id="toggleLogoOptions" class="form-check-input" type="checkbox" role="switch"
                                   checked>
                        </div>
                        <%-- Picture file --%>
                        <div class="col-sm-12 mb-1">
                            <label for="logoFile">Chargez un fichier :</label>
                            <input id="logoFile" type="file" name="logoFile" required="" disabled>
                            <div class="invalid-feedback">Un fichier valide est demandé.</div>
                        </div>
                        <%-- Picture Url --%>
                        <div class="col-sm-12 mb-3">
                            <label for="logoUrl">ou saisissez une adresse URL :</label>
                            <input id="logoUrl" type="text" class="form-control" name="logoUrl"
                                   placeholder="http://www.picture.website.fr/my-picture.png" required="">
                            <div class="invalid-feedback">Une URL valide est obligatoire.</div>
                        </div>
                    </div>
                    <script>
                        let checkboxPictures = document.getElementById("toggleLogoOptions");
                        checkboxPictures.addEventListener('change', function () {
                            document.getElementById("logoUrl").disabled = !this.checked;
                            document.getElementById("logoFile").disabled = this.checked;
                        });
                    </script>
                    <div class="col-12">
                        <label for="sector" class="form-label">Secteur d'activité</label>
                        <div class="input-group">
                            <textarea class="form-control" id="sector" name="sector" rows="2"></textarea>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <label for="prospect">Prospects/Clients:</label>
                        <select class="form-select" id="prospect" required name="prospectsIds" multiple>
                            <option <c:if test="${empty enterprise}">selected</c:if> value="-1">Aucune</option>
                            <c:forEach items="${prospectList}" var="prospect">
                                <option <c:if test="${enterprise.prospect==prospect}">selected</c:if> value="${prospect.id}"> ${prospect.firstName} ${prospect.lastName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    <button class="btn my-2 text-white" style="background-color: darkslategray" type="submit">
                        Enregistrer une nouvelle entreprise
                    </button>
                    <button class="btn my-2 text-white" style="background-color: darkslategray" type="reset">Annuler
                    </button>
                    <div>
                        <a href="${pageContext.request.contextPath}/enterprises/all" style="color: darkslategray">Retour à
                            la liste</a>
                    </div>
                </form>
            </div>
        </div>
    </main>

<%--    <jsp:include page="footer.jsp"/>--%>
</div>

<script src="${pageContext.request.contextPath}/docs/5.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

<script src="form-validation.js"></script>

</body>