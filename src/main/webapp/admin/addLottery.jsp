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
    <title>Lottery - SB Admin</title>
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
                    <h1 class="h2">Add lottery</h1>
                </div>
                <p>Note:<span class="text-danger fw-bold"> *</span> Field required</p>
                <!-- table -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3" style="background-color: #33444e; color: white;">
                        <h6 class="m-0 font-weight-bold">Add an lottery to database</h6>
                    </div>
                    <div class="card-body">
                        <form class="row g-3 needs-validation" action="AddLottery" method="post" novalidate>
                            <div class="col-md-4">
                                <label for="lotteryCompany" class="form-label">Lottery company<span class="text-danger fw-bold"> *</span></label>
                                <select id="lotteryCompany" class="form-select" name="lottery" required>
                                    <option value="">Choose...</option>
                                    <option value="hn">Ha noi</option>
                                    <option value="hcm">Tp Ho Chi Minh</option>
                                    <option value="dn">Da Nang</option>
                                </select>
                                <div class="valid-feedback">Looks good!</div>
                                <div class="invalid-feedback">Please choose one.</div>
                            </div>
                            <div class="col-md-4">
                                <label for="lotteryDate" class="form-label">Date<span class="text-danger fw-bold"> *</span></label>
                                <input type="date" class="form-control" name="date" id="lotteryDate" required>
                                <div class="valid-feedback">Looks good!</div>
                                <div class="invalid-feedback">Please choose one.</div>
                            </div>
<%--                             value="${sessionScope.adminAccount}" --%>
                            <div class="col-md-4">
                                <label for="lotteryAdmin" class="form-label">Changes by<span class="text-danger fw-bold"> *</span></label>
                                <input type="email" class="form-control" name="admin" id="lotteryAdmin" value="${adminAccountName}" required readonly>
                            	<div class="valid-feedback">Looks good!</div>
                                <div class="invalid-feedback">Some things wrong, please try login again.</div>
                            </div>
                            <div class="col-md-4">
                                <label for="db" class="form-label">Special prize</label>
                                <input type="text" class="form-control" name="gdb" id="db"
                                    placeholder="Enter the number string">
                            </div>
                            <div class="col-md-4">
                                <label for="gg1" class="form-label">First prize</label>
                                <input type="text" class="form-control" name="g1" id="gg1"
                                    placeholder="Enter the number string">
                            </div>
                            <div class="col-md-4">
                                <label for="gg2" class="form-label">Second prize</label>
                                <input type="text" class="form-control" name="g2" id="gg2"
                                    placeholder="Enter the number string">
                            </div>
                            <div class="col-md-4">
                                <label for="gg3" class="form-label">Third prize</label>
                                <input type="text" class="form-control" name="g3" id="gg3"
                                    placeholder="Enter the number string">
                            </div>
                            <div class="col-md-4">
                                <label for="gg4" class="form-label">Fourth prize</label>
                                <input type="text" class="form-control" name="g4" id="gg4"
                                    placeholder="Enter the number string">
                            </div>
                            <div class="col-md-4">
                                <label for="gg5" class="form-label">Fifth prize</label>
                                <input type="text" class="form-control" name="g5" id="gg5"
                                    placeholder="Enter the number string">
                            </div>
                            <div class="col-md-4">
                                <label for="gg6" class="form-label">Sixth prize</label>
                                <input type="text" class="form-control" name="g6" id="gg6"
                                    placeholder="Enter the number string">
                            </div>
                            <div class="col-md-4">
                                <label for="gg7" class="form-label">Seventh prize</label>
                                <input type="text" class="form-control" name="g7" id="gg7"
                                    placeholder="Enter the number string">
                            </div>
                            <div class="col-md-4">
                                <label for="gg8" class="form-label">Eighth prize</label>
                                <input type="text" class="form-control" name="g8" id="gg8"
                                    placeholder="Enter the number string">
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
                                                <h5 class="modal-title" id="updateBackdropLabel">Add lottery</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                Are you sure you want to add this account?
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
                                <a type="button" class="btn btn-secondary ms-1" href="ListLottery">Cancel</a>
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
        var d = document.getElementById("customData-collapse");
        d.classList.add("show");
        var d = document.getElementById("customData-collapse2");
        d.classList.remove("text-dark");
        // stopPropagation submit create account form
        document.getElementById("myAnchor").addEventListener("click", function(event){
        	  event.stopPropagation();
        });
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