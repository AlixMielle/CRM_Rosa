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
    <title>EasyToTask | Ajout d'une note</title>
</head>

<body>
<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
    <jsp:include page="../header.jsp"/>

    <div class="page-wrapper">
        <div class="container-fluid">
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">Création d'une note</h1>
            </div>

            <div class="row justify-content-center text-center">
                <div class="col-12 col-sm-8 col-md-7 col-lg-6 col-xl-4">
                    <div class="bloc">
                        <div class="card shadow p-5" style="background-color: #1D4851">
                            <form action="${pageContext.request.contextPath}/notes<c:choose><c:when test="${empty note}">/add</c:when><c:otherwise>/edit</c:otherwise></c:choose>"
                                  method="post">
                                <c:if test="${!empty note}"><input hidden type="text" name="idNote"
                                                                   value="${note.id}" required></c:if>
                                <input hidden type="text" name="idProspect" id="idProspect" value="${idProspect}">
                                <div class="form-outline mb-4">
                                    <label for="content" class="text-white">Intitulé de la note</label>
                                    <input type="text" name="title" id="title" class="form-control"
                                           <c:if test="${!empty note}">value="${note.title}"</c:if>>
                                </div>

                                <div class="form-outline mb-4">
                                    <label for="content" class="text-white">Message</label>
                                    <textarea type="textarea" name="content" id="content" class="form-control"
                                              placeholder="Saisissez votre note"
                                              <c:if test="${!empty note}">value="${note.content}"</c:if>>${note.content}</textarea>

                                </div>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

                                <div>
                                    <button class="btn btn-light text-dark" type="submit"><c:choose><c:when
                                            test="${empty note}">Créer la note</c:when><c:otherwise>Modifier la note</c:otherwise></c:choose></button>
                                    <a class="btn btn-light text-dark"
                                       href="${pageContext.request.contextPath}/notes/${idProspect}">Retour à la
                                        liste</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>