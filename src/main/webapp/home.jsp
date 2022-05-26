<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="xskt.model.Lottery" %>
<jsp:useBean id="hnDAO" class="xskt.dao.ListLotteryDAO" scope="page"></jsp:useBean>
<% 	Lottery hn = new Lottery(hnDAO.getLastLottery("Ha Noi")); 
	Lottery hcm = new Lottery(hnDAO.getLastLottery("Tp Ho Chi Minh"));
	Lottery dn = new Lottery(hnDAO.getLastLottery("Da Nang"));
%>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>Home example · Bootstrap v5.0</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <!-- Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

    <!-- Custom styles for this template -->
    <link href="css/home.css" rel="stylesheet">
    <style type="text/css">
    	td, th {
    		text-align: center;
    	}
    	td {
    		font-weight: bold;
    		font-size: 150%;
    		word-spacing: 20px;
    	}
    	th {
    		font-weight: normal;
    	}
    </style>
</head>

<body>
	<!-- Header -->
    <header class="sticky-top rounded shadow-sm pt-2" style="background-color:#084594;">
    	<div class="container">
    <!--         	 sticky-top  or fixed-top-->
    	<div class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 border-bottom">
            <a href="home.jsp" class="d-flex align-items-center text-light text-decoration-none">
                <span class="fs-4">Home</span>
            </a>

            <nav class="d-inline-flex mt-2 mt-md-0 ms-md-auto">
                <a class="me-3 py-2 text-light text-decoration-none" href="#features">Features</a>
                
                <c:if test="${userAccount != null }">
                 	<div class="nav-item text-nowrap">
			            <div class="float-end me-3">
			                <div class="dropdown">
			                    <a class="nav-link dropdown-toggle text-light" href="#" role="button" id="dropdownMenuLink"
			                        data-bs-toggle="dropdown" aria-expanded="false">
			                        <i class="bi bi-person-circle"></i>
			                    </a>
			                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
			                    	<li><a class="dropdown-item text-dark text-decoration-none" href="ChangePassword?email=${userAccount}">Edit profile</a></li>
			                        <li><a class="dropdown-item text-dark text-decoration-none" href="LogOut">Log out</a></li>
			                    </ul>
			                </div>
			            </div>
        			</div>
                </c:if>
                <c:if test="${userAccount == null}">
                 	<a class="me-3 py-2 text-light text-decoration-none" href="Login">Login</a>
                 	<a class="py-2 text-light text-decoration-none" href="SignUp">Sign up</a>
                </c:if>
            </nav>
        </div>
        </div>
    </header>
    <div class="container py-3">       
        <header>
            <div class="home-header p-3 pb-md-4 mx-auto text-center">
                <h1 class="display-4 fw-normal">XSKT.COM</h1>
                <p class="fs-5 text-muted"> 
                	Soi cầu xổ số ba miền và xổ số Vietlott chiều nay, hôm qua và những ngày trước đó.
                	<br>Soi cầu vé số trực tuyến hôm nay nhanh nhất, chính xác nhất.
                </p>
            </div>
        </header>
        
        <!-- Body -->
        <main>
        <!-- Form dò vé số -->
 
            	<jsp:include page="userFeatures/searchLottery.jsp"></jsp:include>

            <!-- Bảng kết quả sổ xố -->      
          	<h4 class="py-3 pt-5 border-top text-center">Kết quả xổ số mới nhất</h4>         	
<!--             ket qua xo so moi nhat -->
<!--             <nav> -->
<!-- 			  	<div class="nav nav-tabs" id="nav-tab" role="tablist"> -->
<!-- 			    	<button class="nav-link active" id="nav-hn-tab" data-bs-toggle="tab" data-bs-target="#nav-hn" type="button" role="tab" aria-controls="nav-hn" aria-selected="true">Hà Nội</button> -->
<!-- 			    	<button class="nav-link" id="nav-hcm-tab" data-bs-toggle="tab" data-bs-target="#nav-hcm" type="button" role="tab" aria-controls="nav-hcm" aria-selected="false">Hồ Chí Minh</button> -->
<!-- 			    	<button class="nav-link" id="nav-dn-tab" data-bs-toggle="tab" data-bs-target="#nav-dn" type="button" role="tab" aria-controls="nav-dn" aria-selected="false">Đà Nẵng</button> -->
<!-- 			  	</div> -->
<!-- 			</nav> -->
<!-- 			<div class="tab-content"> -->
<!-- 			  	<div class="tab-pane fade show active" id="nav-hn" role="tabpanel" aria-labelledby="nav-hn-tab"> -->
			  		<h6 class="py-3 border-top">Kết quả xổ số Hà Nội ngày: <%= hn.getNgay() %></h5>
			  		<table class="table table-bordered table-primary">
		                <thead class="table-light">
		                    <tr>
		                        <th scope="col">Giải</th>
		                        <th scope="col">Mã số</th>
		                    </tr>
		                </thead>
		                <tbody>
		                    <tr class="table-danger">
		                        <th scope="row">Giải đặc biệt</th>
		                        <td><%= hn.getDb() %></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải nhất</th>
		                        <td><%= hn.getG1() %></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải nhì</th>
		                        <td><%= hn.getG2() %></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải ba</th>
		                        <td><%= hn.getG3() %></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải tư</th>
		                        <td><%= hn.getG4() %></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải năm</th>
		                        <td><%= hn.getG5() %></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải sáu</th>
		                        <td><%= hn.getG6() %></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải bảy</th>
		                        <td><%= hn.getG7() %></td>
		                    </tr>
		                    
		                </tbody>
		            </table>
