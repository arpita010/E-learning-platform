<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sells Report</title>
<%@include file="common_components/common.jsp"%>
</head>
<body>
	<%@include file="common_components/navbar.jsp"%>
	<div class="row" style="max-width: 100%;">
		<%@include file="common_components/adminSidebar.jsp"%>
		<div class="col-sm-8 m-2">
			<form>
				<div class="row mt-4">
					<div class="col-sm-3  text-center">
						<input type="date" class="form-control">
					</div>
					<span class="px-2 pt-2">to</span>
					<div class="col-sm-3">
						<input type="date" class="form-control">
					</div>
					<div class="col">
						<button type="submit" class="btn btn-outline-primary">Search</button>
					</div>
				</div>
			</form>

		</div>




	</div>
	<!-- row ends -->
</body>
</html>