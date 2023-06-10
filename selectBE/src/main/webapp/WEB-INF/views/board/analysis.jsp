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
    <title>Select *</title>
    <link rel="stylesheet" href="${cpath}/resources/css/analysis.css">
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

        <!-- main -->
        <div class="main">
            <div class="topbar">
              <div class="toggle">
                <ion-icon name="menu-outline"></ion-icon>
              </div>
              <!-- search -->  
              <div class="search">
                <label>
                   <input type="text" placeholder="Search here"> 
                   <ion-icon name="search-outline"></ion-icon>
                </label>
              </div>
              <!-- userImg -->
              <div class="user">
                <img src="../dashboard.img/user.jpg">
              </div>
            </div>
        

        <!-- card -->
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

        <div class="details">
            
            <!-- 모달창 -->
            <div id="modalBox">
                <div class="scoreBox">
                    <button id="btn-modal">score</button> 
                </div>

                <div class="details2">
                    <!-- 디스플레이 박스 -->
                    <div class="displayBox"> 
                        <div class="cardHeader">                    
                            <h3>Display view</h3> 
                            <ion-icon name="chevron-back-outline"></ion-icon> 
                        </div>

                    <ul>
                        <div class="displayquery">                    
                            <h3>Display-query</h3> 
                        </div> 
                                <h>List of queries to configure display view.</h>
                                <thead>
                                    <div class="querylist">                    
                                        <h4>Query list (30)</h4> 
                                        <div class="listtoggle">
                                        <h>Number of data included</h>
                                        <label class="toggle_analysis" for="myToggle">
                                            <input class="toggle__input" name="" type="checkbox" id="myToggle">
                                            <div class="toggle__fill"></div>
                                        </label>
                                        </div>
                                    </div>
                                </thead>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td><ion-icon name="chevron-forward-outline"></ion-icon></td>
                                            <td>Park</td>
                                            <td>350 (3.50%)</td>
                                            <td><div class="toggle-container">
                                                <div class="toggle-switch">
                                                    <input class="toggle-input" type="checkbox" id="toggle-1">
                                                    <label class="toggle-slider" for="toggle-1"></label>
                                                </div>
                                            </div>    
                                            </td>                                            
                                        </tr>
                                        <tr>
                                            <td><ion-icon name="chevron-forward-outline"></ion-icon></td>
                                            <td>SparseResidential</td>
                                            <td>300 (3.00%)</td>
                                            <td><div class="toggle-container">
                                                <div class="toggle-switch">
                                                    <input class="toggle-input" type="checkbox" id="toggle-2">
                                                    <label class="toggle-slider" for="toggle-2"></label>
                                                </div>
                                            </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><ion-icon name="chevron-forward-outline"></ion-icon></td>
                                            <td>DenseResidential</td>
                                            <td>410 (4.10%)</td>
                                            <td><div class="toggle-container">
                                                <div class="toggle-switch">
                                                    <input class="toggle-input" type="checkbox" id="toggle-3">
                                                    <label class="toggle-slider" for="toggle-3"></label>
                                                </div>
                                            </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><ion-icon name="chevron-forward-outline"></ion-icon></td>
                                            <td>Parking</td>
                                            <td>390 (3.90%)</td>
                                            <td><span class="status parking"><div class="toggle-container">
                                                <div class="toggle-switch">
                                                    <input class="toggle-input" type="checkbox" id="toggle-4">
                                                    <label class="toggle-slider" for="toggle-4"></label>
                                                </div>
                                            </div></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><ion-icon name="chevron-forward-outline"></ion-icon></td>
                                            <td>Beach</td>
                                            <td>400 (4.00%)</td>
                                            <td><div class="toggle-container">
                                                <div class="toggle-switch">
                                                    <input class="toggle-input" type="checkbox" id="toggle-5">
                                                    <label class="toggle-slider" for="toggle-5"></label>
                                                </div>
                                            </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><ion-icon name="chevron-forward-outline"></ion-icon></td>
                                            <td>Industrial</td>
                                            <td>390 (3.90%)</td>
                                            <td><div class="toggle-container">
                                                <div class="toggle-switch">
                                                    <input class="toggle-input" type="checkbox" id="toggle-6">
                                                    <label class="toggle-slider" for="toggle-6"></label>
                                                </div>
                                            </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table> 
                        </ul>    
                    </div>
                    <div class="container2">
                        <!-- 이미지 확대 영역 -->
                        <div id="enlargedArea" class="enlarged-image">
                            <img id="enlargedImg">
                        </div>
                    </div>
                    
                    <!-- 이미지 리스트 -->
                    <div class = "pictureList">
                        <div class="pictureTable">
                            <!--  <img src="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg" alt="" class="image" onclick="enlargeImage(this)" height=90 width=95/>
                            <img src="../dashboard.img/user.jpg" alt="" class="image2" onclick="enlargeImage(this)" height=90 width=95/>
                            <img src="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg" alt="" class="image" onclick="enlargeImage(this)" height=90 width=95/>
                            -->
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
                        <span class="tooltip">70%</span>
                    </span>
                </div>
            </div>
    
            <div class="skillBox">
                <span class="title">충분성</span>
    
                <div class="skillBar">
                    <span class="suffiPer">
                        <span class="tooltip">65%</span>
                    </span>
                </div>

            </div>
    
            <div class="skillBox">
                <span class="title">적합성</span>
    
                <div class="skillBar">
                    <span class="suitPer">
                        <span class="tooltip">80%</span>
                    </span>
                </div>
            </div>
    
            <div class="skillBox">
                <span class="title">Bbox</span>
    
                <div class="skillBar">
                    <span class="bboxPer">
                        <span class="tooltip">75%</span>
                    </span>
                </div>
            </div>
    
        </div>

                        
                    </div>
                </div>
            </div>






    
                </div>
            </div>


    </div>        
