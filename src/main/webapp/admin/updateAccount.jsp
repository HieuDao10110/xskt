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
                    <h1 class="h2">Modify Account</h1>
                </div>
                <p>Note: leave blank = no update changes</p>
                <!-- table -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3" style="background-color: #33444e; color: white;">
                        <h6 class="m-0 font-weight-bold">Update or delete account</h6>
                    </div>
                    <div class="card-body">
                        <form class="row g-3 needs-validation" action="UpdateAccount" id="myForm12" method="post" novalidate>
                            <div class="col-md-6">
                                <label for="inputEmail" class="form-label">Email</label>
                                <c:choose>
                                	<c:when test="${sessionScope.adminAccount == 2}">
                                		<input type="email" class="form-control" id="inputEmail"
	                                    placeholder="Enter new email" name="newEmail" value="${account.getUsr()}">
                                	</c:when>
                                	<c:otherwise>
	                                	<input type="email" class="form-control" id="inputEmail"
	                                    placeholder="${account.getUsr()}" disabled>	
                                	</c:otherwise>
                                </c:choose>
                                 <input type="hidden" name="email" value="${account.getUsr()}">
                                <div class="valid-feedback">Looks good!</div>
                                <div class="invalid-feedback">Invalid email.</div>         
                            </div>
                            <div class="col-md-6">
                                <label for="inputPassword" class="form-label">Password</label>
                                <c:choose>
                                	<c:when test="${sessionScope.adminAccount == 2}">
                                		<input type="password" class="form-control" id="inputPassword"
	                                    placeholder="Enter new password" name="pw" pattern="^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$">
                                	</c:when>
                                	<c:otherwise>
	                                	<input type="password" class="form-control" name="pw" id="inputPassword"
                                    placeholder="No editing allowed" disabled>
                                	</c:otherwise>
                                </c:choose>               
                            	<div class="valid-feedback">Looks good!</div>
                                <div class="invalid-feedback">Invalid password. Password should have at least eight characters and include at least one uppercase, one lowercase, one special character.</div>
                            </div>
                            <div class="col-md-6">
                                <label for="inputName" class="form-label">Name</label>
                                <input type="text" class="form-control" name="name" id="inputName"
                                    placeholder="New name" value="${account.getName()}">
                            </div>
                            <div class="col-md-3">
                                <label for="inputStatus" class="form-label">Verified</label>
                                <select id="inputStatus" class="form-select" name="status">
                                    <option selected value="default">Choose...</option>
                                    <option value="0">No</option>
                                    <option value="1">Yes</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <label for="inputRole" class="form-label">Role: <span class="fw-bold fs-6">
                                	<c:choose>
                                		<c:when test="${account.getRole() == 2}">Manager</c:when>
                                		<c:when test="${account.getRole() == 1}">Admin</c:when>
                                		<c:otherwise>User</c:otherwise>
                                	</c:choose>                       		
                                </span></label>
                                <c:choose>
                               		<c:when test="${sessionScope.adminAccount == 2 && account.getRole() != 2}">
	                               		<select id="inputRole" class="form-select" name="role">	                                	
		                                    <option selected value="default">Choose...</option>
		                                    <option value="0">User</option>
		                                    <option value="1">Admin</option>		                                    
		                                </select>
                               		</c:when>
                               		<c:when test="${sessionScope.adminAccount == 2 && account.getRole() == 2}">
	                               		<select id="inputRole" class="form-select" name="role">	                                	
		                                    <option selected value="default">No edit</option>		                                    
		                                </select>
                               		</c:when>
                               		<c:otherwise>
                               			<select disabled id="inputRole" class="form-select" name="role">
                               				<option selected value="default">Choose...</option>
                               				<option value="1">Admin</option>
                               			</select>
                               		</c:otherwise>
                                </c:choose>
                            </div>
                            <div class="col-md-6">
                                <label for="inputPhone" class="form-label">Phone number</label>
                                <input type="text" class="form-control" name="phone" id="inputPhone"
                                    placeholder="New phone number" value="${account.getPhone()}">
                            </div>
                            <div class="col-md-3">
                                <label for="inputLogin" class="form-label">Last time login</label>
                                <input type="date" class="form-control" name="login" id="inputLogin" disabled value="${account.getLogin()}">
                            </div>
                            <div class="col-md-3">
                                <label for="inputSignUp" class="form-label">Sign up date</label>
                                <input type="date" class="form-control" name="signUp" id="inputSignUp" disabled value="${account.getSignUp()}">
                            </div>
                            <div class="col-12 d-flex">
                            
                            	<!-- Button show search history -->
                                <button type="button" class="btn btn-primary me-auto" data-bs-toggle="modal"
                                    data-bs-target="#historyBackdrop">Show search history</button>
                                <!-- Modal -->
                                <div class="modal fade" id="historyBackdrop" data-bs-backdrop="static"
                                    data-bs-keyboard="false" tabindex="-1" aria-labelledby="historyBackdropLabel"
                                    aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-scrollable">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="historyBackdropLabel">Lottery ticket search history</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                            	<p class="fw-bold">[Account - Search time - Search province - Search number]</p>
                                            	<c:forEach items="${searchHistory}" var="h">
                                            		<p><c:out value="${h}"></c:out></p>
                                            	</c:forEach>                                               
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                    data-bs-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Button submit data for save information of account to database -->
                                <button type="button" class="btn btn-primary ms-1" data-bs-toggle="modal"
                                    data-bs-target="#updateBackdrop">Save</button>
                                <!-- Modal -->
                                <div class="modal fade" id="updateBackdrop" data-bs-backdrop="static"
                                    data-bs-keyboard="false" tabindex="-1" aria-labelledby="updateBackdropLabel"
                                    aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="updateBackdropLabel">Update account</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                Are you sure you want to save the changes?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                    data-bs-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-primary"
                                                    data-bs-dismiss="modal" id="myAnchor">Save</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Button delete account from database -->
                                <button type="button" class="btn btn-danger ms-1" data-bs-toggle="modal"
                                    data-bs-target="#deleteBackdrop">Delete</button>
                                <!-- Modal -->
                                <div class="modal fade" id="deleteBackdrop" data-bs-backdrop="static"
                                    data-bs-keyboard="false" tabindex="-1" aria-labelledby="deleteBackdropLabel"
                                    aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="deleteBackdropLabel">Delete account</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                            	<c:choose>
			                                		<c:when test="${account.getRole() < 2 && sessionScope.adminAccount == 2}">Are you sure you want to delete this account?</c:when>
			                                		<c:when test="${account.getRole() < 1 && sessionScope.adminAccount == 1}">Are you sure you want to delete this account?</c:when>
			                                		<c:otherwise>Admin deletion is not allowed</c:otherwise>
			                                	</c:choose>
                                                
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                    data-bs-dismiss="modal">Close</button>
                                                <c:if test="${account.getRole() < 2 && sessionScope.adminAccount == 2}">
                                                	<a href="DeleteAccount?deletemanyacc=${account.getUsr()}" class="btn btn-danger">Delete</a>
                                            	</c:if>
                                            	<c:if test="${account.getRole() < 1 && sessionScope.adminAccount == 1}">
                                                	<a href="DeleteAccount?deletemanyacc=${account.getUsr()}" class="btn btn-danger">Delete</a>
                                            	</c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Button cancel update account -->
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
        <!-- show navbar -->
        var d = document.getElementById("customers-collapse");
        d.classList.add("show");
        var d = document.getElementById("customers-collapse1");
        d.classList.remove("text-dark");
        <!-- submit update account form -->
        document.getElementById("myAnchor").addEventListener("click", function(event){
        	  event.stopPropagation();
        });
        // valid form
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

                        form.classList.add('was-validated')
                    }, false)
                })
        })();
    </script>	
</body>
</html>