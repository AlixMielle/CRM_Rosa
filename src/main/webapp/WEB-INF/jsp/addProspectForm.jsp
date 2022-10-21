<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <title>Ajout de prospect</title>
</head>
<body>

<div><a href="${pageContext.request.contextPath}/prospects/all">Accueil</a></div>

<div>
    <form action="${pageContext.request.contextPath}/prospects<c:choose><c:when test="${empty prospect}">/add</c:when><c:otherwise>/edit</c:otherwise></c:choose>" method="post">
        <c:if test="${!empty prospect}"><input hidden type="text" name="id" value="${prospect.id}"></c:if>
        <div>
            <label for="firstName">Prenom:</label>
            <input type="text" name="firstName" id="firstName" <c:if test="${!empty prospect}">value="${prospect.firstName}"</c:if>>
        </div>
        <div>
            <label for="lastName">Nom de famille:</label>
            <input type="text" name="lastName" id="lastName" <c:if test="${!empty prospect}">value="${prospect.lastName}"</c:if>>
        </div>
        <div>
            <label for="profilePictureUrl">Lien de photo:</label>
            <input type="text" name="profilePictureUrl" id="profilePictureUrl" <c:if test="${!empty prospect}">value="${prospect.profilePictureUrl}"</c:if>>
        </div>
        <div>
            <label for="mobilePhone">Telephone portable:</label>
            <input type="text" name="mobilePhone" id="mobilePhone" <c:if test="${!empty prospect}">value="${prospect.mobilePhone}"</c:if>>
        </div>
        <div>
            <label for="landlinePhone">Telephone fixe:</label>
            <input type="text" name="landlinePhone" id="landlinePhone" <c:if test="${!empty prospect}">value="${prospect.landlinePhone}"</c:if>>
        </div>
        <div>
            <label for="email">Adresse email:</label>
            <input type="text" name="email" id="email" <c:if test="${!empty prospect}">value="${prospect.email}"</c:if>>
        </div>

        <div>
            <label for="enterprise">Entreprise:</label>
            <select class="form-select" id="enterprise" required name="enterpriseId">
                <option <c:if test="${empty prospect}">selected</c:if> value="-1">Aucune</option>
                <c:forEach items="${enterprises}" var="enterprise">
                    <option <c:if test="${prospect.enterprise==enterprise}">selected</c:if> value="${enterprise.id}">${enterprise.name}</option>
                </c:forEach>
            </select>
        </div>

        <div>
            <label for="jobTitle">Titre de travail:</label>
            <input type="text" name="jobTitle" id="jobTitle" <c:if test="${!empty prospect}">value="${prospect.jobTitle}"</c:if>>
        </div>

        <div>
            <c:choose>
                <!--When adding a Client the prospectionStatus is necessarily CLIENT-->
                <c:when test="${addingClient}">
                    <input type="text" name="prospectionStatus" value="CLIENT" hidden>
                </c:when>
                <c:otherwise>
                    <label for="prospectionStatus">Status de prospection:</label>
                    <select class="form-select" id="prospectionStatus" required name="prospectionStatus">
                        <c:forEach items="${prospectionStatuses}" var="prospectionStatus">
                            <option <c:if test="${prospect.prospectionStatus==prospectionStatus}">selected</c:if> value="${prospectionStatus}">${prospectionStatus}</option>
                        </c:forEach>
                    </select>
                </c:otherwise>
            </c:choose>
        </div>


        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

        <div>
            <button type="submit"><c:choose><c:when test="${empty prospect}">Ajout</c:when><c:otherwise>Mise a jour</c:otherwise></c:choose></button>
        </div>
    </form>
</div>

</body>
</html>