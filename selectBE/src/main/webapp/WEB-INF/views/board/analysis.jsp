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
            <!-- order details list -->
            <div class="recentOrders"> 
                <div class="cardHeader">                    
                    <h3>Display view</h3> 
                    <ion-icon name="chevron-back-outline"></ion-icon>
                </div>
                <hr>
                <div class="display">                    
                    <h>Display</h> 
                    <a href="#" class="btn">Add</a>
                </div>          
                <select name="displayselect" id="display-id">  
                    <option value="">GT Class</option>  
                    <option value="None">None</option>  
                    <option value="오답">오답</option>  
                    <option value="(문휘)Split">(문휘)Split</option>
                    <option value="test set와 관점 분포보기">test set와 관점 분포보기</option>
                </select>
                <br>
                <hr>  
            <ul>
                <div class="displayquery">                    
                    <h3>Display-query</h3> 
                    <a href="#" class="btn">Edis list</a>
                </div>     
                    <table>
                        <h>List of queries to configure display view. You can add and<br> <span>manage queries.</span></h>
                        <thead>
                            <div class="querylist">                    
                                <h4>Query list (30)</h4> 
                                <div class="listtoggle">
                                <h>Number of data included</h>
                                <label class="toggle" for="myToggle">
                                    <input class="toggle__input" name="" type="checkbox" id="myToggle">
                                    <div class="toggle__fill"></div>
                                </label>
                                </div>
                            </div>
                            <tr>
                                <td>Name</td>
                                <td>Price</td>
                                <td>Payment</td>
                                <td>Status</td>
                            </tr>
                        </thead>
                     <tbody>
                        <tr>
                           <td>Star Refrigerator</td> 
                           <td>$1200</td> 
                           <td>Paid</td> 
                            <td><span class="status delivered">Deliverd</span></td>
                        </tr>
                        <tr>
                            <td>Wall Fan/td> 
                            <td>$110</td> 
                            <td>Paid</td> 
                             <td><span class="status pending">Pending</span></td>
                         </tr>
                         <tr>
                            <td>Adidas Shoes</td> 
                            <td>$620</td> 
                            <td>Paid</td> 
                             <td><span class="status return">Return</span></td>
                         </tr>
                         <tr>
                            <td>Denim Shirts</td> 
                            <td>$110</td> 
                            <td>Due</td> 
                             <td><span class="status inprogress">In Progress</span></td>
                         </tr>
                         <tr>
                            <td>Casual Shoes</td> 
                            <td>$575</td> 
                            <td>Paid</td> 
                             <td><span class="status pending">Pending</span></td>
                         </tr>
                    </tbody>
                </table>
                </ul>    
            </div>
        </div>
      
           

        

    </div>        
</div>

    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
 
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