</div>

    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <script src="https://kit.fontawesome.com/6377d08cc4.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.3.0/dist/chart.umd.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.min.js"></script> 
    <script type="text/javascript" charset="utf-8" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script> 
    
    <script>
        // MenuToggle
        var ctx = document.getElementById('chart').getContext('2d');
		var score = 85; // 예시로 85점을 설정하였습니다.
	
		var chart = new Chart(ctx, {
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
			responsive: false,
			legend: {
				display: false
			},
			tooltips: {
				enabled: false
			}
		}

		});

		// 반원 도넛 차트 안에 점수
		Chart.pluginService.register({
			beforeDraw: function(chart) {
				var width = chart.chart.width,
				height = chart.chart.height,
				ctx = chart.chart.ctx;
				ctx.restore();
				var fontSize = 100;

				ctx.font = fontSize + "MBC1961M";
				ctx.textBaseline = "middle";
				var text = "75",
				textX = Math.round((width - ctx.measureText(text).width) / 2),
				textY = height / 1.35;
				ctx.fillText(text, textX, textY);
				ctx.save();
			}
		});


        let toggle = document.querySel 4ector('.toggle');
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

        // 이미지 확대 함수
        function enlargeImage(image) {
            var enlargedArea = document.getElementById('enlargedArea');
            var enlargedImg = document.getElementById('enlargedImg');
    
            enlargedImg.src = image.src;
            enlargedArea.style.display = 'flex';
        }
    
        // 이미지 확대 영역 닫기
        document.getElementById('enlargedArea').addEventListener('click', function (e) {
            if (e.target === this) {
            this.style.display = 'none';
            }
        });

        // 버튼을 누르면 모달창 뜨게 하기
        const modal = document.getElementById("modal")
        const btnModal = document.getElementById("btn-modal")
            btnModal.addEventListener("click", e => {
            modal.style.display = "flex"
        })

       // 모달창 닫기 버튼 
        const closeBtn = modal.querySelector(".close-area")
            closeBtn.addEventListener("click", e => {
            modal.style.display = "none"
        });
    </script>
</body>
</html>