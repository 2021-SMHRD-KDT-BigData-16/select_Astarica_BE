<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.peachs.entity.AccountsInfo"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix ="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- css를 이렇게 가져와줘야 탈이 없다...하ㅏ...부트스트랩은 어뜨카냐.. -->
    <link rel="stylesheet" href="${cpath}/resources/css/login.css">
    <title>Select *</title>
</head>
<body>
    <section>
    <br>
        <div class="form-box">
            <div class="form-value">
                <form method="POST" action="${cpath}/login">
                    <h2>Login</h2>
                    <div class="inputbox">
                        <ion-icon name="mail-outline"></ion-icon>
                        <input type="email" name = "user_id" required>
                        <label for="">Email</label>
                    </div>
                    <div class="inputbox">
                        <ion-icon name="lock-closed-outline"></ion-icon>
                        <input type="password" name = "user_pw" required>
                        <label for="">Password</label>
                    </div>
                    <!-- <div class="forget">
                        <label for="">
                            <input type="checkbox">Remember Me
                            <a href="#">Forget Password</a></label>
                    </div> -->
                    <button type = "submit">Log in</button>
                    <div class="register">

                        <p>Don't have a account <a href="#">Register</a></p>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>
