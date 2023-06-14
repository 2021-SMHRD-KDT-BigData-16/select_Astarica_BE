<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.peachs.entity.AccountsInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.peachs.entity.Csv"%>
<%@page import="java.util.HashMap" %>
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
    <title>Select *</title>
    <link rel="stylesheet" href="${cpath}/resources/css/analysis.css">
    <link rel="icon" href="${cpath}/resources/images/favi.png">
    <script src="${cpath}/resources/js/analysis.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/7872e4b187.js" crossorigin="anonymous"></script>
    <style type="text/css">
      .deactive{
   		 display: none;
  		}
  		@font-face {
            font-family: 'MBC1961M';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/MBC1961M.woff2') format('woff2');
            font-weight: normal;
            
            font-style: normal;
        }
    </style>
</head>
<body>
<div class="container">
        <div class="navigation">
            <ul>
                <li>
                    <a href="${cpath}/mainpage">
                        <span class="icon"><i class="fa-solid fa-star-of-life fa-2xl" style="color: #ffffff;"></i></span>
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

        <!-- main -->
        <div class="main">
            <div class="topbar">
              <div class="toggle">
                <ion-icon name="menu-outline"></ion-icon>
              </div>
              <!-- Header -->
              <div class="temHeader">
                <div class="dataName">
                     <p>${file_name}</p>
                </div>
              </div>
              <!-- userImg -->
              <div class="user">
                <img src="${cpath}/resources/images/user.png">
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

        <div class="details">
            
            <!-- 모달창 -->
            <div id="modalBox">
                <div class="scoreBox">
                    <button id="btn-modal">Result</button> 
                </div>

                <div class="details2">
                    <!-- 디스플레이 박스 -->
                    <div class="displayBox"> 
                        <div class="cardHeader">                    
                            <h3>Display view</h3> 
                            <ion-icon name="chevron-back-outline"></ion-icon> 
                        </div>
							<button id="btn-modal2" onclick="dataSend()">Score</button>

                    <ul>
                        <div class="displayquery">                    
                            <h3>Display-query</h3> 
                        </div> 
                                <thead>
                                <% ArrayList<Csv> contents = (ArrayList<Csv>) session.getAttribute("csv");%>
                                    <div class="querylist">                    
                                        <h4>All Data (<%=contents.size()%>)</h4> 
                                        <div class="listtoggle">
                                        <h>Number of data included</h>
                                        <label class="toggle_analysis" for="myToggle">
                                            <input class="toggle__input" name="" type="checkbox" id="myToggle" name="allcheck">
                                            <div class="toggle__fill"></div>
                                        </label>
                                        </div>
                                    </div>
                                </thead>
                                <table>
                                    <tbody>
                                    	<% HashMap<String, Integer> labelCountMap = new HashMap<>();
                                       	
                                    	for (Csv csv : contents) {
                                    		String label = csv.getLabel();
                                    	    if (labelCountMap.containsKey(label)) {
                                    	        int count = labelCountMap.get(label);
                                    	        labelCountMap.put(label, count + 1);
                                    	    } else {
                                    	        labelCountMap.put(label, 1);
                                    	    }
                                    	} %>
                                    	<% Set set = labelCountMap.keySet();
                                    	Iterator iterator = set.iterator();
                                    	ArrayList<String> labels = new ArrayList<>(set);
                                    	Collections.sort(labels);
                                    	int i=0;
                                    	%>
                                    	<%for (String labe : labels) {%>
                                    	<% i++;%>
                                    	<% double rate = (double)((labelCountMap.get(labe))*100/(contents.size()));%>
                                    	<tr>
                                            <td><ion-icon name="chevron-forward-outline"></ion-icon></td>
                                            <td><%=labe%></td>
                                           
                                            <td><%=labelCountMap.get(labe)%>(<%=rate%>%)</td>
                                            <td><div class="toggle-container">
                                                <div class="toggle-switch">
                                                    <input class="toggle-input" type="checkbox" id="toggle-<%=i%>" name="check" value="<%=labe%>">
                                                    <label class="toggle-slider" for="toggle-<%=i%>"></label>
                                                </div>
                                            </div>    
                                            </td>                                            
                                        </tr>
                                    	<% } %>
                                    </tbody>
                                </table> 
                        </ul>    
                    </div>
                    <div class="container2">
                        <!-- 이미지 확대 영역 -->
                        <div class="imgcontainer">
                            <div class="imgtable">
                        </div>
                            
                        </div>
                    </div>
                    
                    
                    <!-- 이미지 리스트 -->
                    <div class = "pictureList">
                        <div class="pictureTable">
                        	<% for (int j=0; j<contents.size(); j++) {%>
              					<img src="/images/${filepath}/<%=contents.get(j).getImagePath()%>" class="<%=contents.get(j).getLabel()%> deactive" onclick="enlargeImage(this)" height=90 width=95/>   		
                        	<%} %>

                        </div>
                    </div>
                </div>
            </div>

            <!-- 모달창 -->
            <div id="modal" class="modal-overlay">
                <div class="modal-window">
                    <div class="title">
                        <p>Dataset Score</p>
                    </div>
                    <!-- 모달창 닫는 버튼 -->
                    <div class="close-area">X</div>
                    <div class="content">

                <!-- 점수 box -->
                <div class="scoreBox">
                <!-- 점수 (반원그래프)  -->
                <div>
                    <canvas id="chart"></canvas>        
                </div>
                <!-- 세부 점수  -->
                <div class="skillContainer">
            		<div class="skillBox">
                		<span class="title">균일성</span>
    
                		<div class="skillBar">
                    		<span class="uniPer">
    	                    	<span class="tooltip" id="tool1"></span>
	                    	</span>
        	        	</div>
            		</div>
	            <div class="skillBox">
    	            <span class="title">충분성</span>
                	<div class="skillBar">
	                    <span class="suffiPer">
                        	<span class="tooltip" id="tool2"></span>
                    	</span>
                	</div>
	            </div>
    
    	        <div class="skillBox">
        	        <span class="title">적합성</span>
    	            <div class="skillBar">
	                    <span class="suitPer">
    	                    <span class="tooltip" id="tool3"></span>
        	            </span>
            	    </div>
            	</div>
    
            	<div class="skillBox">
	                <span class="title">Bbox</span>    
                	<div class="skillBar">
	                    <span class="bboxPer">
                        	<span class="tooltip" id="tool4"></span>
                    	</span>
                	</div>
            	</div>
	        </div>

                        
                    </div>
                </div>
            </div>






    
                </div>
            </div>

		<form action="">
			<input type='hidden' id='fileName' name='fileName' value="${file_name}">
			<input type='hidden' id='totalN' name='totalN' value="">
			<input type='hidden' id='totalS' name='totalS' value="">
		</form>
    </div>        
