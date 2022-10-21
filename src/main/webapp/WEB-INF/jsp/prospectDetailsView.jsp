<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!doctype html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <title>Details contact</title>
</head>
<body>

<h1>Contact details</h1>
<div><img src="${prospect.profilePictureUrl}" class="max-width=500px max-height=500px"></div>
<div>Prenom: ${prospect.firstName}</div>
<div>Nom de famille: ${prospect.lastName}</div>
<div>Email: ${prospect.email}</div>
<div>Telephone portable: ${prospect.mobilePhone}</div>
<div>Telephone fixe: ${prospect.landlinePhone}</div>
<div>Prospection status: ${prospect.prospectionStatus}</div>

<c:if test="${isDeleteForm}">
    <div>
        <form action="${pageContext.request.contextPath}/prospects/delete/${prospect.id}" method="post">
            <input id="id" name="id" type="text" value="${prospect.id}" required hidden=/>
            <div>Etes vous sur de vouloir supprimer ce prospect?</div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <button type="submit">Oui</button>
        </form>
    </div>
</c:if>
<div><a href="${pageContext.request.contextPath}/prospects/all">Retour</a></div>

</body>
</html>