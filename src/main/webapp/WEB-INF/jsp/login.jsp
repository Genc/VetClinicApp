<%--
  Created by IntelliJ IDEA.
  User: faruk
  Date: 12.10.2019
  Time: 00:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="/css/bootstrap/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="/css/custom/common.css" rel="stylesheet" type="text/css"/>
    <link href="/css/custom/form.css" rel="stylesheet" type="text/css"/>
    <link href="/css/custom/sidebar.css" rel="stylesheet" type="text/css"/>
    <title>VetApp | Giriş Yap</title>
</head>
<body class="bg-custom">

<header>
    <div class="fixed-top text-center mt-2">
        <a class="h2 text-info font-weight-bold" href="/index">VetApp</a>
    </div>
    <hr/>
</header>


<div class="container mt-5">

    <form class="form-signin" action="/login" method="post">
        <h2 class="form-signin-heading text-center">Giriş Yap</h2>
        <hr/>
        <c:if test="${not empty param.loginFailed}">
            <div class="alert alert-danger" role="alert">Kullanıcı adı ya da şifre hatalı !</div>
        </c:if>
        <div class="form-group">
            <input name="username" type="text" class="form-control" placeholder="Kullanıcı Adı"/>
            <input name="password" type="password" class="form-control" placeholder="Şifre"/>
            <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">

            <input class="btn btn-lg btn-warning btn-block" type="submit" value="Giriş"/>
        </div>
        <p class="text-center text-decoration-underline text-dark"><a href="/register">Yeni Hesap Oluştur</a></p>
    </form>

</div>

<script src="/js/custom/jquery-3.3.1.slim.min.js" type="text/javascript"></script>
<script src="/js/custom/popper.min.js" type="text/javascript"></script>
<script src="/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>