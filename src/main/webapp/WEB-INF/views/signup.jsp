<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("connectedUser") != null) {
        response.sendRedirect(request.getContextPath() + "/listProduits");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Créer un compte</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">

<div style="max-width: 400px;">
    <h2>S'inscrire</h2><br>

    <% if (request.getAttribute("signupError") != null) { %>
        <div class="alert alert-danger p-2">
            <%= request.getAttribute("signupError") %>
        </div>
    <% } %>

    <form action="${pageContext.request.contextPath}/signup" method="post">
        <div class="mb-3">
            <label>Nom d'utilisateur</label>
            <input type="text" name="username" class="form-control" required />
        </div>
        <div class="mb-3">
            <label>Mot de passe</label>
            <input type="password" name="password" class="form-control" required />
        </div>
        <button type="submit" class="btn btn-primary">Créer le compte</button>
    </form>

    <br>
    <a href="${pageContext.request.contextPath}/login">Retour à la connexion</a>
</div>

</body>
</html>