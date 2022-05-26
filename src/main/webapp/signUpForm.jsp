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
                                <form action="SignUp" method="post" novalidate class="needs-validation">
                                    <h3 class="mb-5 text-center">Sign up</h3>
                                    <!-- 2 column grid layout with text inputs for the full name and phone number -->
                                    <div class="row">
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                            	<label class="form-label" for="inputName" placeholder="Enter name">Full name</label>
                                                <input type="text" id="inputName" name="name" class="form-control" placeholder="Enter name"/>
                                                <div class="valid-feedback">Looks good!</div>
                                				<div class="invalid-feedback">Please enter a name.</div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                            	<label class="form-label" for="inputPhone" placeholder="Enter phone number">Phone number</label>
                                                <input type="text" id="inputPhone" name="phone" class="form-control" placeholder="Enter phone number"/>
                                                <div class="valid-feedback">Looks good!</div>
                                				<div class="invalid-feedback">Please enter a phone number.</div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Email input -->
                                    <div class="form-outline mb-4">
                                    	<label class="form-label" for="inputEmail">Email address</label>
                                   		<input type="email" id="inputEmail" name="email" class="form-control" placeholder="Enter email" required pattern="^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"/>
										<div class="valid-feedback">Looks good!</div>
										<c:if test="${isExistEmail != 'yes'}">
										    <div class="invalid-feedback">Invalid email. Please enter an email.</div>
									    </c:if>
                                		<c:if test="${isExistEmail == 'Yes'}">
										    <div class="invalid-feedback">Registered account already exists. Please enter another email.</div>
									    </c:if>                                       
                                    </div>

                                    <!-- Password input -->
                                    <div class="row">
                                    	<div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                            	<label class="form-label" for="inputPassword">Password</label>
                                        		<input type="password" id="inputPassword" name="password" class="form-control" placeholder="Enter password" required pattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=.\\-_*])([a-zA-Z0-9@#$%^&+=*.\\-_]){8,}$"/>
                                        		<div class="valid-feedback">Looks good!</div>
                                				<div class="invalid-feedback">Invalid password. Password should have at least eight characters and include at least one uppercase, one lowercase, one special character.</div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                            	<label class="form-label" for="inputConfirmPassword">Password</label>
                                        		<input type="password" id="inputConfirmPassword" name="confirmPass" class="form-control" placeholder="Re-enter password" required/>
                                        		<div class="valid-feedback">Match!</div>
                                				<div class="invalid-feedback">Incorrect. Re-entered password does not match.</div>
                                            </div>
                                        </div>
                                    </div>                           

                                    <!-- Submit button -->
                                    <button type="submit" class="btn btn-primary btn-block mb-4 w-100">
                                        Sign up
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
    <script type="text/javascript">
 // valid comfirm password
    var pw = document.getElementById("inputPassword");
    var cpw = document.getElementById("inputConfirmPassword");
    var em = document.getElementById("inputEmail");
    var na = document.getElementById("inputName");
    var ph = document.getElementById("inputPhone");

    var regexPass = "/^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=.\\-_*])([a-zA-Z0-9@#$%^&+=*.\\-_]){8,}$/";
    var regexEmail = "/^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/";
 // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function () {
        'use strict'

        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.querySelectorAll('.needs-validation')

        // Loop over them and prevent submission
        Array.prototype.slice.call(forms)
            .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    if (em.checkValidity()) {
                        em.classList.remove("is-invalid");
                        em.classList.add("is-valid");
                    } else {
                        em.classList.remove("is-valid");
                        em.classList.add("is-invalid");
                    }
                    if (na.checkValidity()) {
                        na.classList.remove("is-invalid");
                        na.classList.add("is-valid");
                    } else {
                        na.classList.remove("is-valid");
                        na.classList.add("is-invalid");
                    }
                    var pw1 = document.getElementById("inputPassword").value;
                    var cpw1 = document.getElementById("inputConfirmPassword").value;
                    if (pw.checkValidity()) {
                        pw.classList.remove("is-invalid");
                        pw.classList.add("is-valid");                           
                        if (cpw1 == pw1) {
                            cpw.classList.remove("is-invalid");
                            cpw.classList.add("is-valid");
                        } else {
                            cpw.classList.remove("is-valid");
                            cpw.classList.add("is-invalid");
                        }
                    } else {
                        pw.classList.remove("is-valid");
                        pw.classList.add("is-invalid");
                        cpw.classList.remove("is-invalid");
                        cpw.classList.remove("is-valid");
                    }                   
                    if (ph.checkValidity()) {
                        ph.classList.remove("is-invalid");
                        ph.classList.add("is-valid");
                    } else {
                        ph.classList.remove("is-valid");
                        ph.classList.add("is-invalid");
                    }
                }, false)
            })
    })();
    </script>
    <c:if test="${isValid != null}">
	    <script type="text/javascript">
	    	var wrongEmail = document.getElementById("formLoginEmail");
	    	wrongEmail.classList.add("is-invalid");
	    </script>
    </c:if>
</body>

</html>