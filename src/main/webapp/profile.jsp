<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>Home example · Bootstrap v5.0</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
        crossorigin="anonymous">

    <!-- Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

    <!-- Custom styles for this template -->
    <link href="css/home.css" rel="stylesheet">
</head>

<body>
    <!-- Header -->
    <header class="sticky-top shadow-sm pt-2" style="background-color:#084594;">
        <div class="container">
            <!--         	 sticky-top  or fixed-top-->
            <div class="d-flex flex-column flex-md-row align-items-center pb-3">
                <a href="home.jsp" class="d-flex align-items-center text-light text-decoration-none">
                    <span class="fs-4">Home</span>
                </a>

                <nav class="d-inline-flex mt-2 mt-md-0 ms-md-auto">
                    <a class="me-3 py-2 text-light text-decoration-none" href="#features">Features</a>
                    <c:if test="${userAccount != null }">
                        <div class="nav-item text-nowrap">
                            <div class="float-end me-3">
                                <div class="dropdown">
                                    <a class="nav-link dropdown-toggle text-light" href="#" role="button"
                                        id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="bi bi-person-circle"></i>
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                        <li><a class="dropdown-item text-dark text-decoration-none"
                                                href="#">Edit profile</a></li>
                                        <li><a class="dropdown-item text-dark text-decoration-none"
                                                href="LogOut">Log out</a></li>
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

    <!-- main -->
    <div class="container-fluid">
        <div class="row d-flex">
            <!-- side bar -->
            <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark"> 
                <div
                    class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                    <a href="#"
                        class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                        <span class="fs-5 d-none d-sm-inline">Menu</span>
                    </a>
                    <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start"
                    role="tablist">
                        <li class="w-100" role="presentation">
                            <a href="#" class="nav-link px-0 align-middle active" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="true">
                                <i class="fs-4 bi-people px-1"></i> <span
                                    class="ms-1 pe-1 d-none d-sm-inline">Profile</span> </a>
                        </li>                             
                        <li class="w-100" role="presentation">
                            <a href="#" class="nav-link px-0 align-middle" id="pills-contact-tab" data-bs-toggle="pill" data-bs-target="#pills-contact" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">
                                <i class="fs-4 bi-table px-1"></i> <span
                                    class="ms-1 pe-1 d-none d-sm-inline">Search history</span></a>
                        </li>                                                 
                    </ul>
                    <hr>
                </div>
            </div>

            <!-- Content -->                   
            <div class="col tab-content" id="pills-tabContent">                       
                <div class="container rounded tab-pane fade show active" style="background-color:#EEEEEE;" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                     <h3 class="mb-3 pt-3">Customers</h3>
                    <div class="row">
                        <div class="col-md-4 border-end d-flex justify-content-center"
                            style="background-color:#084594; color: white;">
                            <div class="d-flex flex-column align-items-center text-center pt-1 pb-5 my-auto">
                                <svg xmlns="http://www.w3.org/2000/svg" width="90" height="90" fill="#FFD32D"
                                    class="bi bi-person-circle" viewBox="0 0 16 16">
                                    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                                    <path fill-rule="evenodd"
                                        d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                                </svg>
                                <span>User name: ${account.getName()}</span>
                                <span>Email: ${account.getUsr()}</span>
                                <span>Phone number: ${account.getPhone()}</span>
                            </div>
                        </div>
                        <div class="col-md-8 bg-light">
                            <div class="p-3 py-5">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h6 class="text-right">Edit Profile</h6>
                                    <div class="d-flex flex-row align-items-center back">
                                        <i class="bi bi-arrow-left mr-1"></i>
                                        <a href="home.jsp" class="text-decoration-none text-dark">Back to home</a>
                                    </div>
                                </div>
                                <form action="ChangePassword" class="needs-validation" method="post" novalidate>
                                    <div class="row mt-2">
                                        <div class="col-md-12">
                                            <div class="input-group mb-3">
                                                <span class="input-group-text" id="basic-addon1">Email</span>
                                                <input type="text" class="form-control" value="${account.getUsr()}"
                                                    aria-describedby="basic-addon1" disabled readonly>
                                                <input type="text" name="email" value="${account.getUsr()}" hidden>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-md-12">
                                            <label for="inputOldPass">Old password<span class="text-danger fw-bold">
                                                    *</span></label>
                                            <input id="inputOldPass" type="password" class="form-control" name="oldPass"
                                                placeholder="Old password">
                                            <div class="valid-feedback">Look good!</div>
                                            <div class="invalid-feedback">Incorrect password</div>
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-md-6">
                                            <label for="inputPassword">New password<span class="text-danger fw-bold">
                                                    *</span></label>
                                            <input id="inputPassword" type="password" class="form-control" name="newPass"
                                                placeholder="New password"
                                                pattern="^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$">
                                            <div class="valid-feedback">Looks good!</div>
                                            <div class="invalid-feedback">Invalid password. Password should have at least
                                                eight characters and include at least one uppercase, one lowercase, one
                                                special character.</div>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="inputConfirmPassword">Confirm new password<span
                                                    class="text-danger fw-bold"> *</span></label>
                                            <input id="inputConfirmPassword" type="password" class="form-control"
                                                name="confirmNewPass" placeholder="Confirm new password">
                                            <div class="valid-feedback">Match!</div>
                                            <div class="invalid-feedback">Incorrect. Re-entered password does not match.
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-md-12">
                                            <label for="inputName">Name</label>
                                            <input id="inputName" type="text" class="form-control" name="name"
                                                value="${account.getName()}" placeholder="Name">
                                            <div class="valid-feedback">Looks good!</div>
                                            <div class="invalid-feedback">Please enter a name.</div>
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-md-12">
                                            <label for="inputPhone">Phone number</label>
                                            <input id="inputPhone" type="text" class="form-control" name="phone"
                                                value="${account.getPhone()}" placeholder="Phone">
                                            <div class="valid-feedback">Looks good!</div>
                                            <div class="invalid-feedback">Please enter a phone number.</div>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-end align-items-center mb-3">
                                        <div class="mt-5 me-2 text-right">
                                            <button class="btn btn-primary" type="button" data-bs-toggle="modal"
                                                data-bs-target="#updateBackdrop">Save Profile</button>
                                            <div class="modal fade" id="updateBackdrop" data-bs-backdrop="static"
                                                data-bs-keyboard="false" tabindex="-1" aria-labelledby="updateBackdropLabel"
                                                aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="updateBackdropLabel">Edit profile
                                                            </h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            Are you sure you want to save this change?
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="submit" class="btn btn-primary"
                                                                data-bs-dismiss="modal" id="myAnchor">Save</button>
                                                            <button type="button" class="btn btn-secondary"
                                                                data-bs-dismiss="modal">Close</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mt-5 text-right"><a class="btn btn-secondary" type="button"
                                                href="home.jsp">Cancel</a></div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container rounded tab-pane fade" style="background-color:#EEEEEE;" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
                    <h3 class="mb-3 pt-3">Search history</h3>
                    <table class="table table-striped">
                        <thead>
                          <tr>
                            <th scope="col">Time</th>
                            <th scope="col">Province</th>
                            <th scope="col">Number</th>
                            <th scope="col">Date</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach items="${searchHistory}" var="sh">
	                          <tr>
	                            <td>${sh.getTime()}</td>
	                            <td>${sh.getProvince()}</td>
	                            <td>${sh.getNumber()}</td>
	                            <td>${sh.getDate()}</td>
	                          </tr>
                          </c:forEach>                      
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    
    <!-- bootstrap script -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous">
        </script>
    <script type="text/javascript">
        // valid comfirm password

        var pw = document.getElementById("inputPassword");
        var cpw = document.getElementById("inputConfirmPassword");
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
    <c:if test="${oldPass = 'incorrect'}">
        <script type="text/javascript">
            var opw = document.getElementById("inputOldPass");
            opw.classList.add("is-invalid");
        </script>
    </c:if>
</body>

</html>