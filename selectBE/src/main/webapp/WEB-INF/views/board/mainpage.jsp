<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.peachs.entity.AccountsInfo"%>
<%@page import="com.peachs.entity.OriginDataInfo"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix ="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
    <style type="text/css">
        #my-input {
            visibility: hidden;
        }
        
     :root {
        --white: #fff;
        --blue: #287bff;
        --dur: 8s;
        
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
    <link rel="stylesheet" href="${cpath}/resources/css/home.css">
    <script src="https://kit.fontawesome.com/7872e4b187.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>



<body>
<!-- 메뉴 -->
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
                    <a class = "alert" href = "#">	
                        <span class="icon"><ion-icon name="bar-chart-outline"></ion-icon></span>
                        <span class="title">Dashboard</span>
                    </a>
                </li>
                <li>
                    <a class = "alert" href = "#">
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

        <!-- 맨 위 상단바 -->
        <div class="main">
            <div class="topbar">
              <div class="toggle">
                <ion-icon name="menu-outline"></ion-icon>
              </div>
              <!-- search -->
              <!--   
              <div class="search">
                <label>
                   <input type="text" placeholder="Search here"> 
                   <ion-icon name="search-outline"></ion-icon>
                </label>
              </div>
               -->
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

        <div class="details" id="blur">
            <!-- 데이터 업로드 박스 -->
            <div class="dataList">
                <div class="cardHeader">
                    <h2>DATA LIST</h2>
                        <a href="#" onclick="Dtoggle()" class="btn">+</a> 
                </div>
                <div class="dataBox">
                <c:if test="${!empty works}">
                	<c:forEach var="work" items="${works}">
                		<div class="datacard">
	                        <div class="iconBx">
                            	<ion-icon name="server-outline"></ion-icon>
                        	</div>

                        	<div class="formtest">
                            	<div class="dataName">${work.od_name}</div>
                            	<div class="date">${work.od_date}</div>
                            	<input type="hidden" name='file' value="${work.od_name}">
                    			<input type="hidden" name='path' value="${work.od_path}">
                        	</div>
                    </div>
                	</c:forEach>
                </c:if>
                </div>
               </div>
        </div>
        <!-- 데이터 업로드 모달창 -->
            <div id="popup">
                <div class="popup-header">
                    <div class="popup-logo">
                      <span class="logo-circle">
                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="512" height="419.116" viewBox="0 0 512 419.116">
                          <defs>
                            <clipPath id="clip-folder-new">
                              <rect width="512" height="419.116" />
                            </clipPath>
                          </defs>
                          <g id="folder-new" clip-path="url(#clip-folder-new)">
                            <path id="Union_1" data-name="Union 1" d="M16.991,419.116A16.989,16.989,0,0,1,0,402.125V16.991A16.989,16.989,0,0,1,16.991,0H146.124a17,17,0,0,1,10.342,3.513L227.217,57.77H437.805A16.989,16.989,0,0,1,454.8,74.761v53.244h40.213A16.992,16.992,0,0,1,511.6,148.657L454.966,405.222a17,17,0,0,1-16.6,13.332H410.053v.562ZM63.06,384.573H424.722L473.86,161.988H112.2Z" fill="var(--blue)" stroke="" stroke-width="1" />
                          </g>
                        </svg>
                      </span>
                    </div>
                    <button class="btn-close" onclick="Dtoggle()">
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="none" d="M0 0h24v24H0V0z"/><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12 19 6.41z" fill="var(--c-text-secondary)"/></svg>
                    </button>
                  </div>
                  <div class="popup-body">
                    <h2 class="popup-title">Upload a file</h2>
                    <p class="popup-description">Attach the file below</p> 
                    <button class="upload-area" onclick="onClickUpload()">
                        <span class="upload-area-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="340.531" height="419.116" viewBox="0 0 340.531 419.116">
                            <g id="files-new" clip-path="url(#clip-files-new)">
                                <path id="Union_2" data-name="Union 2" d="M-2904.708-8.885A39.292,39.292,0,0,1-2944-48.177V-388.708A39.292,39.292,0,0,1-2904.708-428h209.558a13.1,13.1,0,0,1,9.3,3.8l78.584,78.584a13.1,13.1,0,0,1,3.8,9.3V-48.177a39.292,39.292,0,0,1-39.292,39.292Zm-13.1-379.823V-48.177a13.1,13.1,0,0,0,13.1,13.1h261.947a13.1,13.1,0,0,0,13.1-13.1V-323.221h-52.39a26.2,26.2,0,0,1-26.194-26.195v-52.39h-196.46A13.1,13.1,0,0,0-2917.805-388.708Zm146.5,241.621a14.269,14.269,0,0,1-7.883-12.758v-19.113h-68.841c-7.869,0-7.87-47.619,0-47.619h68.842v-18.8a14.271,14.271,0,0,1,7.882-12.758,14.239,14.239,0,0,1,14.925,1.354l57.019,42.764c.242.185.328.485.555.671a13.9,13.9,0,0,1,2.751,3.292,14.57,14.57,0,0,1,.984,1.454,14.114,14.114,0,0,1,1.411,5.987,14.006,14.006,0,0,1-1.411,5.973,14.653,14.653,0,0,1-.984,1.468,13.9,13.9,0,0,1-2.751,3.293c-.228.2-.313.485-.555.671l-57.019,42.764a14.26,14.26,0,0,1-8.558,2.847A14.326,14.326,0,0,1-2771.3-147.087Z" transform="translate(2944 428)" fill="var(--black1)"/>
                            </g>     
                            </svg> 
                        </span>
                        <span class="upload-area-title">Drag file(s) here to upload.</span>
                        <span class="upload-area-description">
                         Alternatively, you can select a file by <br/><strong>clicking here</strong>
                    </span>
                </button>
            </div>
                <form action="uploading" method="post" class="file_upload" enctype="multipart/form-data">
		            <div class="popup-footer">
        	            <input id="my-input" type="file" name="file" accept=".zip">              
                    	<button id="my-button" onclick="onClickUpload();" button class="btn-primary">Upload</button>
                    	<button class="btn-secondary" onclick="Dtoggle()">Cancel</button>
            		</div>
                </form>
            </div>
        

    </div>        
</div>


    <div id = "loading" >
    <div class="container">        
        <i class="fas fa-spinner fa-10x fa-spin"></i>       
      </div>
    </div>
      
    <form id ="file_form">
    	<input type="hidden" value="" name="json" id="json_input">
    	<input type="hidden" value="" name="file" id="file_input">
    </form>

    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
 	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
 
    <script>
    
    $(".alert").click(function (){
        Swal.fire(
      		  '데이터를 먼저 선택해주세요!',
      		  'You clicked the button!',
      		  'success'
      		)
    	
    });
    
    
    
    	$(document).ready(function(){
    		
    		   $('#loading').hide(); //첫 시작시 로딩바를 숨겨준다.
    		   
    		})
    	
    	
    	$(document).ready(function() {
    		function form_submit(){
    			var formData = $("#file_form");
	    		formData.attr("action","${cpath}/test");
	    		formData.attr("method","post");
	    		formData.submit();
    		}
	    	  $('.datacard').click(function() {
	    	    var odPath = $(this).find('input[name=path]').val();
	    	    var file_name = $(this).find('input[name=file]').val();
				console.log(odPath);
				console.log(file_name);
			    $.ajax({
			      url: 'http://127.0.0.1:5000/test', // Flask 엔드포인트의 URL을 입력하세요.
			      type: 'POST',
			      data: {od_path: odPath},
			      beforeSend: function() {
			    	     //통신을 시작할때 처리
			    	     $('#loading').show();
			    	},
			   		complete: function() {
			    	        //통신이 완료된 후 처리
			    	     $('#loading').hide();
			    	},
			      success: function(response) {
			        // Ajax 요청이 성공적으로 완료되었을 때 실행할 코드를 작성합니다.
			        console.log('Success:', response);
			        // 예시 1: Ajax 응답 데이터를 컨트롤러로 전달하기
			        var jsonData = JSON.stringify(response);
			        console.log(jsonData);
			        $("#file_input").val(file_name);
			        $("#json_input").val(jsonData);
//			        var url = "http://localhost:8081/selectBE/test?data=' + encodeURIComponent(jsonData)";
			        form_submit();
		    		
			      },
			      error: function(xhr, status, error) {
			        // Ajax 요청이 실패했을 때 실행할 코드를 작성합니다.
			        console.error('Error:', error);
			        $('#loading').hide();
			      }
			    });
	    	    
			    
			    
	    	  });
	    	});
    /* }); */
   
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

        function Dtoggle(){
            var blur = document.getElementById('blur');
            blur.classList.toggle('active')
            var popup = document.getElementById('popup');
            popup.classList.toggle('active')
        };

        function onClickUpload(){
            let myInput = document.getElementById("my-input");
            myInput.click();
            let upload_area = document.getElementsByClassName("popup-body");
            let bol_sub = $('.file_upload').find('#sub_btn').val();
            console.log(bol_sub);
            myInput.onchange = () =>{
                const selectedFile = myInput.files[0]['name'];
                $('.upload-area-title').remove()
                $('.upload-area-description').remove()
                $('.upload-area').append(selectedFile);
                $('#my-button').removeAttr("onclick");
                $('#my-button').text('Submit').attr("type","submit");
            };
        };

    </script>
</body>
</html>
