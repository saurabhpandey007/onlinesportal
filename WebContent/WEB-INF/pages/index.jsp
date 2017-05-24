<%@page import="java.time.DayOfWeek"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.time.LocalDate"%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>Online Shopping Portal</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/fonts/bootstrap-glyphicons.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/fonts/font-awesome.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/prodimg.css" />">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="<c:url value="/resources/css/bootstrap.min.js" />"></script>
<%-- <script src="<c:url value="/resources/css/jquery.min.js" />"></script> --%>
<script src="<c:url value="/resources/css/slider.js" />"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/css/loginmodal.css" />">

<style>
/* Remove the navbar's default rounded borders and increase the bottom margin */
.navbar {
	margin-bottom: 50px;
	border-radius: 0;
}

/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}

/*css for product image*/
.imgcontainer {
	position: relative;
	width: 100%;
	height: 250px;
	border-radius: 5px;
	border: 1px solid red;
	overflow: hidden;
}

/*  style for  removing up and down arrow from input type number */
input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button
	{
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	margin: 0;
}
</style>
<script>
 function book_fun(id){

	 if( "${username}" !="nouser"){
	 bootbox.confirm("Thank You For Choosing Our Product ,Press Ok For Continue", function (e) {                  
	        if(e)
	        { 
	        	location.href='bookProduct/'+id;
	        	
	        }
	   });
	 }
	 else
		 {
		  $('#myModal').modal('show');
		 }
  }
 //modal script
// $('#myModal').modal('toggle');
  function signUpClick(){
	  
	  $('#myModal').modal('show');
  }
function onLoginClick(){
	  
	 $('#loginModal').modal('show');	
  }
  

  </script>

</head>
<body>

	<c:if test="${username == 'nouser'}">
		<jsp:include page="header.jsp" />
	</c:if>
	<c:if test="${username != 'nouser'}">
		<jsp:include page="user_header.jsp" />
	</c:if>


	<%
		//LocalDate date = LocalDate.of(2014, 2, 15);
		LocalDate date = LocalDate.now();
		DayOfWeek dayOfWeek = date.getDayOfWeek();
		String currentDay = dayOfWeek.name();
	%>


	<div class="container">
		<div id="imgGallary" class="imgcontainer">

			<img src="<c:url value="/resources/logo/slimg6.jpg" />" width="100%"
				height="250" alt="Image" class="imgs" /> <img
				src="<c:url value="/resources/logo/slimg7.jpg" />" width="100%"
				height="250" alt="Image" class="imgs" /> <img
				src="<c:url value="/resources/logo/slimg3.jpg" />" width="100%"
				height="250" alt="Image" class="imgs" /> <img
				src="<c:url value="/resources/logo/slimg4.jpg" />" width="100%"
				height="250" alt="Image" class="imgs" /> <img
				src="<c:url value="/resources/logo/slimg5.jpg" />" width="100%"
				height="250" alt="Image" class="imgs" /> <img
				src="<c:url value="/resources/logo/slimg8.jpg" />" width="100%"
				height="250" alt="Image" class="imgs" /> <img
				src="<c:url value="/resources/logo/slimg9.jpg" />" width="100%"
				height="250" alt="Image" class="imgs" /> <img
				src="<c:url value="/resources/logo/slimg10.jpg" />" width="100%"
				height="250" alt="Image" class="imgs" /> <img
				src="<c:url value="/resources/logo/slimg11.jpg" />" width="100%"
				height="250" alt="Image" class="imgs" />


			<%-- for applying offer gif --%>

			<%-- <div style="float: left">
      <img src="<c:url value="/resources/logo/offer.gif" />"
					class="img-responsive" alt="Image"> --%>

		</div>
	</div>
	<br />
	<c:if test="${!empty user}">
		<script> alert('UserId already exists please try another!!!!'); </script>
	</c:if>
	<c:if test="${!empty credentail}">
		<script> alert('Invalid Credentials Please Try With Correct !!!!'); </script>
	</c:if>

	<div class="container">
		<div class="row">

			<c:if test="${!empty products}">
				<c:forEach items="${products}" var="product">
					<div class="col-sm-4" id="${product.productId}">
						<input type="hidden" value="${product.productId}"
							class="${product.category}" /> <input type="hidden"
							value="${product.productId}" class="allID" />
						<div class="panel panel-primary">
							<div class="panel-heading">
								AWESOME
								<%=currentDay%>
								DEAL
							</div>
							<div class="panel-body">
								<img
									src="data:image/jpeg;png;jpg;base64,<c:out value="${product.base64image}" />"
									class="parentimage" style="width: 100%" alt="Image">
							</div>
							<div class="panel-footer">
								<span><b>Buy Only @ </b></span><img
									src="<c:url value="/resources/logo/rupees.png" />" alt="Image" />
								<span><b style="font-size: 18px"><c:out
											value="${product.price}" /> </b></span>
								<button type="button"
									style="height: 32px; width: 80px; border: 0"
									onclick="book_fun(${product.productId})">
									<img src="<c:url value="/resources/logo/bookit.png" />"
										alt="Image" />
								</button>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>

		</div>

	</div>
	<br>
	<br>

	<jsp:include page="footer.jsp" />



	<!-- Large modal   data-toggle="modal"-->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">Welcome To Online
						Shopping Portal</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-8"
							style="border-right: 1px dotted #C2C2C2; padding-right: 30px;">
							<!-- Nav tabs -->
							<ul class="nav nav-tabs">
								<li class="active"><a href="#Login" data-toggle="tab">Login</a></li>
								<li><a href="#Registration" data-toggle="tab">Registration</a></li>
							</ul>
							<!-- Tab panes -->
							<div class="tab-content">
								<div class="tab-pane active" id="Login">
									<form role="form" class="form-horizontal" method="post"
										action="login">
										<div class="form-group">
											<label for="email" class="col-sm-2 control-label">
												User Id</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="email1"
													placeholder="Email" name="uname" required="required" />
											</div>
										</div>
										<div class="form-group">
											<label for="exampleInputPassword1"
												class="col-sm-2 control-label"> Password</label>
											<div class="col-sm-10">
												<input type="password" class="form-control"
													id="exampleInputPassword1" placeholder="Password"
													name="psw" required="required" />
											</div>
										</div>
										<div class="row">
											<div class="col-sm-2"></div>
											<div class="col-sm-10">
												<button type="submit" class="btn btn-primary btn-sm">
													Submit</button>

												<button type="button" class="btn btn-default btn-sm"
													data-dismiss="modal">Cancel</button>
											</div>
										</div>
									</form>
								</div>
								<div class="tab-pane" id="Registration">
									<form role="form" class="form-horizontal" method="post"
										action="register">
										<div class="form-group">
											<label for="email" class="col-sm-2 control-label">
												Name</label>
											<div class="col-sm-10">
												<div class="row">
													<div class="col-md-3">
														<select class="form-control" name="prefix">
															<option>Mr.</option>
															<option>Ms.</option>
															<option>Mrs.</option>
														</select>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" placeholder="Name"
															name="name" required="required" />
													</div>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label for="mobile" class="col-sm-2 control-label">
												Adress</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="address"
													placeholder="Address" name="address" />
											</div>
										</div>
										<div class="form-group">
											<label for="mobile" class="col-sm-2 control-label">
												Mobile</label>
											<div class="col-sm-10">
												<input type="number" class="form-control" id="mobile"
													placeholder="Mobile" name="mobno" />
											</div>
										</div>
										<div class="form-group">
											<label for="email" class="col-sm-2 control-label">
												UserId</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="email"
													placeholder="UserId" name="uid" required="required" />
											</div>
										</div>

										<div class="form-group">
											<label for="password" class="col-sm-2 control-label">
												Password</label>
											<div class="col-sm-10">
												<input type="password" class="form-control" id="password"
													placeholder="Password" name="pwd" required="required" />
											</div>
										</div>
										<div class="row">
											<div class="col-sm-2"></div>
											<div class="col-sm-10">
												<button type="submit" class="btn btn-primary btn-sm">
													Save &amp; Continue</button>

												<button type="button" class="btn btn-default btn-sm"
													data-dismiss="modal">Cancel</button>
											</div>
										</div>
									</form>
								</div>
							</div>

						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<%-- start login model for existing user --%>
	<div class="container">
		<div class="modal fade" id="loginModal" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body" style="text-align: center;">
						<div class="loginmodal-container">
							<h3 class="modal-title">Login to Shopping Portal</h3>
							<br />
							<form action="login" method="post">
								<input type="text" name="uname" placeholder="Username"
									required="required"> <input type="password" name="psw"
									placeholder="Password" required="required"> <input
									type="submit" name="login" class="login loginmodal-submit"
									value="Login">
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>

	</div>

	<%-- end login model for existing user --%>

	<script>

