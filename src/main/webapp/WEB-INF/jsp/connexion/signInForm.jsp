<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="fr">

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
    <title>EasyToTask | Connexion</title>
</head>
<body style="background-color: #1D4851">
<section id="section1" class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-12 col-sm-8 col-md-7 col-lg-6 col-xl-4">
            <div class="bloc">
                <img src="img/logo.png" alt="logo" class="img-fluid mt-5 mb-5 mx-auto d-block">
                <h5 class="mb-5 text-center" style="color: #ffff;">Connectez-vous à EasyToTask </h5>
                </p>

                <div class="py-2 container">
                    <form action="${pageContext.request.contextPath}/signin" method="post">
                        <div class="form-outline mb-4">
                            <input type="email" name="email" id="email" placeholder="Email" class="form-control" required>
                        </div>
                        <div class="form-outline mb-4">
                            <input type="password" name="password" id="password" placeholder="Mot de passe" class="form-control" required>
                        </div>
                        <div class="text-center mb-4">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                            <button type="submit" class="btn my-2 text-dark" style="background-color: gold">Se connecter</button>
                        </div>
                        <div class="text-center mb-4">
                            <p class="text-white mb-4"> Nouvel utilisateur ? <a style="text-decoration: none; color: gold;" href="${pageContext.request.contextPath}/signup">Créer un compte</a> </p>

                        </div>
                    </form>
                </div>

            </div>
    </div>
    </div>
</section>

<jsp:include page="../footer.jsp"/>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</body>
</html>