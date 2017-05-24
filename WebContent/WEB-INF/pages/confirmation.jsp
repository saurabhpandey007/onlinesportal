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
	 <script src="<c:url value="/resources/css/jquery.min.js" />"></script>
	 <script src="<c:url value="/resources/css/bootstrap.min.js" />"></script>


<style>
/* 	table.table-bordered{
    border:1px solid blue;
    margin-top:20px;
  }
table.table-bordered > thead > tr > th{
    border:1px solid blue;
}
table.table-bordered > tbody > tr > td{
    border:1px solid blue;
} */
</style>
	
	<script>
	
	function bookfun()
	{
		var val=document.getElementById("selectedQuantity").value;
		location.href='booking/'+${product.productId}+'/'+val;

	}
	
	
	</script>
	
</head>
<body>
<jsp:include page="user_booking_header.jsp" />
<div class="container">
  <h2 style="text-align: center; color: #000066;">Product Detail</h2>  
  <hr style="height: 2px; background-color: blue; color=blue;">        
  <table class="table">
    <thead>
      <tr>
        <th>Product Name</th>
        <th>Product Description</th>
        <th>Product Price</th>
         <th>Product Appearance</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>${product.product_name}</td>
        <td>${product.product_desc}</td>
        <td>${product.price}</td>
        <td><img src="data:image/jpeg;png;jpg;base64,<c:out value="${product.base64image}" />"  style="width: 100%" alt="Image"></td>
      </tr>
   	<tr>
   	<td><p><font size="3" color="red">Please Select The Quantity :</font></p></td>
   	<td>
   	<select  id="selectedQuantity" name="selectedQuantity">

            <c:forEach begin="1" end="${product.quantity}" var="qtyval">

                <option value="${qtyval}">${qtyval}</option>

            </c:forEach>

        </select>
   	</td>
   	</tr>
   </tbody>
  </table>
 </div>
 <hr style="height: 2px; background-color: blue; color=blue;" class="container">
 
 <div class="row" style="width:95%; text-align: right; color: #00b300; font-size: 18px;">
 Thank You For Choosing This Product !!! 
 </div>
  <div class="container">
<div class="row justify-content-md-center">
    <div class="col col-lg-8">
    This product usually ships 3 to 5 business days after your order is confirmed from seller.&nbsp;&nbsp;&nbsp;<button type="button"   onclick="bookfun()" class="btn btn-success">Confirm Booking</button>
    </div>   
     </div>
  </div><br/><br/><br/><br/>
<jsp:include page="footer.jsp" />
</body>
</html>