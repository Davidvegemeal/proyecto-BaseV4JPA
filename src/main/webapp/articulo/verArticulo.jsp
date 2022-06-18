<%-- 
    Document   : verArticulo
    Created on : 15/06/2022, 07:16:22 PM
    Author     : meza_
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
        <title>Datos de Articulo</title>
    </head>
    <body>
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">Navbar</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="ArticuloServlet?accion=listaArticulo">Listado de articulo</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="mb-3"></div>
            <div class="card text-primary">
                <div class="card-header">
                    <div class="card-title text-center">
                        Datos de articulo
                    </div>
                </div>
                <div class="card-body">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <c:out value="${categoria.entidad.idArticulo}" />
                        </li>
                        <li class="list-group-item">
                            <c:out value="${categoria.entidad.nombreArticulo}" />
                        </li>
                        <li class="list-group-item">
                            <c:out value="${categoria.entidad.descripcionArticulo}" />
                        </li>
                        <li class="list-group-item">
                            <c:out value="${categoria.entidad.existencias}" />
                        </li>
                        <li class="list-group-item">
                            <c:out value="${categoria.entidad.stockMinimo}" />
                        </li>
                        <li class="list-group-item">
                            <c:out value="${categoria.entidad.stockMaximo}" />
                        </li>
                        <li class="list-group-item">
                            <c:out value="${categoria.entidad.precio}" />
                        </li>
                        <li class="list-group-item">
                            <c:out value="${categoria.entidad.idCategoria}" />
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>
