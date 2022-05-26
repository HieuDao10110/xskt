<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
    <!-- datatable css -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
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
                    <h1 class="h2">List account</h1>
                </div>

                <!-- table -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3" style="background-color: #33444e; color: white;">
                        <h6 class="m-0 font-weight-bold">Account DataTables</h6>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-12" style="overflow-x: auto;">
                                <form action="DeleteAccount" id="myForm12" method="post">                            
                                <table id="table1" class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Account</th>
                                            <th>Password</th>
                                            <th>Role</th>
                                            <th>Name</th>
                                            <th>Phone number</th>
                                            <th>Verified</th>
                                            <th>Sign up date</th>
                                            <th>Last login</th>
                                            <th>#</th>
                                            <th><button type="button" class="btn-close" data-bs-toggle="modal" data-bs-target="#deleteModal">
												</button>
												<!-- Modal -->
												<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
													  <div class="modal-dialog">
														    <div class="modal-content">
															      <div class="modal-header">
															        	<h5 class="modal-title" id="deleteModalLabel">Delete</h5>
															        	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
															      </div>
															      <div class="modal-body">
															        	Are you want to delete all selected account?
															      </div>
															      <div class="modal-footer">
															      		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
<!-- 															      		 onclick="form_submit() -->
															        	<button type="submit" class="btn btn-primary" id="myAnchor">Delete</button>
															      </div>
														    </div>
													  </div>
												</div>
											</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listA}" var="a">
                                        <tr>
                                            <td>${a.getUsr()}</td>
                                            <td>
                                            	<button type="button" class="btn btn-outline-danger btn-sm" onclick="notifyReset('${a.getUsr()}')">Reset</button>                                               
                                            </td>
                                            <td><c:choose>
                                				<c:when test="${a.getRole() == 2}">Manager</c:when>
                                				<c:when test="${a.getRole() == 1}">Admin</c:when>
                                				<c:otherwise>User</c:otherwise>
                                				</c:choose>   
                                			</td>
                                            <td>${a.getName()}</td>
                                            <td>${a.getPhone()}</td>
                                            <td><c:choose>
                                				<c:when test="${a.getStatus() == 0}">No</c:when>
                                				<c:when test="${a.getStatus() == 1}">Yes</c:when>
                                				<c:otherwise>Delete</c:otherwise>
                                				</c:choose>   
                                			</td>
                                            <td>${a.getSignUp()}</td>
                                            <td>${a.getLogin()}</td>
                                            <td><a href="UpdateAccount?acc=${a.getUsr()}"><i class="bi bi-gear"></i></a></td>
                                        	<td>
	                                        	<c:choose>
			                                		<c:when test="${a.getRole() < 2 && sessionScope.adminAccount == 2}"><input class="form-check-input" type="checkbox" name="deletemanyacc" value="${a.getUsr()}"></c:when>
			                                		<c:when test="${a.getRole() < 1 && sessionScope.adminAccount == 1}"><input class="form-check-input" type="checkbox" name="deletemanyacc" value="${a.getUsr()}"></c:when>
			                                		<c:otherwise></c:otherwise>
			                                	</c:choose>                     	
                                        	</td>
                                        </tr>
                                    </c:forEach>
                                    <!-- Modal for reset password-->
                                    <div class="modal fade" id="resetPassBackdrop"
                                    data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                                    aria-labelledby="resetPassBackdropLabel" aria-hidden="true">
	                                    <div class="modal-dialog modal-dialog-centered">
	                                        <div class="modal-content">
	                                            <div class="modal-header">
	                                                <h5 class="modal-title" id="resetPassBackdropLabel">Reset
	                                                    password</h5>
	                                                <button type="button" class="btn-close"
	                                                    data-bs-dismiss="modal"
	                                                    aria-label="Close"></button>
	                                            </div>
	                                            <div class="modal-body">
	                                                Are you sure you want to reset password this account?
	                                            </div>
	                                            <div class="modal-footer">
	                                                <button type="button" class="btn btn-secondary"
	                                                    data-bs-dismiss="modal">Close</button>
	                                                <button type="button" class="btn btn-primary"
	                                                    data-bs-dismiss="modal" href="abc.html" onclick="resetPassword()">Reset</button>
	                                            </div>
	                                        </div>
	                                    </div>
                                    </div>
                                    <!-- link for form reset password -->
                                    <a href="" id="resetPassAnchor" hidden></a>
                                    </tbody>
                                </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="position-fixed bottom-0 end-0 p-3">                
                    <div class="toast">
                        <!--put hide class here to hide toast-->
                        <div class="toast-header" style="background-color: #33444e;">
                            <strong class="me-auto text-warning">Warning</strong>
                            <small>Just a moment</small>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="toast"></button>
                        </div>
                        <div class="toast-body">
                        	<c:out value="${showToast}"></c:out>
                        </div>
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
    <!-- jQuery for datatable -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- datatable script -->
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
    <c:if test="${showToast != null}">
	    <script>
	        var toastElList = [].slice.call(document.querySelectorAll('.toast'))
	        var toastList = toastElList.map(function (toastEl) {
	            return new bootstrap.Toast(toastEl,{
	                delay: 10000
	            })
	        })        
	        toastList.forEach(toast => toast.show())
	    </script>
     </c:if>   
    <script>
//     	add style to table
        $(document).ready(function() {
            $('#table1').DataTable();
        } );
        
//      show navbar  
        var d = document.getElementById("customers-collapse");
        d.classList.add("show");
        var d = document.getElementById("customers-collapse1");
        d.classList.remove("text-dark");
        <!-- submit delete form -->
        document.getElementById("myAnchor").addEventListener("click", function(event){
        	  event.stopPropagation();
        });
        
//      reset password
        function notifyReset(a){
            document.getElementById("resetPassAnchor").href = "ResetPassword?email="+a;
            var myModal = new bootstrap.Modal(document.getElementById('resetPassBackdrop'));
            myModal.toggle();
        }
        function resetPassword(){
            document.getElementById("resetPassAnchor").click();
        }
        
//         function form_submit() {
//         	  document.getElementById("myForm12").submit();
//         }
    </script>	
</body>
</html>