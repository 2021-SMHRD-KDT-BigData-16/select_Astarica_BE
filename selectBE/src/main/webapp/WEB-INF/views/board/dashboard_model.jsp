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
        #loading {
        background: var(--white);
        color: var(--blue);
        font: bold 1em/1.5 "Comfortaa", sans-serif;
        display: grid;
        place-items: center;
        align-content: center;
        height: 100vh;
        letter-spacing: 0.1em;
        text-transform: uppercase;
        margin-left : 1000px ;
    }
    </style>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select *</title>
    <link rel="stylesheet" href="${cpath}/resources/css/dashboard_model.css">
    <script src="https://kit.fontawesome.com/7872e4b
    187.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
        <div class="navigation">
            <ul>
                <li>
                    <a href="${cpath}/mainpage">
                        <span class="icon"><i class="fa-solid fa-star-of-life fa-lg" style="color: #ffffff;"></i></span>
                        
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
                <a href="${cpath}/dashboard_model" class="custom-button">ImageView</a>
            </div>
        </div>
            <!-- Add Charts -->
             <div class="graphBox">
                <div class="box1">
                    <div class="selectBox">
                        <p>Data List</p>
                           <select id="bgvalue" onchange="changeFn()">
                               <option name="bg" value="25">25%</option>
                               <option name="bg" value="50">50%</option>
                               <option name="bg" value="75">75%</option>
                               <option name="bg" value="80">80%</option>
                               <option name="bg" value="85">85%</option>
                           </select>
                           
                    </div>
                    <!-- 저장 아이콘 -->
                    <!-- <div class="saveIcon"><i class="fas fa-regular fa-download" style="color: #287bff;"></i></div> -->
                    
                    <!-- <% ArrayList<Csv> contents = (ArrayList<Csv>) session.getAttribute("csv");%> -->
                    <div class="pictureList">
                        <div class="pictureTable">

                            <% for (int j=0; j<contents.size(); j++) {%>
                             <img src="/images/${filepath}/<%=contents.get(j).getImagePath()%>" class="<%=contents.get(j).getLabel()%> deactive" onclick="enlargeImage(this)" height=90 width=90/>    
                           <%} %>                            
                        </div>
                    </div>
                </div>
                <div class="box2">
                    <div class="imgcontainer">
                        <div class="titleBox">
                           <p>Original Image</p>
                           <button class='sbtn' onclick="submitF()">Change</button>
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
                        <!-- 저장버튼 -->
                        <button class="saveAll" onclick="dataBuild()">Building data</button>
                        <!-- 저장 아이콘 -->
                        <div class="saveIcon">
                            
                        </div>
                        <div class="cimgtable" id="cimgtable"></div>
                    </div> 
                </div>
            </div>
        </div>    
      <form id='image_frm'>
         <input type='hidden' id='imageName' name='imageName' value="">
         <input type='hidden' id='bgvalue' name='bgvalue' value="">
         <input type='hidden' id='imagePath' name='imagePath' value="${filepath}">
      </form>
	<form id="file_frm">
		<input type='hidden' id='downpath'name="downpath" value="">
	</form>
    </div>        
</div>
   <div id = "loading" >
       <div class="container">        
           <i class="fas fa-spinner fa-10x fa-spin"></i>       
         </div>
    </div>

    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <script src="https://kit.fontawesome.com/7872e4b187.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.3.0/dist/chart.umd.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.min.js"></script> 
    <script src="../js/dashboard_model.js"></script>
    <script>
    $(document).ready(function(){
      
         $('#loading').hide(); //첫 시작시 로딩바를 숨겨준다.
         
      });
    	function filedown(){
    		var fileFrm = $("#file_frm");
    		fileFrm.attr("action","${cpath}/download");
    		fileFrm.submit();
   		};
       function enlargeImage(image) {
           $('.imgtable').html("<img>");
           $('.imgtable img').attr('src',image.src);
          var imagePath = image.src;
           var fileName = imagePath.split("/")[5];
          $('#imageName').attr('value',fileName);
           console.log($('#imageName').val());
       };
      function changeFn(){
         var bgvalue = $("#bgvalue");
         var value = $("#bgvalue option:selected").val();
         $("#bgvalue").attr("value",value);
      }
      function submitF(){
          var imageName = $("#imageName").val();
          var imagePath = $("#imagePath").val();
          var value = $("#bgvalue").val();
          $.ajax({
                  url : "http://127.0.0.1:5000/image",
                  type : "post",
                  data : {imageName: imageName, imagePath:imagePath, value:value},
                  beforeSend: function() {
                     //통신을 시작할때 처리
                     $('#loading').show();
                     $('.saveAll').show();
                     
                },
                  complete: function() {
                        //통신이 완료된 후 처리
                     $('#loading').hide();
                },
                  success : function(data){
                     console.log(data['imagePath']);
                     var path = "/images/"+data['imagePath'];
                     console.log(path);
                     $('#cimgtable').html("<img>");
                     $('#cimgtable img').attr('src',path);
                  },
                  error : function(){alert("error");}
               });
       };
       function dataBuild(){
           var imagePath = $("#imagePath").val();
           var value = $("#bgvalue").val();
           console.log(imagePath);
           console.log(value);
           $.ajax({
                   url : "http://127.0.0.1:5000/data",
                   type : "post",
                   data : {imagePath:imagePath, value:value},
                   beforeSend: function() {
                      //통신을 시작할때 처리
                      $('#loading').show();
                 	},
                   complete: function() {
                         //통신이 완료된 후 처리
                      $('#loading').hide();
                 	},
                   success : function(data){
                	   var zipPath = data['zipPath'];
                	   $('.saveAll').hide();
                	   $('.saveIcon').html('<a href="#" class ="down" onclick="filedown()"><i class="fas fa-regular fa-download fa-2xl" style="color: #287bff; font-size: 2.5em;"></i></a>');
                	   $("#downpath").attr('value',zipPath);
                   },
                   error : function(){alert("error");}
                });
        };
        
       	
        // MenuToggle
        let toggle = document.querySelector('.toggle');
        let navigation = document.querySelector('.navigation');
        let main = document.querySelector('.main');

        toggle.onclick = function(){
            navigation.classList.toggle('active');
            main.classList.toggle('active');
        };

        // add hovered class in selected list item
        let list = document.querySelectorAll('.navigation li');
        function activeLink(){
            list.forEach((item) =>
            item.classList.remove('hovered')); 
            this.classList.add('hovered')
        };
        list.forEach((item) =>
        item.addEventListener('mouseover',activeLink));

        
    </script>
</body>