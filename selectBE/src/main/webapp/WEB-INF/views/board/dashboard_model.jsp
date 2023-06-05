<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.peachs.entity.AccountsInfo"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix ="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
    <style>
        #my-input {
            visibility: hidden;
        }
    </style>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select *</title>
    <link rel="stylesheet" href="${cpath}/resources/css/dashboard_model.css">
    <script src="https://kit.fontawesome.com/7872e4b187.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
        <div class="navigation">
            <ul>
                <li>
                    <a href="${cpath}/mainpage">
                        <span class="icon"><i class="fa-solid fa-star-of-life" style="color: #ffffff;"></i></span>
                        <span class="title"><h2 class="logo-title">Select Astarica</h2></span>
                    </a>
                </li>
                <li>
                    <a href="${cpath}/mainpage">
                        <span class="icon"><ion-icon name="home-outline"></ion-icon></span>
                        <span class="title">HOME</span>
                    </a>
                </li>
                <li>
                    <a href="${cpath}/dashboard">	
                        <span class="icon"><ion-icon name="bar-chart-outline"></ion-icon></span>
                        <span class="title">Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="${cpath}/analysis">
                        <span class="icon"><ion-icon name="documents-outline"></ion-icon></span>
                        <span class="title">ANALYSIS</span>
                    </a>
                </li>
                <li>
                    <a href="${cpath}/logout">
                        <span class="icon"><ion-icon name="log-out-outline"></ion-icon></span>
                        <span class="title">Sign Out</span>
                    </a>
                </li>
            </ul>
        </div>

        <!-- 맨 위 상단바 (Dataset 이름) -->
        <div class="main">
            <div class="topbar">
              <div class="toggle">
                <ion-icon name="menu-outline"></ion-icon>
              </div>
              <!-- Header -->
              <div class="temHeader">
                <div class="dataName">
                     <p>Dataset Name</p>
                </div>
            </div>

              <!-- userImg -->
              <div class="user">
                <img src="../dashboard.img/user.jpg">
              </div>
            </div>
        
        <!-- 데이터 정보 card -->
        <div class="cardBox">
            <div class="card">
                <div class="iconBx">
                    <ion-icon name="server-outline"></ion-icon>
                </div> 
                <div>
                    <div class="cardName">Data</div>
                    <div class="numbers">10,000</div>
                </div>
            </div>
            <div class="card">
                <div class="iconBx">
                    <ion-icon name="folder-outline"></ion-icon>
                </div> 
                <div>
                    <div class="cardName">Slice</div>
                    <div class="numbers">1</div>
                </div>
            </div>
            <div class="card">
                <div class="iconBx">
                    <ion-icon name="options-outline"></ion-icon>
                </div> 
                <div>
                    <div class="cardName">Custom Filter</div>
                    <div class="numbers">9</div>
                </div>
                </div>
            <div class="card">
                <div class="iconBx">
                    <ion-icon name="bookmark-outline"></ion-icon>
                </div> 
                <div>
                    <div class="cardName">Tag</div>
                    <div class="numbers">5</div>
                </div>
            </div>
        </div>
        
        <!-- option 고르기 -->
        <div class="optionHead">
            <div class="tap">
                <a href="http://127.0.0.1:5500/main/html/dashboard.html">
                    <p>Metadata</p>
                </a>
            </div>
            <div class="tap">
                <a href="http://127.0.0.1:5500/main/html/dashboard_model.html">
                    <p>Model metric</p>
                </a>
            </div>
            <div class="tap">
                <a href="http://127.0.0.1:5500/main/html/dashboard_label.html">
                    <p>Label Key / Class</p>
                </a>
            </div>
        </div>
            <!-- Add Charts -->
            <div class="graphBox">
                <div class="graphTitle">
                    <p>Details by model metric</p>
                </div>
                <div class="predic_box">
                    <div class="prediction">
                        <canvas id="prediction"></canvas>
                    </div>
                </div>
                <div class="graphOption">
                    <div class="graphButton">
                        <div class="predic_check">
                            <input type="radio" id="predic_check" name="predic_check"/>
                            <p>prediction</p>
                        </div>
                    </div>
                </div>
                <div class="graph">
                    <div class="graph1">
                        <canvas id="bar"></canvas>
                    </div>
                    <div class="graph2">
                        <canvas id="doughnut"></canvas>
                    </div>
                </div>
                


            </div>
        </div>    

        
        

    </div>        
</div>

    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <script src="https://kit.fontawesome.com/7872e4b187.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.3.0/dist/chart.umd.min.js"></script>
    <script src="../js/dashboard_model.js"></script>
    <script>
        // MenuToggle
        let toggle = document.querySelector('.toggle');
        let navigation = document.querySelector('.navigation');
        let main = document.querySelector('.main');

        toggle.onclick = function(){
            navigation.classList.toggle('active');
            main.classList.toggle('active');
        }

        // add hovered class in selected list item
        let list = document.querySelectorAll('.navigation li');
        function activeLink(){
            list.forEach((item) =>
            item.classList.remove('hovered')); 
            this.classList.add('hovered')
        }
        list.forEach((item) =>
        item.addEventListener('mouseover',activeLink));
    </script>
</body>
</html>