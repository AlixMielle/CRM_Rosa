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
    <title>EasyToTask | Liste des notes</title>

    <style>
        @media screen and (max-width: 560px) {
            .left-sidebar {
                max-width: 100px;
            }
            .page-wrapper {
                margin-left: 100px !important;
            }
        }
    </style>
</head>

<body>
<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
    <jsp:include page= "../header.jsp"/>

        <div class="page-wrapper">
            <div class="container-fluid min-vh-100">
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">Liste des notes</h1>
                </div>
                <div class="form-group m-2 p-2">
                    <div class="col-sm-12 d-flex p-2">
                        <a href="${pageContext.request.contextPath}/notes/add/${idProspect}" class="btn btn-success mx-auto text-white">Créer une note</a>
                    </div>
                </div>

                    <c:forEach items="${notes}" var="note">
                    <div class="card text-center shadow">
                        <div class="card-header">${note.title}</div>
                        <div class="card-body">
                            <h5 class="card-title">${note.createdAt}</h5>
                            <p class="card-text">${note.content}</p>
                            <a href="${pageContext.request.contextPath}/notes/${idProspect}/${note.id}" class="btn btn-primary" style="background-color: darkslategray">Voir le détail</a>
                            <a href="${pageContext.request.contextPath}/notes/edit/${note.id}" class="btn btn-primary" style="background-color: darkslategray">Modifier</a>
                        </div>
                    </div>
                    </c:forEach>

            </div>
        </div>
    <jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>