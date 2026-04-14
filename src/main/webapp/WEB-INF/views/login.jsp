<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    if (session.getAttribute("connectedUser") != null) {
        response.sendRedirect(request.getContextPath() + "/listProduits");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Connexion</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">

<div style="max-width: 400px;">
    <h2>Connexion</h2><br>

    <c:if test="${not empty loginError}">
        <div class="alert alert-danger p-2">${loginError}</div>
    </c:if>
    <c:if test="${not empty sessionScope.successMessage}">
        <div class="alert alert-success p-2">${sessionScope.successMessage}</div>
        <c:remove var="successMessage" scope="session"/>
    </c:if>

    <form action="login" method="post">
        <div class="mb-3">
            <label>Nom d'utilisateur</label>
            <input type="text" name="username" class="form-control" required />
        </div>
        <div class="mb-3">
            <label>Mot de passe</label>
            <input type="password" name="password" class="form-control" required />
        </div>
        <button type="submit" class="btn btn-primary">Se connecter</button>
    </form>

    <br>
    <p class="text-muted">Comptes de test : admin / teacher</p>
    <a href="${pageContext.request.contextPath}/signup">S'inscrire</a>
</div>

</body>
</html>
