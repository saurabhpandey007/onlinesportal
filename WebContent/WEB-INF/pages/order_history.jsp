<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Shopping Portal</title>

<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css" />">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="<c:url value="/resources/css/bootstrap.min.js" />"></script>


</head>
<body>
	<jsp:include page="user_booking_header.jsp" />

	<div class="container">
		<h2 style="text-align: center; color: #000066;">Product Detail</h2>
		<hr style="height: 2px; background-color: blue;">
		<c:if test="${!empty products}">
			<table class="table" style="border-color: blue;" border="1px">
				<thead>
					<tr>
						<th>Product Name</th>
						<th>Product Description</th>
						<th>Product Price</th>
						<th>Product Appearance</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${products}" var="product">
						<tr>
							<td>${product.product_name}</td>
							<td>${product.product_desc}</td>
							<td>${product.price}</td>
							<td><img
								src="data:image/jpeg;png;jpg;base64,<c:out value="${product.base64image}" />"
								style="width: 100%" alt="Image"></td>
						</tr>

						<!-- <hr style="height: 2px; background-color: blue;" class="container">
 -->
					</c:forEach>
				</tbody>
			</table>
		</c:if>
<c:if test="${!empty nohstry}">

<div class="container" style="color: red;text-align: center;height: 500px;"> ${nohstry} </div>


</c:if>
	</div>

	<br />
	<br />
	<jsp:include page="footer.jsp" />
</body>
</html>