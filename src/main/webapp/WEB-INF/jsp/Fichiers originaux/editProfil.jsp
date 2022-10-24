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
    <title>EasyToTask | Editer mon profil</title>
</head>

<body>
<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
    <jsp:include page="../header.jsp"/>


    <div class="page-wrapper">
        <div class="container-fluid">

            <div class="d-sm-flex align-items-center justify-content-between mb-2">
                <h1 class="h3 mb-0 text-gray-800">Editer mon profil</h1>
            </div>
            <div class="row">
                <div class="col-lg-4 col-xlg-3 col-md-5">
                    <div class="card shadow">
                        <div class="card-body profile-card">
                            <center class="mt-4"> <img
                                    src="https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"
                                    class="rounded-circle img-fluid" width="150" />
                                <h4 class="card-title mt-2">John Doe</h4>
                                <h6 class="card-subtitle">Formateur</h6>
                                <div class="row text-center justify-content-center">
                                </div>
                            </center>
                        </div>


                        <div class="card-footer bg-dark text-white">
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
                    </div>

                </div>


                <div class="col-lg-8 col-xlg-9 col-md-7">
                    <div class="card shadow mb-5">
                        <div class="card-body">
                            <form class="form-horizontal form-material mx-2">
                                <div class="form-group">
                                    <label class="col-md-12 mb-0">Prénom Nom</label>
                                    <div class="col-md-12">
                                        <input type="text" placeholder="John Doe"
                                               class="form-control ps-0 form-control-line">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="example-email" class="col-md-12">Email</label>
                                    <div class="col-md-12">
                                        <input type="email" placeholder="johnathan@admin.com"
                                               class="form-control ps-0 form-control-line" name="example-email"
                                               id="example-email">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12 mb-0">Mot de passe</label>
                                    <div class="col-md-12">
                                        <input type="password" value="password"
                                               class="form-control ps-0 form-control-line">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12 mb-0">Numéro de téléphone fixe</label>
                                    <div class="col-md-12">
                                        <input type="text" placeholder="123 456 7890"
                                               class="form-control ps-0 form-control-line">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12 mb-0">Numéro de téléphone portable</label>
                                    <div class="col-md-12">
                                        <input type="text" placeholder="123 456 7890"
                                               class="form-control ps-0 form-control-line">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12 mb-0">Adresse postale</label>
                                    <div class="col-md-12">
                                        <input type="text" placeholder="18 rue de la forêt"
                                               class="form-control ps-0 form-control-line">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-12">Sélectionner une ville</label>
                                    <div class="col-sm-12 border-bottom">
                                        <select class="form-select shadow-none ps-0 border-0 form-control-line">
                                            <option>Nantes</option>
                                            <option>Lille</option>
                                            <option>Marseille</option>
                                            <option>Béthune</option>
                                            <option>Saint-Fort</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12 mb-0">Code postal</label>
                                    <div class="col-md-12">
                                        <input type="text" placeholder="53216"
                                               class="form-control ps-0 form-control-line">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12 mb-0">Entreprise</label>
                                    <div class="col-md-12">
                                        <input type="text" placeholder="DoesandDeers"
                                               class="form-control ps-0 form-control-line">
                                    </div>
                                </div>

                                <div class="form-group m-2 p-2">
                                    <div class="col-sm-12 d-flex p-2">
                                        <button class="btn btn-success mx-auto text-white"
                                                type="submit">Valider</button>
                                        <button class="btn btn-success mx-auto text-white"
                                                type="submit">Retour</button>
                                    </div>
                                </div>
                            </form>
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