(function(){
    var imgLen = document.getElementById('imgGallary');
    var images = imgLen.getElementsByTagName('img');
    var counter = 1;

    if(counter <= images.length){
        setInterval(function(){
            images[0].src = images[counter].src;
            console.log(images[counter].src);
            counter++;

            if(counter === images.length){
                counter = 1;
            }
        },3000);
    }
})();

function showCategory(selectObject) {

var value = selectObject.value.toUpperCase();
   
// all ids of the products 
var ids=document.getElementsByClassName("allID");

var idarr =featchAndSortArray(ids);

// all ids of the selected product category
var catgry=document.getElementsByClassName(value);

var selectedidarr =featchAndSortArray(catgry);


for(var j=0;j<idarr.length;j++)
	{
	

	if(selectedidarr[j]!= undefined)
		{ 
			var index = idarr.indexOf(selectedidarr[j]);
 	
	     			if (index > -1) {
		 					 idarr.splice(index, 1);
	     	           }
	     			}
  }

   
     
if(value !='CATEGORY'){
	
	    for(var i =0; i <idarr.length; i++)
	    {	
	    	var x= document.getElementById(idarr[i]);
			x.style.display = 'none';
	    }

	    for(var i =0; i <selectedidarr.length; i++)
	    {	
	
	   	  var x= document.getElementById(selectedidarr[i]);
	   	    x.style.display = 'block';
	    }


		 }

else
	{
	 for(var i =0; i <idarr.length; i++)
		 {
		 var x= document.getElementById(idarr[i]);
		 x.style.display = 'block';
		 
		 }
	
	}
}

function featchAndSortArray(val)
{
    var IdStore = new Array();
     for(var j = 0; j < val.length; j++){
     
    	 IdStore.push(val[j].value);
    }

     IdStore.sort(function(a, b){return a-b});
     
     console.log(IdStore);
     return IdStore;
}

</script>


</body>
</html>
