<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.peachs.entity.AccountsInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.peachs.entity.Csv"%>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.Set"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Iterator"%>
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
        @font-face {
            font-family: 'MBC1961M';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/MBC1961M.woff2') format('woff2');
            font-weight: normal;
            
            font-style: normal;
        }
    </style>
    
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select *</title>
    <link rel="icon" href="${cpath}/resources/images/favi.png"> 
    <link rel="stylesheet" href="${cpath}/resources/css/dashboard.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/7872e4b187.js" crossorigin="anonymous"></script>
</head>
<body>
<!-- csv 객체에서 label을 정리하는 로직 -->
<%
ArrayList<Csv> contents = (ArrayList<Csv>) session.getAttribute("csv");

HashMap<String, Integer> ratioCountMap = new HashMap<>();
HashMap<String, Integer> wideCountMap = new HashMap<>();
HashMap<String, Integer> bwideCountMap = new HashMap<>();

HashMap<String, Integer> labelCountMap = new HashMap<>();
for (Csv csv : contents) {
    String label = csv.getLabel();
    if (labelCountMap.containsKey(label)) {
        int count = labelCountMap.get(label);
        labelCountMap.put(label, count + 1);
    } else {
        labelCountMap.put(label, 1);
    }
}
%>
<%
for (Csv csv : contents) {
    String ratio = csv.getRatio();
    if (ratioCountMap.containsKey(ratio)) {
        int count = ratioCountMap.get(ratio);
        ratioCountMap.put(ratio, count + 1);
    } else {
        ratioCountMap.put(ratio, 1);
    }
}
%>
<%
for (Csv csv : contents) {
    String wide = csv.getWide();
    if (wideCountMap.containsKey(wide)) {
        int count = wideCountMap.get(wide);
        wideCountMap.put(wide, count + 1);
    } else {
        wideCountMap.put(wide, 1);
    }
}
%>
<%
for (Csv csv : contents) {
    String bwide = csv.getBwide();
    if (bwideCountMap.containsKey(bwide)) {
        int count = bwideCountMap.get(bwide);
        bwideCountMap.put(bwide, count + 1);
    } else {
        bwideCountMap.put(bwide, 1);
    }
}
%>
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

        <!-- 상단바(Dataset 이름) -->
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
        
        <!-- option 고르기 -->
        <div class="optionHead">
            <div class="tap">
                <a href="${cpath}/dashboard" class="custom-button">Metadata</a>
            </div>
            <div class="tap">
                <a href="${cpath}/dashboard_model" class="custom-button">ImageView</a>
            </div>
            
        </div>
<% 
Set set = labelCountMap.keySet();
Iterator iterator1 = set.iterator();
ArrayList<String> labels = new ArrayList<>(set);
Collections.sort(labels);

