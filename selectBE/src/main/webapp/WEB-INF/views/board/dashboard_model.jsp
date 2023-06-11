<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.peachs.entity.Csv"%>
<%@page import="java.util.ArrayList"%>
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
        
        <!-- Data 정보 박스 -->
        <div class="cardBox">
            <div class="card">
                <div class="iconBx">
                    <ion-icon name="id-card-outline"></ion-icon>
                </div> 
                <div>
                    <div class="cardName">Plan</div>
                    <div class="numbers">Free</div>
                </div>
			</div>
        
            <div class="card">
                <div class="iconBx">
                    <ion-icon name="server-outline"></ion-icon>
                </div> 
                <div>
                    <div class="cardName">Data</div>
                    <c:set var="count" value="${fn:length(works)}" />
					<div class="numbers">${count}</div>
                </div>
            </div>
            <div class="card">
                <div class="iconBx">
                    <ion-icon name="folder-outline"></ion-icon>
                </div> 
                <div>
                    <div class="cardName">Left</div>
                    <c:set var="left" value="${10 - count}" />
                    <div class="numbers">${left}</div>
                </div>
            </div>

            
            <div class="card">
                <div class="iconBx">
                    <ion-icon name="calendar-number-outline"></ion-icon>
                </div> 
                <div>
                    <div class="cardName">Last Updated</div>
                    <c:set var="lstDate" value="" />
					<c:forEach var="work" items="${works}" varStatus="status">
  						<c:if test="${empty lstDate or work.od_date > lstDate}">
    						<c:set var="lstDate" value="${work.od_date}" />
  						</c:if>
					</c:forEach>
                    <div class="numbers">${lstDate}</div>
                </div>
            </div>
        </div>
        
        <!-- option 고르기 -->
        <div class="optionHead">
            <div class="tap">
                <a href="${cpath}/dashboard" class="custom-button">Metadata</a>
            </div>
            <div class="tap">
                <a href="${cpath}/dashboard_model" class="custom-button">Model metric</a>
            </div>
        </div>
            <!-- Add Charts -->
             <div class="graphBox">
                <div class="box1">
                    <div class="selectBox">
                        <form action="http://127.0.0.1:5000/test" method="post">
                        	<select name="bgvalue" id="">
	                            <option selected>원본</option>
    	                        <option value="25%">25%</option>
                            	<option value="25%">50%</option>
                            	<option value="25%">75%</option>
                            	<option value="25%">80%</option>
                            	<option value="25%">85%</option>
                        	</select>
                        </form>
                    </div>
                    
                    <% ArrayList<Csv> contents = (ArrayList<Csv>) session.getAttribute("csv");%>
                    <div class="pictureList">
                        <div class="pictureTable">
                            <% for (int j=0; j<contents.size(); j++) {%>
              					<img src="/images/${filepath}/<%=contents.get(j).getImagePath()%>" class="<%=contents.get(j).getLabel()%> deactive" onclick="enlargeImage(this)" height=90 width=95/>   		
                        	<%} %>                            
                        </div>
                    </div>
                </div>
                <div class="box2">
                    <div class="imgcontainer">
                        <div class="titleBox">
                        	<p>Original Image</p>                        	
                        </div>
                      
                        <div class="imgtable">
                        </div>
                    </div>
                </div>
                <div class="box3">
                    <div class="imgcontainer">
                        <div class="titleBox">
                        	<p>Change Image</p>
                        </div>
                        <div class="imgtable"></div>
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
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.min.js"></script> 
    <script src="../js/dashboard_model.js"></script>
    <script>
    	function enlargeImage(image) {
    		var imagePath = image.src;
	        $('.imgtable').html("<img>");
        	$('.imgtable img').attr('src',image.src);
        	console.log(imagePath);
    	};
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