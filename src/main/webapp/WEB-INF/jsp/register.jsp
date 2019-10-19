<%--
  Created by IntelliJ IDEA.
  User: faruk
  Date: 12.10.2019
  Time: 00:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="/css/bootstrap/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="/css/custom/common.css" rel="stylesheet" type="text/css"/>
    <link href="/css/custom/form.css" rel="stylesheet" type="text/css"/>
    <link href="/css/custom/sidebar.css" rel="stylesheet" type="text/css"/>
    <title>VetApp | Kayıt Ol</title>
</head>
<body class="bg-custom">

<header>
    <div class="fixed-top text-center mt-2">
        <a class="h2 text-info font-weight-bold" href="/index">VetApp</a>
    </div>
    <hr/>
</header>

<div class="container mt-5">

    <form:form modelAttribute="createUser" cssClass="form-signin">
        <h2 class="form-signin-heading text-center">Üye Ol</h2>
        <hr/>
        <div class="form-group">

            <form:input path="username" cssClass="form-control"  placeholder="Kullanıcı Adı"></form:input>
            <c:if test="${alreadyExistsUser ne null}">
                <span class="form-text text-center text-danger">${alreadyExistsUser}</span>
            </c:if>
            <form:errors path="username" cssClass="form-text text-danger"></form:errors>

            <form:input path="password" type="password" cssClass="form-control"  placeholder="Şifre"></form:input>
            <form:errors path="password" cssClass="form-text text-danger"></form:errors>

            <form:button name="submit" class="btn btn-lg btn-primary btn-block">Kayıt Ol</form:button>

            <p class="text-center text-dark mt-2">Zaten üye misiniz? <a class="text-danger" href="/login">Giriş Yap</a></p>

        </form:form>

</div>

<script src="/js/custom/jquery-3.3.1.slim.min.js" type="text/javascript"></script>
<script src="/js/custom/popper.min.js" type="text/javascript"></script>
<script src="/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>
