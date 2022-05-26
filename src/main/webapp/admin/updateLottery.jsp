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
                    <h1 class="h2">Modify lottery</h1>
                </div>

                <!-- table -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3" style="background-color: #33444e; color: white;">
                        <h6 class="m-0 font-weight-bold">Update, delete lottery</h6>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-12" style="overflow-x: auto;">
                                <form class="row g-3" action="UpdateLottery" id="myForm12" method="post">                            
                                <div class="col-md-4">
	                                <label for="lotteryCompany" class="form-label">Lottery company: <span class="fw-bold fs-6">${lottery.getTinhDo()}</span></label>
	                                <select id="lotteryCompany" class="form-select" name="lottery">
	                                    <option selected value="${lottery.getTinhDo()}">Choose...</option>
	                                    <option value="hn">Ha noi</option>
	                                    <option value="hcm">Tp Ho Chi Minh</option>
	                                    <option value="dn">Da Nang</option>
	                                </select>
	                            </div>
	                            <div class="col-md-4">
	                                <label for="lotteryDate" class="form-label">Date</label>
	                                <input type="date" class="form-control" name="date" id="lotteryDate" value="${lottery.getNgay()}">
	                            </div>
<%-- 	                            value="${sessionScope.adminAccount}" --%>
	                            <div class="col-md-4">
	                                <label for="lotteryAdmin" class="form-label">Changes by</label>
	                                <input type="text" class="form-control" name="admin" id="lotteryAdmin" value="${sessionScope.adminAccountName}" readonly>
	                            </div>
	                            <div class="col-md-4">
	                                <label for="db" class="form-label w-100">Special prize</label>
	                                <input type="text" class="form-control" name="gdb" value="${lottery.getDb()}" id="db"
	                                    placeholder="New number">
	                            </div>
	                            <div class="col-md-4">
	                                <label for="gg1" class="form-label w-100">First prize</label>
	                                <input type="text" class="form-control" name="g1" value="${lottery.getG1()}" id="gg1"
	                                    placeholder="New number">
	                            </div>
	                            <div class="col-md-4">
	                                <label for="gg2" class="form-label w-100">Second prize</label>
	                                <input type="text" class="form-control" name="g2" value="${lottery.getG2()}" id="gg2"
	                                    placeholder="New number">
	                            </div>
	                            <div class="col-md-4">
	                                <label for="gg3" class="form-label w-100">Third prize</label>
	                                <input type="text" class="form-control" name="g3" value="${lottery.getG3()}" id="gg3"
	                                    placeholder="New number">
	                            </div>
	                            <div class="col-md-4">
	                                <label for="gg4" class="form-label w-100">Fourth prize</label>
	                                <input type="text" class="form-control" name="g4" value="${lottery.getG4()}" id="gg4"
	                                    placeholder="New number">
	                            </div>
	                            <div class="col-md-4">
	                                <label for="gg5" class="form-label w-100">Fifth prize</label>
	                                <input type="text" class="form-control" name="g5" value="${lottery.getG5()}" id="gg5"
	                                    placeholder="New number">
	                            </div>
	                            <div class="col-md-4">
	                                <label for="gg6" class="form-label w-100">Sixth prize</label>
	                                <input type="text" class="form-control" name="g6" value="${lottery.getG6()}" id="gg6"
	                                    placeholder="New number">
	                            </div>
	                            <div class="col-md-4">
	                                <label for="gg7" class="form-label w-100">Seventh prize</label>
	                                <input type="text" class="form-control" name="g7" value="${lottery.getG7()}" id="gg7"
	                                    placeholder="New number">
	                            </div>
	                            <div class="col-md-4">
	                                <label for="gg8" class="form-label w-100">Eighth prize</label>
	                                <input type="text" class="form-control" name="g8" value="${lottery.getG8()}" id="gg8"
	                                    placeholder="New number">
	                            </div>
	                            <div class="col-12 d-flex justify-content-end">
	                                <!-- save button -->
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
	                                                Are you sure you want to save the changes? Editing lottery ticket information many times may affect the accuracy and user's trust in the website.
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
	                                <!-- delete button -->
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
	                                                Are you sure you want to delete this account?
	                                            </div>
	                                            <div class="modal-footer">
	                                                <button type="button" class="btn btn-secondary"
	                                                    data-bs-dismiss="modal">Close</button>
	                                                <a href="DeleteLottery?deletemanylot=${lottery.getNgay()} ${lottery.getTinhDo()}" class="btn btn-danger">Delete</a>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <a type="button" class="btn btn-secondary ms-1" href="ListLottery">Cancel</a>
	                            </div>
                                </form>
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
    <!-- bootstrap script -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous">
    </script>
    <script>
        <!-- show navbar -->
        var d = document.getElementById("customData-collapse");
        d.classList.add("show");
        var d = document.getElementById("customData-collapse1");
        d.classList.remove("text-dark");
        <!-- submit delete form -->
        document.getElementById("myAnchor").addEventListener("click", function(event){
        	  event.stopPropagation();
        });
//         function form_submit() {
//         	  document.getElementById("myForm12").submit();
//         }
    </script>	
</body>
</html>