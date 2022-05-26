<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Dashboard - SB Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link href="css/styles.css" rel="stylesheet" />
</head>

<body>
	<!-- header -->
	<jsp:include page="header.jsp"></jsp:include>
	
    <div class="container-fluid">
        <div class="row">
            <!-- sidebar -->
			<jsp:include page="sidebar.jsp"></jsp:include>
			
            <!-- content -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <div
                    class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom border-2">
                    <h1 class="h2">Dashboard</h1>
                </div>
                <div class="row">
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card h-100">
                            <div class="card-header" style="background-color: #ff5a60; color: white;">
                                <h5 class="card-title">Account table</h5>
                            </div>
                            <div class="card-body d-flex align-items-start flex-column">
                                <p class="card-text">Show list of accounts. You can search, update or delete an account.</p>
                                <a href="/xskt/ListAccount" class="btn btn-primary mt-auto">Go to page</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card h-100">
                            <div class="card-header" style="background-color: #fcbd34; color: white;">
                                <h5 class="card-title">Add account</h5>
                            </div>
                            <div class="card-body d-flex align-items-start flex-column">
                                <p class="card-text">You can add an account to the database.</p>
                                <a href="/xskt/AddAccount" class="btn btn-primary mt-auto">Go to page</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card h-100">
                            <div class="card-header" style="background-color: #6db432; color: white;">
                                <h5 class="card-title">Data table</h5>
                            </div>
                            <div class="card-body d-flex align-items-start flex-column">
                                <p class="card-text">Display list of lottery results. You can search, update or delete a lottery data record.</p>
                                <a href="/xskt/ListLottery" class="btn btn-primary mt-auto">Go to page</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card h-100">
                            <div class="card-header" style="background-color: #853b92; color: white;">
                                <h5 class="card-title">Add data</h5>
                            </div>
                            <div class="card-body d-flex align-items-start flex-column">
                                <p class="card-text">You can add a record of lottery results to the database.
                                    content.</p>
                                <a href="/xskt/AddLottery" class="btn btn-primary mt-auto">Go to page</a>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
    <!-- footer -->	
	<jsp:include page="footer.jsp"></jsp:include>
	
	<!-- script below here -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous">
    </script>
    <script>
    	var d = document.getElementById("dashboard-collapse");
    	d.classList.add("active");
    </script>	
</body>
</html>