<!-- 			  	</div> -->
<!-- 			  	<div class="tab-pane fade" id="nav-hcm" role="tabpanel" aria-labelledby="nav-hcm-tab"> -->
			  		<h6 class="py-3 border-top">Kết quả xổ số Hồ Chí Minh ngày: <%= hcm.getNgay() %></h5>
			  		<table class="table table-bordered table-primary">
		                <thead class="table-light">
		                    <tr>
		                        <th scope="col">Giải</th>
		                        <th scope="col">Mã số</th>
		                    </tr>
		                </thead>
		                <tbody>
		                    <tr class="table-danger">
		                        <th scope="row">Giải đặc biệt</th>
		                        <td><%= hcm.getDb() %></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải nhất</th>
		                        <td><%= hcm.getG1() %></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải nhì</th>
		                        <td><%= hcm.getG2() %></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải ba</th>
		                        <td><%= hcm.getG3() %></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải tư</th>
		                        <td><%= hcm.getG4() %></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải năm</th>
		                        <td><%= hcm.getG5() %></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải sáu</th>
		                        <td><%= hcm.getG6() %></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải bảy</th>
		                        <td><%= hcm.getG7() %></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải tám</th>
		                        <td><%= hcm.getG8() %></td>
		                    </tr>
		                </tbody>
		            </table>
<!-- 			  	</div> -->
<!-- 			  	<div class="tab-pane fade" id="nav-dn" role="tabpanel" aria-labelledby="nav-dn-tab"> -->
			  		<h6 class="py-3 border-top">Kết quả xổ số Đà Nẵng ngày: <%= dn.getNgay() %></h5>
			  		<table class="table table-bordered table-primary">
		                <thead class="table-light">
		                    <tr>
		                        <th scope="col">Giải</th>
		                        <th scope="col">Mã số</th>
		                    </tr>
		                </thead>
		                <tbody>
		                    <tr class="table-danger">
		                        <th scope="row">Giải đặc biệt</th>
		                        <td><%= dn.getDb() %></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải nhất</th>
		                        <td><%= dn.getG1() %></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải nhì</th>
		                        <td><%= dn.getG2() %></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải ba</th>
		                        <td><%= dn.getG3() %></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải tư</th>
		                        <td><%= dn.getG4() %></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải năm</th>
		                        <td><%= dn.getG5() %></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải sáu</th>
		                        <td><%= dn.getG6() %></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải bảy</th>
		                        <td><%= dn.getG7() %></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải tám</th>
		                        <td><%= dn.getG8() %></td>
		                    </tr>
		                </tbody>
		            </table>
<!-- 			  	</div> -->
<!-- 			</div>  -->

			<!-- Bảng kết quả sổ xố -->      
          	 
				
			<form class="row g-3 mt-5" id="sLot" action="SearchLottery">
				<h3 class="col">Xem kết quả xổ số</h3> 		    
			    <div class="col-md-4">
			    	<div class="input-group mb-3">
				        <select class="form-select" id="validationCustom04" name="p" required>
				            <option selected disabled value="">Chọn tỉnh</option>
				            <option value="Ha Noi">Ha Noi</option>
            				<option value="Da Nang">Da Nang</option>
            				<option value="Tp Ho Chi Minh">Ho Chi Minh</option>
				        </select>
				        <input type="date" class="form-control" id="validationCustom01" name="d" required>
			    		<button class="btn btn-primary pt-auto" type="submit">Tìm kiếm</button>
			    	</div>		        
			    </div>
			</form>	
