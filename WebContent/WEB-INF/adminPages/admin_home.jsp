<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OnLine Shopping Portal</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css" />"> 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="<c:url value="/resources/css/bootstrap.min.js" />"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>

<script>
 function edit_fun(id){
	
	 bootbox.confirm("Are You Sure Want To Edit This Product ?", function (e) {                  
        if(e)
        { 
        	location.href='editProduct/'+id;
        	
        }
   });  
	 
	
} 
 function delete_fun(id){
		
	 bootbox.confirm("Are You Sure Want To Delete This Product ?", function (e) {                  
        if(e)
        { 
        	location.href='deleteProduct/'+id;
        	
        }
   });  
	 
	
} 
</script>
</head>
<body>
	<div>
	<jsp:include page="admin_header.jsp" />
	<br/>
		<div class="panel-heading">
			<span class="lead">List of Products </span>
		
		<c:if test="${!empty products}">
			<table align="left" class="table table-hover">
				<tr>
					<th>Product Name</th>
					<th>Product Description</th>
					<th>Product Price</th>
					<th>Product Image</th>
					<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Actions</th>
				</tr>

				<c:forEach items="${products}" var="product">
					<tr>
						<td><c:out value="${product.product_name}" /></td>
						<td><c:out value="${product.product_desc}" /></td>
						<td><c:out value="${product.price}" /></td>
						<td><img src="data:image/jpeg;base64,<c:out value="${product.base64image}" />"  alt="Smiley face" height="100" width="90"/></td>
						<td align="center"><button type="button" onclick="edit_fun(${product.productId})" class="btn btn-success custom-width"><span class="glyphicon glyphicon-pencil"></span>Edit</button>  
				    	<button type="button" onclick="delete_fun(${product.productId})" class="btn btn-danger custom-width"><span class="glyphicon glyphicon-trash"></span>Delete</button></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>
	</div>
</body>
</html>