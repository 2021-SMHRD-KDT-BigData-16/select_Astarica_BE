<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.List"%>
<%@page import="com.peachs.entity.AccountsInfo"%>

<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix ="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${cpath}/resources/css/login_register.css">
<title>Insert title here</title>
</head>
<body>
    <input type="checkbox" id="click">
    <div class="main-container">
        <div class="form-container">
            <!-- 로그인 -->
            <div class="sign-in">
                <form method="POST" action="${cpath}/login">
                    <h1>Sign In</h1>
                    <input type="email" name="user_id" placeholder="Email">
                    <input type="password" name="user_pw" placeholder="Password">
                    <button type="submit">Sign In</button>
                </form>
            </div>

            <!-- 회원가입 -->
            <div class="sign-up">
                <form method="POST" action="${cpath}/register">
                    <h1>Create Account</h1>
                    <input type="email" name="user_id" placeholder="Email">
                    <input type="password" name="user_pw" placeholder="Password">
                    <input type="text" name="user_name" placeholder="Name">
                    <input type="text" name="user_com" placeholder="Company">
                    <!-- require 속성 : 선택 태그의 값을 선택하지 않으면 폼이 전송되지 않도록 함 -->
                    <select name="user_job" class="select" style="margin-top: 5px;" required>
                        <option value="" disabled selected>직업</option>
                        <option value="학생">학생</option>
                        <option value="회사원">회사원</option>
                    </select>
                    <button type="submit">Sign Up</button>
                </form>
            </div>

            <!-- 슬라이드 -->
            <div class="slide-container">
                <div class="slide-panel">
                    <div class="slide-left">
                        <h1>Hello !</h1>
                        <p>Enter your Dataset and start analysis with us</p>
                        <label class="slide" for="click">Sign Up</label>
                    </div>

                    <div class="slide-right">
                        <h1>Welcome !</h1>
                        <p>To Keep connected with us please login with your personal info</p>
                        <label for="click" class="slide">Sign In</label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>