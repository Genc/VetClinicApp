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

            <div class="h2 text-center">Hayvan Listesi</div>
            <hr/>

            <c:if test="${foundedPets ne null}">
                <div class="alert alert-primary" role="alert">
                    <i class="fas fa-check-circle mr-2"></i> ${foundedPets}
                </div>
            </c:if>

            <c:if test="${successfullyAddedPet ne null}">
                <div class="alert alert-primary" role="alert">
                    <i class="fas fa-check-circle mr-2"></i> ${successfullyAddedPet} ${pet.name} isimli hayvanın
                    <a href="/pet/details/${pet.id}" class="alert-link">profiline git.</a>
                </div>
            </c:if>

            <c:if test="${successfullyUpdatedPet ne null}">
                <div class="alert alert-primary" role="alert">
                    <i class="fas fa-check-circle mr-2"></i> ${successfullyUpdatedPet}
                </div>
            </c:if>

            <c:if test="${successfullyDeletedPet ne null}">
                <div class="alert alert-primary" role="alert">
                    <i class="fas fa-check-circle mr-2"></i> ${successfullyDeletedPet}
                </div>
            </c:if>

            <c:if test="${notFoundPet ne null}">
                <div class="alert alert-danger" role="alert">
                    <i class="fa fa-exclamation-triangle mr-2"></i> ${notFoundPet}
                </div>
            </c:if>

            <c:if test="${petList.size() eq 0}">
                <div class="alert alert-danger" role="alert">
                    <i class="fa fa-exclamation-triangle mr-2"></i>
                    <c:out value="Sistemde şuanda kayıtlı hayvan bulunmamaktadır." />
                </div>
            </c:if>

            <c:if test="${petList.size() ne 0}">
            <div class="table-responsive">
                <table id="example" class="table table-bordered">
                    <thead class="thead-light">
                    <tr>
                        <th>İsim</th>
                        <th>Yaş</th>
                        <th>Cins</th>
                        <th>Tür</th>
                        <th>Sahip Bilgisi</th>
                        <th>Detay</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${petList}" var="pet">
                        <tr>
                            <td><c:out value="${pet.name}"/></td>
                            <td><c:out value="${pet.age}"/></td>
                            <td><c:out value="${pet.species}"/></td>
                            <td><c:out value="${pet.breed}"/></td>

                            <c:if test="${pet.owner.id eq null}">
                                <td><c:out value="Herhangi bir sahip bulunamadı!"/> </td>
                            </c:if>

                            <c:if test="${pet.owner.id ne null}">
                                <td><a href="/owner/details/${pet.owner.id}" class="text-decoration-underline">
                                    <c:out value="${pet.owner.name} ${pet.owner.surname}"/></a> </td>
                            </c:if>

                            <td><a href="/pet/details/${pet.id}" class="btn btn-info btn-sm btn-examine">İncele</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            </c:if>
        </div>
    </div>

    <script src="/js/custom/jquery-3.3.1.slim.min.js" type="text/javascript"></script>
    <script src="/js/custom/popper.min.js" type="text/javascript"></script>
    <script src="/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
    <script src="/js/custom/common.js" type="text/javascript"></script>

</body>
</html>
