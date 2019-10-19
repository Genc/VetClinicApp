<%--
  Created by IntelliJ IDEA.
  User: faruk
  Date: 12.10.2019
  Time: 00:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="/css/bootstrap/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="/css/custom/sidebar.css" rel="stylesheet" type="text/css"/>
    <link href="/css/custom/customform.css" rel="stylesheet" type="text/css"/>

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

            <form:form modelAttribute="owner">

                <div class="form-signin">

                    <div class="text-center mb-4">
                        <h1 class="h3 mb-3 font-weight-normal">Yeni Hayvan Sahibi Ekle</h1>
                    </div>

                    <div class="form-row">
                        <div class="form-label-group col-6">
                            <form:input path="name" id="inputName" cssClass="form-control" placeholder="İsim"
                                        type="text"></form:input>
                            <label for="inputName">İsim</label>
                            <form:errors path="name" cssClass="form-text text-danger"></form:errors>
                        </div>
                        <div class="form-label-group col-6">
                            <form:input path="surname" id="inputSurname" cssClass="form-control" placeholder="Soyisim"
                                        type="text"></form:input>
                            <label for="inputSurname">Soyisim</label>
                            <form:errors path="surname" cssClass="form-text text-danger"></form:errors>
                        </div>
                    </div>

                    <div class="form-label-group">
                        <form:input path="mail" id="inputMail" cssClass="form-control" placeholder="E-mail adresiniz"
                                    title="Lütfen mail adresini doğru formatta giriniz." type="email"></form:input>
                        <label for="inputMail">E-mail</label>
                        <form:errors path="mail" cssClass="form-text text-danger"></form:errors>
                        <c:if test="${existEmail ne null}">
                            <span class="form-text text-danger">${existEmail}</span>
                        </c:if>
                    </div>

                    <div class="form-label-group">
                        <form:input path="phoneNumber" id="inputPhoneNumber" cssClass="form-control"
                                    placeholder="Telefon Numaranız" type="tel" pattern="^[0-9]{10,11}$" ></form:input>
                        <label for="inputPhoneNumber">Telefon</label>
                        <form:errors path="phoneNumber" cssClass="form-text text-danger"></form:errors>
                    </div>

                    <div class="form-label-group">
                        <form:textarea path="address" cssClass="form-control" rows="3"
                                       placeholder="Mahalle, sokak, cadde , ilçe ve il bilgisi giriniz."></form:textarea>
                        <form:errors path="address" cssClass="form-text text-danger text-center"></form:errors>
                    </div>

                    <form:button class="btn btn-lg btn-primary btn-block" name="submit">Ekle</form:button>

                </div>

            </form:form>


        </div>
    </div>
</div>

<script src="/js/custom/jquery-3.3.1.slim.min.js" type="text/javascript"></script>
<script src="/js/custom/popper.min.js" type="text/javascript"></script>
<script src="/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<script src="/js/custom/common.js" type="text/javascript"></script>

</body>
</html>
