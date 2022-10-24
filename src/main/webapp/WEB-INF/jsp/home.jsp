<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="th" uri="http://jakarta.apache.org/taglibs/standard/permittedTaglibs" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="canonical" href="https://www.wrappixel.com/templates/materialpro-lite/" />
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicon.png">
    <link href="css/style.min.css" rel="stylesheet">
    <title>EasyToTask | Home</title>

</head>

<body>

<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
    <header class="topbar">
        <nav class="navbar top-navbar navbar-expand-sm">
            <div class="navbar-header" style="background-color: #1D4851;">
                <a class="navbar-brand ms-4" href="#">
                    <b class="logo-icon">
                        <img src="img/logo.png" alt="homepage" class="dark-logo img-fluid" />

                    </b>
                </a>

            </div>
            <div class="navbar-collapse collapse me-sm-auto" style="background-color: #1D4851;" id="navbarTopbar">
                <ul class="navbar-nav me-auto mt-0">
                    <div class="input-group rounded">
                        <input type="search" class="form-control rounded" placeholder="Rechercher"
                               aria-label="Search" aria-describedby="search-addon" />
                        <span class="input-group-text border-0" id="search-addon">
                                <i class="fas fa-search"></i>
                            </span>
                    </div>
                </ul>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-list-4"
                        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbar-list-4">
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">

                            <a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/users/details/${user.id}" id="navbarDropdownMenuLink" role="button"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                ${user.firstname} ${user.lastname}
                                <img src="${user.pictureUrl}" width="40" height="40" class="rounded-circle">
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="#">Profil</a>
                                <a class="dropdown-item" href="#">Editer le profil</a>
                                <a class="dropdown-item" href="#">Déconnexion</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <aside class="left-sidebar" data-sidebarbg="skin6" style="background-color: #1D4851;">
        <div class="scroll-sidebar">
            <nav class="sidebar-nav">
                <ul id="sidebarnav" style="background-color: #1D4851;">
                    <li>
                        <a href="${pageContext.request.contextPath}/home" data-bs-toggle="collapse" class="nav-link align-items-center mt-3"
                           style="color: #fff">
                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
                                 class="bi bi-clipboard-data" viewBox="0 0 16 16">
                                <path
                                        d="M4 11a1 1 0 1 1 2 0v1a1 1 0 1 1-2 0v-1zm6-4a1 1 0 1 1 2 0v5a1 1 0 1 1-2 0V7zM7 9a1 1 0 0 1 2 0v3a1 1 0 1 1-2 0V9z" />
                                <path
                                        d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z" />
                                <path
                                        d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z" />
                            </svg> <span class="ms-1 d-none d-sm-inline">Dashboard</span></a>
                    </li>

                    <hr>

                    <li>
                        <a href="${pageContext.request.contextPath}/enterprises/all" class="nav-link align-items-center" style="color: #fff">
                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                                 class="bi bi-building" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                      d="M14.763.075A.5.5 0 0 1 15 .5v15a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5V14h-1v1.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V10a.5.5 0 0 1 .342-.474L6 7.64V4.5a.5.5 0 0 1 .276-.447l8-4a.5.5 0 0 1 .487.022zM6 8.694 1 10.36V15h5V8.694zM7 15h2v-1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5V15h2V1.309l-7 3.5V15z" />
                                <path
                                        d="M2 11h1v1H2v-1zm2 0h1v1H4v-1zm-2 2h1v1H2v-1zm2 0h1v1H4v-1zm4-4h1v1H8V9zm2 0h1v1h-1V9zm-2 2h1v1H8v-1zm2 0h1v1h-1v-1zm2-2h1v1h-1V9zm0 2h1v1h-1v-1zM8 7h1v1H8V7zm2 0h1v1h-1V7zm2 0h1v1h-1V7zM8 5h1v1H8V5zm2 0h1v1h-1V5zm2 0h1v1h-1V5zm0-2h1v1h-1V3z" />
                            </svg> <span class="ms-1 d-none d-sm-inline">Gestion entreprises</span></a>
                    </li>

                    <hr>

                    <li>
                        <a href="${pageContext.request.contextPath}/clients/all" data-bs-toggle="collapse" class="nav-link align-items-center"
                           style="color: #fff">
                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                                 class="bi bi-briefcase" viewBox="0 0 16 16">
                                <path
                                        d="M6.5 1A1.5 1.5 0 0 0 5 2.5V3H1.5A1.5 1.5 0 0 0 0 4.5v8A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-8A1.5 1.5 0 0 0 14.5 3H11v-.5A1.5 1.5 0 0 0 9.5 1h-3zm0 1h3a.5.5 0 0 1 .5.5V3H6v-.5a.5.5 0 0 1 .5-.5zm1.886 6.914L15 7.151V12.5a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5V7.15l6.614 1.764a1.5 1.5 0 0 0 .772 0zM1.5 4h13a.5.5 0 0 1 .5.5v1.616L8.129 7.948a.5.5 0 0 1-.258 0L1 6.116V4.5a.5.5 0 0 1 .5-.5z" />
                            </svg> <span class="ms-1 d-none d-sm-inline">Gestion clients</span> </a>
                    </li>

                    <hr>

                    <li>
                        <a href="${pageContext.request.contextPath}/prospects/all" class="nav-link align-items-center" style="color: #fff">
                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
                                 class="bi bi-person" viewBox="0 0 16 16">
                                <path
                                        d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
                            </svg> <span class="ms-1 d-none d-sm-inline">Gestion prospects</span> </a>
                    </li>

                </ul>

            </nav>
        </div>
    </aside>


    <div class="page-wrapper">
        <!--Four cards top + page title-->
        <div class="container-fluid">

            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
            </div>

            <div class="row">

                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                        Prospections restantes</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800 ms-5">${nbProspects}</div>
                                </div>
                                <div class="col-auto">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
                                         fill="currentColor" class="bi bi-people-fill" viewBox="0 0 16 16">
                                        <path
                                                d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
                                        <path fill-rule="evenodd"
                                              d="M5.216 14A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216z" />
                                        <path d="M4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z" />
                                    </svg>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-success shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                        Prospections à relancer</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800 ms-5">${nbRelance}</div>
                                </div>
                                <div class="col-auto">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
                                         fill="currentColor" class="bi bi-bookmark-check" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd"
                                              d="M10.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z" />
                                        <path
                                                d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z" />
                                    </svg>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-success shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">
                                        Nombre de clients</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800 ms-5">${nbClients}</div>
                                </div>
                                <div class="col-auto">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
                                         fill="currentColor" class="bi bi-briefcase" viewBox="0 0 16 16">
                                        <path
                                                d="M6.5 1A1.5 1.5 0 0 0 5 2.5V3H1.5A1.5 1.5 0 0 0 0 4.5v8A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-8A1.5 1.5 0 0 0 14.5 3H11v-.5A1.5 1.5 0 0 0 9.5 1h-3zm0 1h3a.5.5 0 0 1 .5.5V3H6v-.5a.5.5 0 0 1 .5-.5zm1.886 6.914L15 7.151V12.5a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5V7.15l6.614 1.764a1.5 1.5 0 0 0 .772 0zM1.5 4h13a.5.5 0 0 1 .5.5v1.616L8.129 7.948a.5.5 0 0 1-.258 0L1 6.116V4.5a.5.5 0 0 1 .5-.5z" />
                                    </svg>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-success shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                        Nombre d'entreprises</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800 ms-5">${nbEnterprises}</div>
                                </div>
                                <div class="col-auto">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
                                         class="bi bi-building" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd"
                                              d="M14.763.075A.5.5 0 0 1 15 .5v15a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5V14h-1v1.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V10a.5.5 0 0 1 .342-.474L6 7.64V4.5a.5.5 0 0 1 .276-.447l8-4a.5.5 0 0 1 .487.022zM6 8.694 1 10.36V15h5V8.694zM7 15h2v-1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5V15h2V1.309l-7 3.5V15z" />
                                        <path
                                                d="M2 11h1v1H2v-1zm2 0h1v1H4v-1zm-2 2h1v1H2v-1zm2 0h1v1H4v-1zm4-4h1v1H8V9zm2 0h1v1h-1V9zm-2 2h1v1H8v-1zm2 0h1v1h-1v-1zm2-2h1v1h-1V9zm0 2h1v1h-1v-1zM8 7h1v1H8V7zm2 0h1v1h-1V7zm2 0h1v1h-1V7zM8 5h1v1H8V5zm2 0h1v1h-1V5zm2 0h1v1h-1V5zm0-2h1v1h-1V3z" />
                                    </svg>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class=" col-xl-8 col-lg-7 mb-2">

                        <!-- Avancement prospects -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h4 class="m-0 font-weight-bold text-gray-400">Avancement des prospections</h4>
                            </div>
                            <div class="card-body">
                                <h5 class="font-weight-bold mb-3">En cours</h5>
                                <div class="progress mb-4">
                                    <div class="progress-bar bg-warning" role="progressbar" style="width: ${nbProspects/(nbProspects+nbClients)*100}%"
                                         aria-valuenow="${nbProspects}" aria-valuemin="0" aria-valuemax="${nbProspects+nbClients}"></div>
                                </div>
                                <h5 class="font-weight-bold mb-3">A relancer</h5>
                                <div class="progress mb-4">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: ${nbRelace/(nbProspects+nbClients)*100}%"
                                         aria-valuenow="${nbRelance}" aria-valuemin="0" aria-valuemax="${nbProspects+nbClients}"></div>
                                </div>
                                <h5 class="font-weight-bold mb-3">Terminées</h5>
                                <div class="progress mb-4">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: ${nbClients/(nbProspects+nbClients)}%"
                                         aria-valuenow="${nbClients}" aria-valuemin="0" aria-valuemax="${nbProspects+nbClients}"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Contacts-->
                    <div class="col-xl-4 col-lg-5 mb-2">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h4 class="m-0 font-weight-bold text-gray-400"> Contacts en ligne</h4>
                            </div>
                            <div class="card-body">
                                <div class="contact-box">
                                    <div class="contact-widget">
                                        <a href="#" class="d-flex align-items-center">
                                            <div class="user-img mb-0">
                                                <img class="img-circle img-fluid"
                                                     style="min-width: 45px; height:45px;"
                                                     src="https://images.unsplash.com/photo-1542740348-39501cd6e2b4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
                                                     alt="user">
                                            </div>
                                            <div class="mail-content">
                                                <h5 class="mb-0">Maria Sana</h5>
                                                <span class="mail-desc">mariasana@gmail.com</span>
                                            </div>
                                        </a>
                                        <a href="#" class="d-flex align-items-center">
                                            <div class="user-img mb-0">
                                                <img class="img-circle img-fluid"
                                                     style="min-width: 45px; height:45px;"
                                                     src="https://images.unsplash.com/photo-1542740348-39501cd6e2b4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
                                                     alt="user">
                                            </div>
                                            <div class="mail-content">
                                                <h5 class="mb-0">Maria Sana</h5>
                                                <span class="mail-desc">mariasana@gmail.com</span>
                                            </div>
                                        </a>
                                        <a href="#" class="d-flex align-items-center">
                                            <div class="user-img mb-0">
                                                <img class="img-circle img-fluid"
                                                     style="min-width: 45px; height:45px;"
                                                     src="https://images.unsplash.com/photo-1542740348-39501cd6e2b4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
                                                     alt="user">
                                            </div>
                                            <div class="mail-content">
                                                <h5 class="mb-0">Maria Sana</h5>
                                                <span class="mail-desc">mariasana@gmail.com</span>
                                            </div>
                                        </a>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class=" col-xl-12 col-lg-12 mb-5">
                        <!-- Desc -->
                        <div class="card shadow mb-5">
                            <div class="card-header py-3">
                                <h4 class="m-0 font-weight-bold text-gray-400">Descriptif de l'outil</h4>
                            </div>
                            <div class="card-body">
                                <p class="p-3">Bienvenue sur <strong>EasyToTask</strong>, une solution
                                    simple et intuitive pour faciliter votre travail au quotidien. Cet outil a été
                                    conçu pour répondre à tous vos besoins sans perte de temps, de la gestion de vos
                                    clients à vos prospections en cours, communiquez et gérez votre activité comme
                                    vous le souhaitez, depuis votre mobile ou votre PC.
                                    Vos portefeuilles de clients et de prospects sont à portée de main à tout moment. Un
                                    service calendrier vous aide à programmer vos évènements, à gérer vos rendez-vous et à conserver un historique
                                    de vos échanges. <strong>EasyToTask</strong> est là pour vous accompagner dans l’exercice de
                                    votre activité.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <footer class="text-center footer-expand-md fixed-bottom" style="background-color: #F3F3F3;">
                    <div class="p-3 container-fluid d-inline-block">
                        Copyright © EasyToTask 2022
                    </div>
                </footer>
            </div>
        </div>
    </div>
</div>
</body>

</html>