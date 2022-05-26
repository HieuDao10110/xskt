<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="card" style="background-color:#66ccff;  border-radius: 5px;">

<h5 class="card-header" style="text-align: center;">Dò vé số</h5>
<div class="container py-3">

<form class="row g-3" action="SearchTicket">
    <div class="col-md-4">
        <label for="validationCustom01" class="form-label">Ngày dò</label>
        <input type="date" class="form-control" id="validationCustom01" name="d" required>
    </div>
    <div class="col-md-4">
        <label for="validationCustom04" class="form-label">Tỉnh dò</label>
        <select class="form-select" id="validationCustom04" name="p" required>
            <option selected disabled value="">Select province</option>
            <option value="Ha Noi">Ha Noi</option>
            <option value="Da Nang">Da Nang</option>
            <option value="Tp Ho Chi Minh">Ho Chi Minh</option>
        </select>
    </div>
    <div class="col-md-4">
        <label for="validationCustom02" class="form-label">Số vé</label>
        <input type="number" class="form-control" id="validationCustom02" placeholder="Input number" name="n"
            required minlength="2" maxlength="6">
        <input name="acc" value="${userAccount}" hidden>
    </div>
    <div class="col-12">
        <button class="btn btn-primary" type="submit">Dò vé</button>
    </div>
</form>
</div>
<!-- Thông báo kết quả dò -->
<c:if test="${searchTicketWin != null}">
<div class="card mt-3">
    <div class="card-header">
        Kết quả dò vé số - ${searchLotNum} / ${searchTicketDate} / ${searchTicketProvince}
    </div>
    <div class="card-body">
        <h5 class="card-title">Xin chúc mừng!</h5>
        <p class="card-text">Bạn đã trúng <c:out value="${searchTicketWin}"/></p>
    </div>
</div>
</c:if>
<c:if test="${searchTicketLos != null}">
<div class="card mt-3">
    <div class="card-header">
        Kết quả dò vé số - <c:out value="${searchTicketLos}"/> / ${searchTicketDate} / ${searchTicketProvince}
    </div>
    <div class="card-body">
        <h5 class="card-title">Rât tiếc!</h5>
        <p class="card-text">Bạn chưa trúng giải, chúc may mắn lần sau.</p>
    </div>
</div>
</c:if>
<c:if test="${searchTicketFail != null}">
<div class="card mt-3">
    <div class="card-header">
        Rât tiếc!
    </div>
    <div class="card-body">
        <h5 class="card-title"></h5>
        <h5 class="py-3 pt-5 border-top text-center">Không tìm thấy vé số hoặc vé số không tồn tại, vui lòng thử lại.</h5> 
    </div>
</div>
</c:if>
</div>
 