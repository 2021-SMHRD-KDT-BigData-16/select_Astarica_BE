<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.peachs.entity.AccountsInfo"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix ="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
    <style>
        #my-input {
            visibility: hidden;
        }
    </style>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select Astarica</title>
    <link rel="stylesheet" href="${cpath}/resources/css/dashboard.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

        <!-- 상단바(Dataset 이름) -->
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
                <a href="${cpath}/dashboard">
                    <p>Metadata</p>
                </a>
            </div>
            <div class="tap">
                <a href="${cpath}/dashboard_model">
                    <p>Model metric</p>
                </a>
            </div>
            <div class="tap">
                <a href="${cpath}/dashboard_label">
                    <p>Label Key / Class</p>
                </a>
            </div>
        </div>

        <div class="optionContainer">
            <div class="optionKey">
                <div class="option1">
                    <div class="check">
                        <input type="radio" value="check1" name="check" />
                    </div>
                    <div class="optionKey1">원본</div>
                    <div class="optionKey1_value">
                        <div class="optionValue1"><ion-icon name="server-outline"></ion-icon> Value: 0</div>
                    </div>
                    <div class="optionKey1_data">
                        <div class="optionValue1"><ion-icon name="server-outline"></ion-icon> Data: 0</div>
                    </div>
                </div>

                <div class="option2">
                    <div class="check">
                        <input type="radio" value="check2" name="check" />
                    </div>
                    <div class="optionKey2">체크1</div>
                    <div class="optionKey2_value">
                        <div class="optionValue2"><ion-icon name="server-outline"></ion-icon> Value: 0</div>
                    </div>
                    <div class="optionKey2_data">
                        <div class="optionValue2"><ion-icon name="server-outline"></ion-icon> Data: 0</div>
                    </div>
                </div>

                <div class="option3">
                    <div class="check">
                        <input type="radio" value="check3" name="check" />
                    </div>
                    <div class="optionKey3">체크2</div>
                    <div class="optionKey3_value">

                        <div class="optionValue3"><ion-icon name="server-outline"></ion-icon> Value: 0</div>
                    </div>
                    <div class="optionKey3_data">

                        <div class="optionValue3"><ion-icon name="server-outline"></ion-icon> Data: 0</div>
                    </div>
                </div>

            </div>
            <!-- Add Charts -->
            <div class="graphBox">
                <div id="box" class="bar" style="position: relative; height:40vh; width:86vw">
                    <div class="chart-wrap">
                        <canvas id="ctx" width="60" height="60"></canvas>
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
    <script src="../js/dashboard.js"></script>
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
        
        <!-- 원본/ 체크1/ 체크2 선택시 radio event -->
        const test = document.querySelector('.test');
        $("input[name='check']:radio").change(function () {
            $('#box').children().remove(); // this is my <canvas> element
            $('#box').append('<canvas id="ctx" class="chart"><canvas>');
            var value = this.value;
            $("#ctx").removeClass()
            $("#ctx").addClass(value)
            console.log(document.getElementById('ctx').getAttribute("class"))
            const className = document.getElementById('ctx').getAttribute("class")
            if (className == 'check1') {
                new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: ['Total', 'paper', 'pack', 'can', 'plastic', 'pet', 'glass', 'vinly'],
                        datasets: [{
                        label: 'earning',
                        data: [1200, 1090, 3000, 5400, 1220, 3600, 4800, 4578],
                        // 데이터셋 배경 색상
                        backgroundColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)',
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)'
                            ],
                            // 테두리 색상 설정
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)'
                            ],
                        }]
                    },
                    // 차트의 옵션 설정
                    options: {
                      scales: {
                        // y축 옵션
                        y: {
                          // y축이 0에서 시작하도록 지정
                          beginAtZero: true,
                          // 반응형 차트
                          reponsive: true,
                        }
                    }
                }
            });
    
            } else if (className == 'check2') {
                new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: ['Total', 'paper', 'pack', 'can', 'plastic', 'pet', 'glass', 'vinly'],
                        datasets: [{
                        label: 'Reusable Trash',
                        data: [1000, 1090, 1500, 1000, 4578, 4700, 1300, 1500],
                        // 데이터셋 배경 색상
                        backgroundColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)',
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)'
                            ],
                            // 테두리 색상 설정
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)'
                            ],
                        }]
                    },
                    // 차트의 옵션 설정
                    options: {
                      scales: {
                        // y축 옵션
                        y: {
                          // y축이 0에서 시작하도록 지정
                          beginAtZero: true,
                          // 반응형 차트
                          reponsive: true,
                        }
                    }
                }
            });
            } else if (className == 'check3') {
                new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: ['Total', 'paper', 'pack', 'can', 'plastic', 'pet', 'glass', 'vinly'],
                        datasets: [{
                            label: 'Reusable Trash',
                            data: [1900, 1800, 1750, 300, 1700, 1800, 1850, 1750],
                            // 데이터셋 배경 색상
                            backgroundColor: [
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)',
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)'
                            ],
                            // 테두리 색상 설정
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)'
                            ],

                        }]
                    },
                    // 차트의 옵션 설정
                    options: {
                        // 차트가 반응형으로 동작하도록 하기
                        maintainAspectRatio :false,
                    }
                });
            }
        });


    </script>
</body>

</html>