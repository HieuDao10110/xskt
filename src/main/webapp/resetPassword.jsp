<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="xskt.context.FBContext"%>
<%
	FBContext fbConnection = new FBContext();
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link href="css/styles.css" rel="stylesheet" />
</head>

<body>
    <!-- Section: Design Block -->
    <section class="">
        <!-- Jumbotron -->
        <div class="px-4 py-5 px-md-5 text-center text-lg-start" style="background-color: hsl(0, 0%, 96%)">
            <div class="container">
                <div class="row gx-lg-5 align-items-center">
                    <div class="col-lg-6 mb-5 mb-lg-0">
                        <h1 class="my-5 display-3 fw-bold ls-tight">
                            The best result <br />
                            <span class="text-primary">for your search</span>
                        </h1>
                        <p style="color: #757f8e">
                            Find lottery tickets online today fastest, most accurate. Check the three regions lottery and Vietlott lottery this afternoon, yesterday and the previous days.
                        </p>
                    </div>

                    <div class="col-lg-6 mb-5 mb-lg-0">
                        <div class="card">
                            <div class="card-body py-5 px-md-5">
                                <form action="ResetPasswordUser" method="post">
                                    <h3 class="mb-5 text-center">Reset password</h3>
                                    <div class="alert alert-success bg-soft-primary border-0" role="alert">
                        				Enter your email address and we'll send you an email with instructions to reset your password.
                    				</div> 
                                    
                                    <!-- Email input -->
                                    <div class="form-outline mb-4">
                                    	<label class="form-label" for="inputEmail">Email address</label>
                                   		<input type="email" id="inputEmail" name="email" class="form-control" placeholder="Enter email" required pattern="^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"/>                                       
                                    </div>                                              

                                    <!-- Submit button -->
                                    <button type="submit" class="btn btn-primary btn-block mb-4 w-100">
                                        Reset password
                                    </button>

                                    <!-- Register buttons -->
                                    <div class="text-center">
                                        <p>or login with:</p>
                                        <button type="button" class="btn btn-link btn-floating mx-1">
                                            <i class="bi bi-facebook"></i>
                                        </button>

                                        <button type="button" class="btn btn-link btn-floating mx-1">
                                            <i class="bi bi-google"></i>
                                        </button>
                                    </div>

                                    <!-- Register buttons -->
                                    <div class="text-center">
                                        <p>Have an account ? <a href="Login">Login</a> - <a
                                        href="home.jsp">Home</a></p>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Jumbotron -->
    </section>
    <!-- Section: Design Block -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
    </script>  
</body>

</html>