</div>
	
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <script src="https://kit.fontawesome.com/6377d08cc4.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.3.0/dist/chart.umd.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.min.js"></script> 
    <script type="text/javascript" charset="utf-8" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script> 
    <!--<script src="${cpath}/resources/js/analysis.js"></script>-->
    <script type="text/javascript">
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
    this.classList.add('hovered');
;}
list.forEach((item) =>
item.addEventListener('mouseover',activeLink));

    	// 토오글 버튼 모두 선택쓰
var allcheck = $('#myToggle');
allcheck.click(function(){
    var checked = allcheck.is(":checked");
        if(checked){
            $('input:checkbox').prop("checked",true);
            if($('.pictureTable img').hasClass('deactive')){
                $('.pictureTable img').removeClass('deactive')
                $('.pictureTable img').addClass('active')
            }
        }else{
            $('input:checkbox').prop("checked",false);
            if($('.pictureTable img').hasClass('active')){
                $('.pictureTable img').removeClass('active')
                $('.pictureTable img').addClass('deactive')
            }
        }
});
arr = [1,2,3,4,5,6,7];
for (var i = 1; i < 8; i++) {
    arr[i]= makeFunction(i);
};

function makeFunction(index) {
	var temp = "#toggle-" + index;
    var check2 = $(temp);
    check2.click(function () {
    	var checked = check2.is(":checked");
	    var val2 = check2.val();
        var temp = "." + val2;
        console.log(temp);
        var images = $(temp);
        console.log(images);
        if (checked) {
            if (images.hasClass("deactive")) {
                images.removeClass("deactive");
            }
                images.addClass("active");
        } else {
            if (images.hasClass("active")) {
                images.removeClass("active");
                }
                images.addClass("deactive");
            }	
    });
};
function dataSend(){
    var fileName= $("#fileName").val();
    console.log(fileName);
    $.ajax({
        url: 'http://127.0.0.1:5000/score', // Flask 엔드포인트의 URL을 입력하세요.
		type: 'POST',
		data: {fileName: fileName},
		beforeSend: function() {
			     //통신을 시작할때 처리
                $('#loading').show();
		},
		complete: function() {
			        //통신이 완료된 후 처리
			$('#loading').hide();
        },
		success: function(data) {
            console.log('Success:', data);
            var totalN = (data['uniformity']+data['compatibility']+data['sufficiency']+data['bbox'])/4
			var totalS = totalN.toString();
            $('#totalS').attr("value",totalS);
            $('#totalN').attr("value",totalN);
            console.log($("#totalN").val());
            console.log($("#totalS").val());
			        // 균일성
			var uniformity = data['uniformity'].toString()+"%";
			        // 적합성
			var compatibility = data['compatibility'].toString()+"%";
			        // 충분성
			var sufficiency = data['sufficiency'].toString()+"%";
			        // bbox
			var bbox = data['bbox'].toString()+"%";
			$("#tool1").text(uniformity);
			$(".uniPer").css("width", uniformity);
			
			$("#tool2").text(sufficiency);
			$(".suffiPer").css("width", sufficiency);
			
			$("#tool3").text(compatibility);
			$(".suitPer").css("width", compatibility);
			
			$("#tool4").text(bbox);
			$(".bboxPer").css("width", bbox);
			var ctx = document.getElementById('chart').getContext('2d');
			var score = $('#totalS').val(); // 예시로 85점을 설정하였습니다.
			var chart = new Chart(ctx, 
			    {
			        type: 'doughnut',
			        data: {
			            datasets: [{
			                data: [score, 100 - score],
			                backgroundColor: ['#287bff', '#ccc'],
			                borderWidth: 0
			                }]
			            },
			        options: {
			            cutoutPercentage: 70,
			            rotation: 1 * Math.PI,
			            circumference: 1 * Math.PI,
			            responsive:false,
			            legend: {
			                display: false
			            },
			            tooltips: {
			                enabled: false
			            }
			        }
			});
			Chart.pluginService.register({
			    beforeDraw: function(chart) {
			        var width = chart.chart.width,
			        height = chart.chart.height,
			        ctx = chart.chart.ctx;
			        ctx.restore();
			        ctx.font = "3.5rem 'MBC1961M'";
			        ctx.textBaseline = "middle";
			        var text = $('#totalS').val();
			        textX = Math.round((width - ctx.measureText(text).width) / 2),
			        textY = height / 1.35;
			        ctx.fillText(text, textX, textY);
			        ctx.save();
			        }
			});
        },
		error: function(xhr, status, error) {
			        // Ajax 요청이 실패했을 때 실행할 코드를 작성합니다.
			console.error('Error:', error);
			$('#loading').hide();
        }
	});
};
    	
    // 이미지 확대 함수
function enlargeImage(image) {
    $('.imgtable').html("<img>");
    $('.imgtable img').attr('src',image.src);
};	

        // 반원 도넛 차트 안에 점수
        

    // 버튼을 누르면 모달창 뜨게 하기

const modal = document.getElementById("modal")
const btnModal = document.getElementById("btn-modal")
btnModal.addEventListener("click", e => {
    modal.style.display = "flex"
});
	
    // 모달창 닫기 버튼 
const closeBtn = modal.querySelector(".close-area")
closeBtn.addEventListener("click", e => {
    modal.style.display = "none"
});



            // 반원 도넛 차트 안에 점수


	</script>
</body>
</html>