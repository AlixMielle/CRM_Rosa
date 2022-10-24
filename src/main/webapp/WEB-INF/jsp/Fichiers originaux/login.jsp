<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="login.css">
    <title>EasyToTask | Login</title>
</head>


<body style="background-color: #1D4851">
<section id="section1" class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-12 col-sm-8 col-md-7 col-lg-6 col-xl-4">
            <div class="bloc">
                <form>

                    <div>
                        <img src="img/logo.png" alt="logo" class="img-fluid mt-5 mb-5 mx-auto d-block">
                        <h5 class="mb-5 text-center" style="color: #ffff;">Connectez-vous :</h5>
                    </div>
                    <!-- Email input -->
                    <div class="form-outline mb-4">
                        <input type="email" id="form2Example1" class="form-control" placeholder="Adresse email" />

                    </div>

                    <!-- Password input -->
                    <div class="form-outline mb-4">
                        <input type="password" id="form2Example2" class="form-control" placeholder="Mot de passe" />
                    </div>

                    <!-- Register buttons -->
                    <div class="text-center">
                        <p style="color: #ffff;">Nouvel utilisateur?
                            <br>
                            <a style="text-decoration: none; color: #F3F3F3;" href="#!">Créer un compte</a>
                        </p>
                    </div>
            </div>

            <div class="text-center">
                <!-- Submit button -->
                <button type="button" class="btn text-light btn-block m-5 border-0"
                        style="background-color: #689BAE">Connexion</button>
            </div>
            </form>
        </div>
    </div>
</section>

<footer class="text-center footer-expand-md fixed-bottom" style="background-color: #F3F3F3;">
    <div class="p-4 container-fluid d-inline-block">
        Copyright © EasyToTask 2022
    </div>
</footer>

</body>

</html>