<!-- 			tim kiem ve so -->
			<c:choose>
				<c:when test="${!searchLottery.isEmpty()}">
			  		<h6 class="py-3 border-top">Kết quả xổ số <c:out value="${searchLottery.getTinhDo()}"/> ngày: <c:out value="${searchLottery.getNgay()}"/></h5>
			  		<table class="table table-bordered table-primary">
		                <thead class="table-light">
		                    <tr>
		                        <th scope="col">Giải</th>
		                        <th scope="col">Mã số</th>
		                    </tr>
		                </thead>
		                <tbody>
		                    <tr class="table-danger">
		                        <th scope="row">Giải đặc biệt</th>
		                        <td><c:out value="${searchLottery.getDb()}"/></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải nhất</th>
		                        <td><c:out value="${searchLottery.getG1()}"/></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải nhì</th>
		                        <td><c:out value="${searchLottery.getG2()}"/></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải ba</th>
		                        <td><c:out value="${searchLottery.getG3()}"/></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải tư</th>
		                        <td><c:out value="${searchLottery.getG4()}"/></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải năm</th>
		                        <td><c:out value="${searchLottery.getG5()}"/></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải sáu</th>
		                        <td><c:out value="${searchLottery.getG6()}"/></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải bảy</th>
		                        <td><c:out value="${searchLottery.getG7()}"/></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">Giải tám</th>
		                        <td><c:out value="${searchLottery.getG8()}"/></td>
		                    </tr>
		                </tbody>
		            </table>
		            <c:if test="${searchLottery.getDb() != null}">
			            <script type="text/javascript">
				            window.onload = function() {
				                var el = document.getElementById('sLot');
				                el.scrollIntoView(true);
				            }
			            </script>
		            </c:if>
		            
				</c:when>
				<c:when test="${searchLottery.isEmpty()}">
					<h5 class="py-3 pt-5 border-top text-center">Không tìm thấy vé số, vui lòng thử lại.</h5> 
					<script type="text/javascript">
			            window.onload = function() {
			                var el = document.getElementById('sLot');
			                el.scrollIntoView(true);
			            }
		            </script>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>        
            <!-- Đường link tính năng -->
            <div class="row pt-4 my-md-5 pt-md-5 border-top" id="features">
                <div class="col-sm-6">
                    <div class="h-100 p-5 bg-light border rounded-3">
                        <h2>Dò vé số</h2>
                        <p>Chức năng dò vé số cho phép nhập số vé cần dò và thông báo kết quả trúng thưởng. Đăng nhập để sử dụng</p>
<%--                          <c:if test="${userAccount != null }"> --%>
                         	<a class="btn btn-outline-secondary" href="#">Go to</a>
<%--                          </c:if> --%>
<%--                          <c:if test="${userAccount == null }"> --%>
<!--                          	<span class="d-inline-block" tabindex="0" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="Login to use"> -->
<!--   								<button class="btn btn-primary" type="button" disabled>Go to</button> -->
<!-- 							</span> -->
<%--                          </c:if> --%>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="h-100 p-5 bg-light border rounded-3">
                        <h2>Lịch sử dò vé</h2>
                        <p>Chức năng cho phép xem lại lịch sử dò vé của bạn. Đăng nhập để sử dụng.</p>
                        <c:if test="${userAccount != null }">
                         	<a class="btn btn-outline-secondary" href="#">Go to</a>
                         </c:if>
                         <c:if test="${userAccount == null }">
                         	<span class="d-inline-block" tabindex="0" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="Login to use">
  								<button class="btn btn-primary" type="button" disabled>Go to</button>
							</span>
                         </c:if>
                    </div>
                </div>
            </div>
        </main>
        <!-- Footer -->
        <footer class="pt-4 my-md-5 pt-md-5 border-top border-bottom bg-light">
            <div class="row">
<!--                 <div class="col-4 col-md d-flex flex-column align-items-center"> -->
<!--                     <h5>Features</h5> -->

<!--                     <a class="link-secondary text-decoration-none" href="#">Cool stuff</a> -->
<!--                     <a class="link-secondary text-decoration-none" href="#">Random feature</a> -->
<!--                     <a class="link-secondary text-decoration-none" href="#">Team feature</a> -->
<!--                     <a class="link-secondary text-decoration-none" href="#">Stuff for -->
<!--                         developers</a> -->
<!--                     <a class="link-secondary text-decoration-none" href="#">Another one</a> -->
<!--                     <a class="link-secondary text-decoration-none" href="#">Last time</a> -->
<!--                 </div> -->
<!--                 <div class="col-4 col-md d-flex flex-column align-items-center"> -->
<!--                     <h5>Resources</h5> -->

<!--                     <a class="link-secondary text-decoration-none" href="#">Resource</a> -->
<!--                     <a class="link-secondary text-decoration-none" href="#">Resource name</a> -->
<!--                     <a class="link-secondary text-decoration-none" href="#">Another resource</a> -->
<!--                     <a class="link-secondary text-decoration-none" href="#">Final resource</a> -->
<!--                 </div> -->
<!--                 <div class="col-4 col-md d-flex flex-column align-items-center"> -->
<!--                     <h5>About</h5> -->

<!--                     <a class="link-secondary text-decoration-none" href="#">Team</a> -->
<!--                     <a class="link-secondary text-decoration-none" href="#">Locations</a> -->
<!--                     <a class="link-secondary text-decoration-none" href="#">Privacy</a> -->
<!--                     <a class="link-secondary text-decoration-none" href="#">Terms</a> -->
<!--                 </div> -->
                <div class="col-12 col-md text-center">
                    <small class="d-block my-3 pt-3 text-muted border-top">Copyright &copy; Your Website 2022</small>
                </div>
            </div>
        </footer>
    </div>
    <!-- bootstrap script -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous">
    </script>
    <script>
    	var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
    	var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
      		return new bootstrap.Popover(popoverTriggerEl, {placement: 'top'})
    	})
    </script>
</body>

</html>