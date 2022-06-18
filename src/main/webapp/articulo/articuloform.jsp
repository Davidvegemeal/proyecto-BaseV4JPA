<%-- 
    Document   : articuloform
    Created on : 15/06/2022, 07:15:47 PM
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
        <title>Categoria Form</title>
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
                                <a class="nav-link" href="ArticuloServlet?accion=listaArticulo">Listado de articulos</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="mb-3"></div>
            <div class="card text-primary">
                <div class="card-header">
                    <div class="card-title text-center">
                        Formulario para datos de articulo
                    </div>
                </div>
                <div class="card-body">
                    <form action="ArticuloServlet?accion=guardar" method="post">
                        <c:choose>
                            <c:when test="${dto.entidad.idArticulo == null}">
                                <div class="mb-3">
                                    <label for="txtIdA" class="form-label">ID articulo</label>
                                    <input type="text" class="form-control" id="txtIdA"
                                           placeholder="Nombre del articulo" name="txtIdA"
                                           disabled value="0">
                                </div>
                                <input type="hidden" name="txtId" value="0">
                            </c:when>
                            <c:otherwise>
                                <div class="mb-3">
                                    <label for="txtIdA" class="form-label">ID articulo</label>
                                    <input type="text" class="form-control" id="txtIdA"
                                           placeholder="Nombre del articulo" name="txtIdA"
                                           required value="${dto.entidad.idArticulo}">
                                </div>
                            </c:otherwise>
                        </c:choose>
                        <div class="mb-3">
                            <label for="txtNombre" class="form-label">Nombre Articulo</label>
                            <input type="text" class="form-control" id="txtNombre"
                                   placeholder="Nombre del articulo" name="txtNombre"
                                   required value="${dto.entidad.nombreArticulo}">
                        </div>
                        <div class="mb-3">
                            <label for="txtDescripcion" class="form-label">Descripcion del articulo</label>
                            <input type="text" class="form-control" id="txtDescripcion"
                                   placeholder="Descripcion del articulo" name="txtDescripcion" 
                                   required value="${dto.entidad.descripcionArticulo}">
                        </div>
                        <div class="mb-3">
                            <label for="txtExis" class="form-label">Existencia del articulo</label>
                            <input type="text" class="form-control" id="txtExis"
                                   placeholder="Existencia del articulo" name="txtExis" 
                                   required value="${dto.entidad.existencias}">
                        </div>
                        <div class="mb-3">
                            <label for="txtStockMi" class="form-label">Stock minimo</label>
                            <input type="text" class="form-control" id="txtStockMi"
                                   placeholder="Stock minimo" name="txtStockMi" 
                                   required value="${dto.entidad.stockMinimo}">
                        </div>
                        <div class="mb-3">
                            <label for="txtStockMa" class="form-label">Stock maximo</label>
                            <input type="text" class="form-control" id="txtStockMa"
                                   placeholder="Stock maximo" name="txtStockMa" 
                                   required value="${dto.entidad.stockMaximo}">
                        </div>
                        <div class="mb-3">
                            <label for="txtPrecio" class="form-label">Precio del articulo</label>
                            <input type="text" class="form-control" id="txtPrecio"
                                   placeholder="Precio del articulo" name="txtPrecio" 
                                   required value="${dto.entidad.precio}">
                        </div>
                        <div class="mb-3">
                            <label for="txtIdcate" class="form-label">ID categoria</label>
                            <input type="text" class="form-control" id="txtIdcate"
                                   placeholder="ID categoria" name="txtIdcate" 
                                   required value="${dto.entidad.idCategoria}">
                        </div>
                        <div class="mb-3">
                            <input type="submit" class="btn btn-outline-primary" value="Registrar" id="btnEnviar" placeholder="Descripcion del articulo" name="btnEnviar" requiredd>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

