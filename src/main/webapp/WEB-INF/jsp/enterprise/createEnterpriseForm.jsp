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
    <title>EasyToTask | Créer une entreprise</title>
</head>

<body>
<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
    <jsp:include page="../header.jsp"/>

    <div class="page-wrapper">
        <div class="container-fluid">

            <div class="d-sm-flex align-items-center justify-content-between mb-2">
                <h1 class="h3 mb-0 text-gray-800">Créer une entreprise</h1>
            </div>
            <div class="row">
                <div class="col-lg-4 col-xlg-3 col-md-5">
                    <form action="${pageContext.request.contextPath}/enterprises/add" method="post"
                          enctype="multipart/form-data">
                    <div class="card shadow">
                        <div class="card-footer bg-dark text-white">
                            <div class="text-white form-check form-switch">
                                <label class="form-check-label" for="toggleLogoOptions">Logo de l'entreprise</label>
                                <input id="toggleLogoOptions" class="form-check-input" type="checkbox" role="switch"
                                       checked>
                            </div>
                            <div class="col-sm-12 mb-1">
                                <label for="logoFile">Chargez une photo :</label>
                                <input id="logoFile" type="file" name="logoFile" required="" disabled>
                                <div class="invalid-feedback">Un fichier valide est demandé.</div>
                            </div>

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
                    </div>
                </div>
                <div class="col-lg-8 col-xlg-9 col-md-7">
                    <div class="card shadow mb-5">
                        <div class="card-body">
                            <div class="form-horizontal form-material mx-2">
                                <div class="form-group">
                                    <label class="col-md-12 mb-0">Nom</label>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control ps-0 form-control-line" id="name" name="name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="siret" class="col-md-12">Numéro SIRET</label>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control ps-0 form-control-line" id="siret" name="siret">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="email" class="col-md-12">Email</label>
                                    <div class="col-md-12">
                                        <input type="email" class="form-control ps-0 form-control-line" id="email" name="email">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12 mb-0">Numéro de téléphone fixe</label>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control ps-0 form-control-line" id="phone" name="phone">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12 mb-0">Numéro de téléphone portable</label>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control ps-0 form-control-line" id="mobile" name="mobile">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12 mb-0">Site web</label>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control ps-0 form-control-line" id="website" name="website">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12 mb-0">Adresse postale</label>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control ps-0 form-control-line" id="address" name="address">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="additionalAddress" class="col-md-12 mb-0">Complément d'adresse</label>
                                    <input type="text" class="form-control ps-0 form-control-line" id="additionalAddress" name="additionalAddress">
                                </div>

                                <div class="form-group">
                                    <label class="col-md-12 mb-0">Code postal</label>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control ps-0 form-control-line" id="zipcode" name="zipcode">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="sector" class="col-md-12 mb-0">Secteur d'activité</label>
                                    <textarea class="form-control ps-0 form-control-line" id="sector" name="sector" rows="2"></textarea>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-12" for="prospect">Sélectionner un prospect/client:</label>
                                    <div class="col-sm-12 border-bottom">
                                        <select class="form-select shadow-none my-2 border-0 form-control-line" id="prospect" required name="prospectsIds" multiple style="min-height: 80px">
                                            <option <c:if test="${empty enterprise}">selected</c:if> value="-1">Aucune</option>
                                            <c:forEach items="${prospectList}" var="prospect">
                                                <option <c:if test="${enterprise.prospect==prospect}">selected</c:if> value="${prospect.id}">${prospect.firstName} ${prospect.lastName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group m-2 p-2">
                                    <div class="col-sm-12 d-flex p-2">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                        <button class="btn btn-success mx-auto text-white"
                                                type="submit">Valider</button>
                                        <button class="btn btn-success mx-auto text-white"
                                                type="reset">Annuler</button>
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