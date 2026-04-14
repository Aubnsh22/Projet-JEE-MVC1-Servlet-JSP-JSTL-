<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Gestion des Produits MVC1</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">

<div class="mb-4">
    Bienvenue, <b>${sessionScope.connectedUser}</b> | 
    <a href="${pageContext.request.contextPath}/logout" class="text-danger">Déconnexion</a>
</div>

<h3>Produits</h3>

<form action="${produitEdit != null ? 'updateProduit' : 'addProduit'}" method="post" class="mb-4">
    <input type="hidden" name="idProduit" value="${produitEdit.IDproduit}">
    <div class="row g-2">
        <div class="col-auto">
            <input type="text" name="nom" class="form-control" placeholder="Nom" value="${produitEdit.nom}" required>
        </div>
        <div class="col-auto">
            <input type="text" name="description" class="form-control" placeholder="Description" value="${produitEdit.description}" required />
        </div>
        <div class="col-auto">
            <input type="text" name="prix" class="form-control" placeholder="Prix" value="${produitEdit.prix}" required />
        </div>
        <div class="col-auto">
            <button type="submit" class="btn btn-primary">${produitEdit != null ? 'Modifier' : 'Ajouter'}</button>
        </div>
    </div>
</form>

<form action='listProduits' method="get" class="mb-4 d-flex gap-2" style="max-width: 300px;">
    <input type="text" name="idProduit" class="form-control" placeholder="Chercher par ID"/>
    <button type="submit" class="btn btn-secondary">Filtrer</button>
</form>

<table class="table">
    <thead>
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Description</th>
            <th>Prix</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="p" items="${listeProduits}">
        <tr>
            <td>${p.IDproduit}</td>
            <td>${p.nom}</td>
            <td>${p.description}</td>
            <td>${p.prix}</td>
            <td>
                <a href="editProduit?id=${p.IDproduit}">Modifier</a> | 
                <a href="deleteProduit?id=${p.IDproduit}" class="text-danger">Supprimer</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
