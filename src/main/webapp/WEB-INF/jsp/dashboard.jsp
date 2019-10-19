<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: faruk
  Date: 12.10.2019
  Time: 00:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="/css/bootstrap/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="/css/custom/sidebar.css" rel="stylesheet" type="text/css"/>
    <link href="/css/custom/card.css" rel="stylesheet" type="text/css"/>

    <script src="/js/fontawesome/solid.js" type="text/javascript"></script>
    <script src="/js/fontawesome/fontawesome.js" type="text/javascript"></script>
    <title>VetApp</title>
</head>
<body class="bg-custom">

<div class="wrapper">
    <!-- Sidebar  -->
    <nav id="sidebar">
        <div class="sidebar-header text-center text-decoration-underline">
            <a href="/dashboard" class="h3">VetApp</a>
        </div>
        <hr/>
        <ul class="list-unstyled components">
            <li>
                <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Sahiplik
                    İşlemleri</a>
                <ul class="collapse list-unstyled" id="homeSubmenu">
                    <li>
                        <a href="/owner/add">Hayvan Sahibi Ekle</a>
                    </li>
                    <li>
                        <a href="/owner/search">Hayvan Sahibi Ara</a>
                    </li>
                    <li>
                        <a href="/owner/owners">Hayvan Sahibi Listesi</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Hayvan
                    İşlemleri</a>
                <ul class="collapse list-unstyled" id="pageSubmenu">
                    <li>
                        <a href="/pet/add">Yeni Hayvan Ekle</a>
                    </li>
                    <li>
                        <a href="/pet/search">Hayvan Ara</a>
                    </li>
                    <li>
                        <a href="/pet/pets">Hayvan Listesi</a>
                    </li>
                </ul>
            </li>
        </ul>

        <ul class="list-unstyled CTAs">
            <li>
                <form action="logout" method="post">
                    <a href="/logout" class="download">Çıkış yap</a>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                </form>
            </li>
        </ul>
    </nav>

    <!-- Page Content  -->
    <div id="content">

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">

                <button type="button" id="sidebarCollapse" class="btn btn-info">
                    <i class="fas fa-bars"></i>
                </button>
                <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-align-justify"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">

                    <ul class="nav navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="/dashboard">Ana sayfa</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/owner/owners">Hayvan Sahip Listesi</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/pet/pets">Hayvanları Görüntüle</a>
                        </li>
                        <form action="logout" method="post">
                            <li class="nav-item ml-3 mt-1">
                                <a href="/logout" class="btn btn-sm btn-outline-danger">Çıkış yap</a>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                            </li>
                        </form>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">

            <c:if test="${welcomeInfoMessage ne null}">

                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <strong>Hoş geldin ${username}!</strong> ${welcomeInfoMessage}
                </div>

            </c:if>


            <h2 class="text-center">Sistem İstatislikleri</h2>
            <hr/>
            <div class="row mb-3">
                <div class="col-sm-6 py-2 col-lg-4">
                    <div class="card bg-success text-white h-100">
                        <div class="card-body bg-success">
                            <div class="rotate">
                                <i class="fa fa-users fa-3x"></i>
                            </div>
                            <h6 class="text-uppercase">HAYVAN SAHİBİ SAYISI</h6>
                            <h1 class="display-4">${totalOwners}</h1>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 py-2 col-lg-4">
                    <div class="card text-white bg-danger h-100">
                        <div class="card-body bg-danger">
                            <div class="rotate">
                                <i class="fa fa-paw fa-3x"></i>
                            </div>
                            <h6 class="text-uppercase">HAYVAN SAYISI</h6>
                            <h1 class="display-4">${totalPets}</h1>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 py-2 col-lg-4">
                    <div class="card text-white bg-warning h-100">
                        <div class="card-body">
                            <div class="rotate">
                                <i class="fa fa-user-tie fa-3x"></i>
                            </div>
                            <h6 class="text-uppercase">KULLANICI SAYISI</h6>
                            <h1 class="display-4">${totalUsers}</h1>
                        </div>
                    </div>
                </div>


            </div>
            <!--/row-->

            <hr/>
        </div>

    </div>
</div>

<script src="/js/custom/jquery-3.3.1.slim.min.js" type="text/javascript"></script>
<script src="/js/custom/popper.min.js" type="text/javascript"></script>
<script src="/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<script src="/js/custom/common.js" type="text/javascript"></script>

</body>
</html>