Set ratioset = ratioCountMap.keySet();
Iterator iterator2 = ratioset.iterator();
ArrayList<String> ratioss = new ArrayList<>(set);
%>
        <div class="optionContainer">
            <div class="optionKey">
                <div class="option1">
                    <div class="check">
                        <input type="radio" value="check1" name="check" />
                    </div>
                    <div class="optionKey1">원본 데이터</div>
                    <div class="optionKey1_value">
                        <div class="optionValue1"><ion-icon name="server-outline"></ion-icon>data quantity : <%=contents.size()%></div>
                    </div>
                    <div class="optionKey1_data">
                        <div class="optionValue1"><ion-icon name="server-outline"></ion-icon>Labels : <%=labels.size() %> </div>
                    </div>
                </div>

                <div class="option2">
                    <div class="check">
                        <input type="radio" value="check2" name="check" />
                    </div>
                    <div class="optionKey2">Ascept Ratio</div>
                    <div class="optionKey2_value">
                        <div class="optionValue2"><ion-icon name="server-outline"></ion-icon>data quantity : <%=contents.size()%></div>
                    </div>
                    <div class="optionKey2_data">
                        <div class="optionValue2"><ion-icon name="server-outline"></ion-icon> Ratios : <%=ratioCountMap.size()%></div>
                    </div>
                </div>


            </div>
            <!-- Add Charts -->
            <div class="graphBox">
                <div id="box" class="bar" style="position: relative; height:40vh; width:86vw; display : flex;">
                	
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
    
	    var labels = [
	    	  <% for (String label : labelCountMap.keySet()) { %>
	    	    '<%= label %>',
	    	  <% } %>
	    	];

	    var data = [
	    	  <% for (int count : labelCountMap.values()) { %>
	    	    <%= count %>,
	    	  <% } %>
	    	];
    	
    	var ratios = [
	    	  <% for (String ratio : ratioCountMap.keySet()) { %>
	    	    '<%= ratio %>',
	    	  <% } %>
	    	];
	    ratios.sort();
	    
	    var ratio_data = [
	    	  <% for (int cnt : ratioCountMap.values()) { %>
	    	    <%= cnt %>,
	    	  <% } %>
	    	];
		ratio_data.sort();
  		
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
        
        
        
        function transparentize(value, opacity) {
      	  var alpha = opacity === undefined ? 0.5 : 1 - opacity;

      	  // value의 투명도 조절
      	  if (value.startsWith('#')) {
      	    // HEX 색상 값인 경우
      	    var hexValue = value.substring(1); // '#' 제거
      	    var rgbValue = hexToRgb(hexValue);
      	    return rgbaToColorString(rgbValue.r, rgbValue.g, rgbValue.b, alpha);
      	  } else if (value.startsWith('rgb') || value.startsWith('hsl')) {
      	    // RGB 또는 HSL 색상 값인 경우
      	    var colorValue = parseColor(value);
      	    return rgbaToColorString(colorValue.r, colorValue.g, colorValue.b, alpha);
      	  } else {
      	    // 그 외의 경우
      	    return value;
      	  }
      	}
      
      // HEX 색상 값을 RGB 객체로 변환
      function hexToRgb(hexValue) {
        var hex = hexValue.length === 3 ? hexValue + hexValue : hexValue;
        var r = parseInt(hex.substring(0, 2), 16);
        var g = parseInt(hex.substring(2, 4), 16);
        var b = parseInt(hex.substring(4, 6), 16);
        return { r: r, g: g, b: b };
      }

      // RGB 또는 HSL 색상 값을 객체로 파싱
      function parseColor(colorValue) {
        var tempDiv = document.createElement('div');
        tempDiv.style.color = colorValue;
        document.body.appendChild(tempDiv);
        var computedColor = getComputedStyle(tempDiv).color;
        document.body.removeChild(tempDiv);

        var match = computedColor.match(/\d+/g);
        return {
          r: parseInt(match[0]),
          g: parseInt(match[1]),
          b: parseInt(match[2])
        };
      }

      // RGBA 값을 색상 문자열로 변환
      function rgbaToColorString(r, g, b, a) {
        return 'rgba(' + r + ', ' + g + ', ' + b + ', ' + a + ')';
      }
        
        
        
        
        
        
        
        <!-- 가져온 정보로 차트화 시키기 --!>
        
        
        
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
            		$('#box #textBox').remove()
            		$('#box').append('<canvas id="ctx1" class="chart"><canvas>');
                	$("#box").css("height","50vh");            	
                new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: labels,
                        datasets: [{
                        label: 'Class Counts',
                        data: data,
                        // 데이터셋 배경 색상
                        backgroundColor: [
                            transparentize('rgb(255, 99, 132)', 0.5),
                            transparentize('rgb(255, 159, 64)', 0.5),
                            transparentize('rgb(255, 205, 86)', 0.5),
                            transparentize('rgb(75, 192, 192)', 0.5),
                            transparentize('rgb(54, 162, 235)', 0.5),
                            
                            transparentize('rgb(153, 102, 255)', 0.5),
                            transparentize('rgb(201, 203, 207)', 0.5),
                            transparentize('rgb(66, 129, 255)', 0.5)
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
                    	  // x 축옵션
                    	   xAxes : {
                    		  ticks :{
                    			  font :{
                    				  size  : 20
                    			  }
                    		  },
                    	  },
                        // y축 옵션
                        y: {
                  		  ticks :{
                			  font :{
                				  size  : 20
                			  }
                		  },
                          // y축이 0에서 시작하도록 지정
                          beginAtZero: true,
                          // 반응형 차트
                          reponsive: true,
                        }
                    },
                    plugins: {
                        legend: {
                          position: 'top',
                          labels : {
                              font : {
                        		  size : 20
                        	  }
                          }

                        },
                        title: {
                          display: true,
                          text: 'Label Bar Chart',
                          font : {
                    		  size : 20
                    	  }
                          
                        }
                      },
                      elements: {
                          	line: {
                            	borderCapStyle: 'round', // 선 끝을 둥글게
	                            borderJoinStyle: 'bevel', // 꺾이는 모서리를 둥글게
    	                      }        
                        }
                }
            });
            
                new Chart(ctx1, {
                	
                	type: 'doughnut',
                    data: {
                    	labels: labels,
                        datasets: [{
                        label: 'Ratio',
                        data: data,
                        // 데이터셋 배경 색상
                        backgroundColor: [
                            transparentize('rgb(255, 99, 132)', 0.5),
                            transparentize('rgb(255, 159, 64)', 0.5),
                            transparentize('rgb(255, 205, 86)', 0.5),
                            transparentize('rgb(75, 192, 192)', 0.5),
                            transparentize('rgb(54, 162, 235)', 0.5),
                            
                            transparentize('rgb(153, 102, 255)', 0.5),
                            transparentize('rgb(201, 203, 207)', 0.5),
                            transparentize('rgb(66, 129, 255)', 0.5)
                            
                            ],
                            // 테두리 색상 설정
                        }]
                    },
                    // 차트의 옵션 설정
                    options: {
                      scales: {
                    	  xAxes : {
                    		  ticks :{
                    			  font :{
                    				  size  : 20
                    			  }
                    		  },
                    		  gridLines:{
                    			  display:false,
                    		  }
                    	  },
                        // y축 옵션
                        yAxes: {
                    		  ticks :{
                    			  font :{
                    				  size  : 20
                    			  }
                    		  },
                    		  gridLines: { 
                                  // grid line 설정
                                  display: false, 
                                },
                          // y축이 0에서 시작하도록 지정
                          beginAtZero: false,
                          // 반응형 차트
	                      reponsive: false,
                        }
                    	
                    },
                    plugins: {
                        legend: {
                          position: 'top',
                          labels : {
                        	 /*usePointStyle: true,*/
                              font : {
                        		  size : 13
                        	  }
                          }

                        },
                        title: {
                          display: true,
                          text: 'Label Pie Chart',
                          font : {
                    		  size : 20
                    	  }
                        }
                      }
                }

            });
            
          	
                
            } else if (className == 'check2') {
            	$('#box #ctx1').remove()
            	$('#box').append('<div id="textBox"></div>');
            	var html1 = `
            	<div class="textContainer">
            		<p class="textTitle">Ascept Ratio비율(%)</p>
            		<div class="contents">
                    <div class="text">
                        <h2>Ascept Ratio</h2>
                        <br>
            			<div class="text2">
            				<div>Bbox 이미지 면적</div>
            				<br>
            				<div>전체 이미지 면적</div>
            				<br>
            				<br>
            				<p><ion-icon name="bulb-outline"></ion-icon> Select Astarica에서 진행한 실험 결과에 의하면, 동일한 파라미터로 모델 학습시 이미지의 비율에 따라 mAP지수의 값이 차이가 남.</p>
            			</div>
            			<div class="imgBox">
                        	<img src="${cpath}/resources/images/bbox.jpg" alt="">
                    	</div>
                    </div>

                </div>
            </div>`
            	$('#textBox').append(html1);
            	$("#box").css("height","55vh");
                new Chart(ctx, {
                    type: 'polarArea',
                    data: {
                        labels: ratios,
                        datasets: [{
                            label: 'Ratio',
                            data: ratio_data,
                            // 데이터셋 배경 색상
                            backgroundColor: [
                            transparentize('rgb(255, 99, 132)', 0.5),
                            transparentize('rgb(255, 159, 64)', 0.5),
                            transparentize('rgb(255, 205, 86)', 0.5),
                            transparentize('rgb(75, 192, 192)', 0.5),
                            transparentize('rgb(54, 162, 235)', 0.5),
                            
                            transparentize('rgb(153, 102, 255)', 0.5),
                            transparentize('rgb(201, 203, 207)', 0.5),
                            transparentize('rgb(66, 129, 255)', 0.5)
                            
                            ],
                        }]
                    },
                    // 차트의 옵션 설정
                    options: {
                        responsive: true,
                        scales: {
                          r: {
                            pointLabels: {
                              display: true,
                              centerPointLabels: true,
                              font: {
                                size: 18
                              }
                            }
                          }
                        },
                        plugins: {
                          legend: {
                            position: 'right',
                          },
                          title: {
                            display: true,
                            text: 'Ascept Ratio',
                            font : {
                      		  size : 20
                      	  	}
                          }
                        }
                      },
                });
                $('#box')
                
                
            }
        });


    </script>
    
    <br>
</body>

</html>