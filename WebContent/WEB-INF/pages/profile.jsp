<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt"  prefix="c1"%>
<%@ taglib uri="http://java.sun.com/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Shopping Portal</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css" />">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="<c:url value="/resources/css/bootstrap.min.js" />"></script>


<link rel="stylesheet"
	href="<c:url value="/resources/fonts/bootstrap-glyphicons.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/fonts/font-awesome.css" />">


	<link rel="stylesheet"
	href="<c:url value="/resources/css/loginmodal.css" />">

<style>

input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button { 
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    margin: 0; 
}


input[type=text] {
width:100%; 
border-radius:5px;
padding:6px 6px; 
margin:6px 2px;
border: 2px solid #ccc;
background-color:#f2f2f2;
box-shadow: 0px 1px 1px rgba(0,0,0,.075);

}
input[type=number] {
width:100%; 
border-radius:5px;
padding:6px 6px; 
margin:6px 2px;
border: 2px solid #ccc;
background-color:#f2f2f2;
box-shadow: 0px 1px 1px rgba(0,0,0,.075);

}


.navbar {
	border-radius: 0;
	/* padding-top: 50px;
    padding-right: 30px;
    padding-bottom: 50px;
    padding-left: 80px;*/
    
     padding: 0px 0px -10px 0px;
	 margin: 20px 0px 70px 0px;
} 

/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}

</style>



<script>

function editable()
{
 var arr=document.getElementsByClassName("edit");
	
 for(var i=0;i<arr.length;i++)
	 {
	  arr[i].style.backgroundColor="LightGreen";
	  arr[i].readOnly=false;	 
	 }
}



function checkMob()
{
	
		
	var number=document.getElementById("mob");
	if (number.value.length != 10) { 
		
		alert('Please enter 10 digit mobile number');
		number.focus();
		return false;
		
	}
	var ptrn=/^\d{10}$/;
	if (number.value.match(ptrn)) {
	   return true;
	}
	else {
	    alert("Invalid number; must be ten digits number")
	    number.focus()
	    return false;
	}
	
	
}


</script>



</head>
<body>

	<jsp:include page="user_booking_header.jsp" />
	<div style="height: 100%;">
	<div class="container"style="height: 650px;"> 
	<c1:if test="${!empty profile}">
	
	<span style="color: green">${profile}</span>
	</c1:if>
		<form:form class="form-horizontal" method="post"
			modelAttribute="users" action="profile" onsubmit="return checkMob()">

			<div class="form-group">
				<label class="col-sm-2 control-label">User Id</label>
				<div class="col-sm-10">
					<input  type="text"  id="uid" placeholder="User Id" value="${users.userId}" readonly="true" name="uid" />
						
							
						
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Name</label>
				<div class="col-sm-10">
					<input  type="text" class="edit" id="name"
						placeholder="Name" value="${users.name}" readonly="true" name="name"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Address</label>
				<div class="col-sm-10">
					<input name="address" type="text" class="edit" id="addr"
						placeholder="address" value="${users.address}" readonly="true"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Mobile Number</label>
				<div class="col-sm-10">
					<input name="mobno" type="number" class="edit" id="mob"
						placeholder="Mobile Number" value="${users.mobno}" readonly="true"/>
				</div>
			</div>

			
		<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10" style="text-align: right;">
					
					<button type="button" class="btn-lg btn-success" onclick="editable()">Edit
					</button>&nbsp;
					<button type="submit" class="btn-lg btn-primary">Update
					</button>
					
				</div>
			</div>
					
		</form:form>

	 </div> 
	
	<div style="height: 10%;">
	<jsp:include page="footer.jsp" />
	</div>
	 </div> 
</body>
</html>