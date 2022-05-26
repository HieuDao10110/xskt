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
                        <div class="card">
                            <div class="card-body py-5 px-md-5">
                                <form action="Login" method="post">
                                    <h3 class="mb-5 text-center">Login</h3>
                                    <!-- Register buttons -->
                                    <div class="text-center">
                                        <p>Login with:</p>
                                        <a type="button" class="btn btn-link btn-floating mx-1" href="<%=fbConnection.getFBAuthUrl()%>">
                                            <i class="bi bi-facebook"></i>
                                        </a>

                                        <button type="button" class="btn btn-link btn-floating mx-1">
                                            <i class="bi bi-google"></i>
                                        </button>
                                    </div>
                                    <p class="text-center">Or:</p>

                                    <!-- Email input -->
                                    <div class="form-outline mb-4">
                                    	<label class="form-label" for="formLoginEmail">Email address</label>
                                        <input type="email" id="formLoginEmail" class="form-control" name="email" value="${fillUser}" required/>
                                       
                                        <div class="invalid-feedback">Account does not exist.</div>
                                    </div>

                                    <!-- Password input -->
                                    <div class="form-outline mb-4">
                                    	<label class="form-label" for="formLoginPass">Password</label>
                                        <input type="password" id="formLoginPass" class="form-control" name="password" required/>
                                        
                                        <div class="invalid-feedback">Incorrect password.</div>
                                    </div>

                                    <!-- 2 column grid layout -->
                                    <div class="row mb-4">
                                        <div class="col-md-6 d-flex justify-content-center">
                                            <!-- Checkbox -->
                                            <div class="form-check mb-3 mb-md-0">
                                                <input class="form-check-input" type="checkbox" name="remember" value="yes" id="loginCheck"
                                                    checked />
                                                <label class="form-check-label" for="loginCheck"> Remember me </label>
                                            </div>
                                        </div>

                                        <div class="col-md-6 d-flex justify-content-center">
                                            <!-- Simple link -->
                                            <a href="resetPassword.jsp">Forgot password?</a>
                                        </div>
                                    </div>

                                    <!-- Submit button -->
                                    <button type="submit" class="btn btn-primary btn-block mb-4 w-100">
                                        Login
                                    </button>

                                    <!-- Register buttons -->
                                    <div class="text-center">
                                        <p>Not a member? <a href="signUpForm.jsp">Register</a> - <a href="home.jsp">Home</a></p>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 mb-5 mb-lg-0">
                        <h1 class="my-5 display-3 fw-bold ls-tight">
                            The best result <br />
                            <span class="text-primary">for your search</span>
                        </h1>
                        <p style="color: #757f8e">
                            Find lottery tickets online today fastest, most accurate. Check the three regions lottery and Vietlott lottery this afternoon, yesterday and the previous days.
                        </p>
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
    <script type="text/javascript">
	    var email = document.getElementById("formLoginEmail");
	    email.classList.remove("is-invalid");
	    var pass = document.getElementById("formLoginEmail");
	    pass.classList.remove("is-invalid");
    </script>
    <c:if test="${wrong == 'email'}">
	    <script type="text/javascript">
	    	var wrongEmail = document.getElementById("formLoginEmail");
	    	wrongEmail.classList.add("is-invalid");       	    
	    </script>
    </c:if>
    <c:if test="${wrong == 'pass'}">
	    <script type="text/javascript">
	    	var wrongPass = document.getElementById("formLoginPass");
	    	wrongPass.classList.add("is-invalid");       	    
	    </script>
    </c:if>
</body>

</html>