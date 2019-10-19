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
    <link href="/css/custom/common.css" rel="stylesheet" type="text/css"/>
    <link href="/css/custom/sidebar.css" rel="stylesheet" type="text/css"/>
    <title>VetApp</title>
</head>
<body class="bg-custom">

<div class="container">

    <section class="jumbotron text-center">
        <div class="container">
            <h1 class="jumbotron-heading mb-4">VetApp Projesi</h1>
            <hr/>
            <p class="lead text-dark"><span class="font-weight-bold">VetApp</span> veterinerlik işlemleri için geliştirilmiştir.
            </p>

            <p class="text-dark">
                Peki neler yapabilirsin?
                Sisteme üye olabilir ve sonrasında giriş yapabilirsin.
                Sahip olduğunuz role göre hayvan sahibi ve hayvan ekleme, silme, güncelleme gibi işlemler yapabilirsin.
                Hayvan adı veya hayvan sahibi adı ile arama yapabilir ve kayıtları görüntüleyebilirsin.
            </p>

            <p class="lead text-dark"> Kullanılan teknolojiler: Spring Boot + Spring MVC + Spring Security + JPA/Hibernate + MySQL</p>
            <hr/>
            <c:if test="${loggedInUser == 'anonymousUser'}">
                <a href="/register" class="btn btn-primary btn-lg my-2">Yeni hesap oluştur</a>
                <a href="/login" class="btn btn-success btn-lg my-2">Giriş yap</a>
            </c:if>

            <c:if test="${loggedInUser != 'anonymousUser'}">
                <a href="/dashboard" class="btn btn-success btn-lg btn-block my-2">Selam ${loggedInUser} ! Kontrol Paneline Git</a>
            </c:if>

        </div>
    </section>
</div>
<script src="/js/custom/jquery-3.3.1.slim.min.js" type="text/javascript"></script>
<script src="/js/custom/popper.min.js" type="text/javascript"></script>
<script src="/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>

</body>
</html>
