<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <header class="topbar">
        <nav class="navbar top-navbar navbar-expand-sm"  style="background-color: #1D4851;">
            <div class="navbar-header">
                <a class="navbar-brand ms-4" href="${pageContext.request.contextPath}/home">
                    <b class="logo-icon">
                        <img src="../../img/logo.png" alt="homepage" class="dark-logo img-fluid" />
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
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-item text-white" href="${pageContext.request.contextPath}/users/details/${currentUser.id}" id="navbarProfil" role="button">
                                ${currentUser.firstname} ${currentUser.lastname}
                                <img src="${currentUser.pictureUrl}"
                                     width="40" height="40" class="rounded-circle">
                            </a>
                        </li>
                    </ul>

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

                    <hr>

                    <li>
                        <c:if test="${currentUser.isAdmin}">
                        <a href="${pageContext.request.contextPath}/users/all" class="nav-link align-items-center" style="color: #fff">
                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                                <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                            </svg> <span class="ms-1 d-none d-sm-inline">Gestion utilisateurs</span> </a>
                        </c:if>
                    </li>

                    <hr>

                    <li>
                        <!--Déco mapping à compléter-->
                        <sec:authorize access="!isAuthenticated()">
                            <form:form action="/signin" method="get">
                                <button type="submit">Login</button>
                            </form:form>
                        </sec:authorize>
                        <sec:authorize access="isAuthenticated()">
                            <form:form action="/logout" method="post">
                                <button class="btn align-items-center" style="color: #ffe500" type="submit"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>
                                    <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
                                </svg><span class="ms-2 d-none d-sm-inline">Déconnexion</span></button>
                            </form:form>
                        </sec:authorize>
                        <%--<a href="${pageContext.request.contextPath}/" class="nav-link align-items-center" style="color: #ffe500">
                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>
                                <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
                            </svg><span class="ms-2 d-none d-sm-inline">Déconnexion</span> </a>--%>
                    </li>
                </ul>
            </nav>
        </div>
    </aside>

