<%--
  Created by IntelliJ IDEA.
  User: faruk
  Date: 12.10.2019
  Time: 00:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="/css/bootstrap/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="/css/custom/sidebar.css" rel="stylesheet" type="text/css"/>

    <script src="/js/fontawesome/solid.js" type="text/javascript"></script>
    <script src="/js/fontawesome/fontawesome.js" type="text/javascript"></script>
    <title>VetApp</title>
</head>
<body class="bg-custom">

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Emin Misininiz?</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <span>Hayvan sahibini sildiğinizde, sahip olduğu hayvanlarda silinecektir. </span>
                <span>Hayvan sahibini ve hayvanları <span
                        class="text-danger font-weight-bold text-decoration-underline">kalıcı olarak</span> silmek istediğinize emin misiniz ?
                </span>

            </div>
            <form action="/owner/delete/${ownerInformation.id}" method="post">
                <div class="modal-footer">
                    <button type="button" class="btn btn-info" data-dismiss="modal">Vazgeç</button>
                    <button type="submit" class="btn btn-danger">Sil</button>
                    <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
                </div>
            </form>
        </div>
    </div>
</div>


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

        <div class="owner-detail">
            <div class="card">
                <div class="text-center">
                    <h5 class="card-header"> Hayvan Sahibi Bilgileri
                        <a class="btn btn-primary btn-sm text-light ml-3" href="/owner/update/${ownerInformation.id}">Düzenle</a>
                    </h5>
                </div>

                <div class="card-body">
                    <div class="mt-2">
                        <div class="row">

                            <div class="col-lg-6 col-sm-12">
                                <span class="card-text"><i class="fa fa-user mr-2"></i><span
                                        class="font-weight-bold">İsim Soyisim:</span> ${ownerInformation.name} ${ownerInformation.surname}</span>
                            </div>
                            <div class="col-lg-6 col-sm-12">
                                <span class="card-text"><i class="fa fa-envelope mr-2"></i><span
                                        class="font-weight-bold">Mail adresi:</span> ${ownerInformation.mail}</span>
                            </div>
                            <div class="col-lg-6 col-sm-12 mt-2">
                                <span class="card-text mr-2"><i class="fa fa-phone"></i> <span
                                        class="font-weight-bold">Telefon numarası:</span> ${ownerInformation.phoneNumber}</span>
                            </div>
                            <div class="col-lg-6 col-sm-12 mt-2">
                                <span class="card-text"><i class="fa fa-map-marker-alt mr-1"></i> <span
                                        class="font-weight-bold">Adres bilgisi:</span> ${ownerInformation.address}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <hr/>

            <!-- PETS SECTION START -->

            <div class="card mt-3">
                <div class="text-center">
                    <h5 class="card-header">
                        <span> Sahip olduğu hayvanlar </span>
                    </h5>
                </div>
                <div class="card-body">
                    <c:if test="${notPets ne null}">
                        <div class="alert alert-danger text-center" role="alert">
                            <i class="fa fa-exclamation-triangle mr-2"></i> ${notPets}
                        </div>
                    </c:if>
                    <div class="row">
                        <c:forEach items="${ownerInformation.pets}" var="pet">
                            <div class="col-lg-6">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">${pet.name}
                                            <a href="/pet/details/${pet.id}" class="btn btn-secondary btn-sm ml-2 float-right">İncele</a>
                                        </h5>
                                        <hr/>
                                            <div class="row">

                                                <div class="col-sm-6 col-lg-3">
                                                    <span class="font-weight-bold"> Cinsi: </span>
                                                </div>

                                                <div class="col-sm-6 col-lg-3">
                                                        ${pet.breed}
                                                </div>

                                                <div class="col-sm-6 col-lg-3">
                                                    <span class="font-weight-bold"> Türü: </span>
                                                </div>

                                                <div class="col-sm-6 col-lg-3">
                                                        ${pet.species}
                                                </div>

                                                <div class="col-sm-6 col-lg-3">
                                                    <span class="font-weight-bold"> Yaşı: </span>
                                                </div>

                                                <div class="col-sm-6 col-lg-3">
                                                        ${pet.age}
                                                </div>

                                            </div>

                                        <div class="row mt-2">
                                            <div class="col-lg-12 col-sm-12">
                                                <span class="font-weight-bold">Açıklama: </span> ${pet.description} </span>
                                            </div>
                                        </div>

                                        </p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <!-- PETS SECTION END -->

            <hr/>

            <!-- ACTION SECTION START -->
            <c:if test="${admin ne null}">
                <div class="row">
                    <div class="col-lg-12 col-sm-12 text-center">
                        <a href="#myModal" data-toggle="modal" class="btn btn-danger text-white">
                            Hayvan Sahibini Kalıcı Olarak Sil
                        </a>
                    </div>
                </div>
            </c:if>

            <!-- ACTION SECTION END -->
        </div>

        <script src="/js/custom/jquery-3.3.1.slim.min.js" type="text/javascript"></script>
        <script src="/js/custom/popper.min.js" type="text/javascript"></script>
        <script src="/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
        <script src="/js/custom/common.js" type="text/javascript"></script>

</body>
</html>
