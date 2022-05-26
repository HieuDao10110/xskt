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
    <title>Account - SB Admin</title>
    <!-- bootstrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- bootstrap icon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <!-- custom css -->
    <link href="admin/css/styles.css" rel="stylesheet" />
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
                    <h1 class="h2">Add Account</h1>
                </div>
                <p>Note:<span class="text-danger fw-bold"> *</span> Field required</p>
                <!-- table -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3" style="background-color: #33444e; color: white;">
                        <h6 class="m-0 font-weight-bold">Add an account to database</h6>
                    </div>
                    <div class="card-body">
                        <form class="row g-3 needs-validation" action="AddAccount" method="post" novalidate>
                            <div class="col-md-6">
                                <label for="inputEmail" class="form-label">Email<span class="text-danger fw-bold"> *</span></label>
                                <input type="email" class="form-control" name="email" id="inputEmail"
                                    placeholder="Enter email" required pattern="^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$">
                                <div class="valid-feedback">Looks good!</div>
                                <div class="invalid-feedback">Invalid email. Please enter an email.</div>
                            </div>
                            <div class="col-md-6">
                                <label for="inputName" class="form-label">Name</label>
                                <input type="text" class="form-control" name="name" id="inputName"
                                    placeholder="Enter name">
                                <div class="valid-feedback">Looks good!</div>
                                <div class="invalid-feedback">Please enter a name.</div>
                            </div>
                            <div class="col-md-3">
                                <label for="inputPassword" class="form-label">Password<span class="text-danger fw-bold"> *</span></label>
                                <input type="password" class="form-control" name="pw" id="inputPassword"
                                    placeholder="Enter password" required pattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=.\\-_*])([a-zA-Z0-9@#$%^&+=*.\\-_]){8,}$">
                            	<div class="valid-feedback">Looks good!</div>
                                <div class="invalid-feedback">Invalid password. Password should have at least eight characters and include at least one uppercase, one lowercase, one special character.</div>
                            </div>
                            <div class="col-md-3">
                                <label for="inputConfirmPassword" class="form-label">Confirm password<span class="text-danger fw-bold"> *</span></label>
                                <input type="password" class="form-control" name="cpw" id="inputConfirmPassword"
                                    placeholder="Re-enter password" required>
                            	<div class="valid-feedback">Match!</div>
                                <div class="invalid-feedback">Incorrect. Re-entered password does not match.</div>
                            </div>
                            <div class="col-md-3">
                                <label for="inputStatus" class="form-label">Verified</label>
                                <select id="inputStatus" class="form-select" name="status">
                                    <option value="0" selected>No</option>
                                    <option value="1">Yes</option>
                                </select>
                                <div class="valid-feedback">Looks good!</div>
                                <div class="invalid-feedback">Please choose a status.</div>
                            </div>
                            <div class="col-md-3">
                                <label for="inputRole" class="form-label">Role</label>
                                <select id="inputRole" class="form-select" name="role">
                                    <option value="0" selected>User</option>
                                    <option value="1">Admin</option>
                                </select>
                                <div class="valid-feedback">Looks good!</div>
                                <div class="invalid-feedback">Please choose a role.</div>
                            </div>
                            <div class="col-md-6">
                                <label for="inputPhone" class="form-label">Phone number</label>
                                <input type="text" class="form-control" name="phone" id="inputPhone"
                                    placeholder="Enter phone number">
                                <div class="valid-feedback">Looks good!</div>
                                <div class="invalid-feedback">Please enter a phone number.</div>
                            </div>
                            <div class="col-md-3">
                                <label for="inputLogin" class="form-label">Last time login</label>
                                <input type="date" class="form-control" name="login" id="inputLogin" disabled>
                            </div>
                            <div class="col-md-3">
                                <label for="inputSignUp" class="form-label">Sign up date</label>
                                <input type="date" class="form-control" name="signUp" id="inputSignUp" disabled>
                            </div>
                            <div class="col-12 d-flex justify-content-end">
                                <!-- create account button -->
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                    data-bs-target="#updateBackdrop">Submit</button>
                                <!-- Modal -->
                                <div class="modal fade" id="updateBackdrop" data-bs-backdrop="static"
                                    data-bs-keyboard="false" tabindex="-1" aria-labelledby="updateBackdropLabel"
                                    aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="updateBackdropLabel">Add account</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                Are you sure you want to create this account?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                    data-bs-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-primary"
                                                    data-bs-dismiss="modal" id="myAnchor">Create</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- cancel create account button -->
                                <a type="button" class="btn btn-secondary ms-1" href="ListAccount">Cancel</a>
                            </div>
                        </form>
                    </div>
                </div>
            </main>
        </div>
    </div>
    <!-- footer -->	
	<jsp:include page="footer.jsp"></jsp:include>
	
	<!-- script below here -->
    <!-- bootstrap script -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous">
    </script>
    <script>
        // show navbar
        var d = document.getElementById("customers-collapse");
        d.classList.add("show");
        var d = document.getElementById("customers-collapse2");
        d.classList.remove("text-dark");
        // stopPropagation submit create account form
        document.getElementById("myAnchor").addEventListener("click", function(event){
        	  event.stopPropagation();
        });
        // valid comfirm password
        var pw = document.getElementById("inputPassword");
        var cpw = document.getElementById("inputConfirmPassword");
        var em = document.getElementById("inputEmail");
        var na = document.getElementById("inputName");
        var ro = document.getElementById("inputRole");
        var st = document.getElementById("inputStatus");
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
                        if (ro.checkValidity()) {
                            ro.classList.remove("is-invalid");
                            ro.classList.add("is-valid");
                        } else {
                            ro.classList.remove("is-valid");
                            ro.classList.add("is-invalid");
                        }
                        if (st.checkValidity()) {
                            st.classList.remove("is-invalid");
                            st.classList.add("is-valid");
                        } else {
                            st.classList.remove("is-valid");
                            st.classList.add("is-invalid");
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
</body>
</html>