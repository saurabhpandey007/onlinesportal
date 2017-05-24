<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Books Shop Online</title>
 

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
 
</head>
<body>
 
 
   <jsp:include page="header.jsp" />
   <jsp:include page="menu.jsp" />
 
   <div class="page-title">Shopping Cart Demo</div>
  
   <div class="demo-container">
   <h3>Demo content</h3>
  
   <ul>
      <li>Buy online</li>
      <li>Admin pages</li>
      <li>Reports</li>
   </ul>
   </div>
  <c:url value="js/jquery.min.js" />
  
   <jsp:include page="footer.jsp" />
 bootstrap-glyphicons
</body>
</html> --%>
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
  <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />">
  <link rel="stylesheet" href="<c:url value="/resources/fonts/bootstrap-glyphicons.css" />">
  <link rel="stylesheet" href="<c:url value="/resources/fonts/font-awesome.css" />">
  <link rel="stylesheet" href="<c:url value="/resources/css/prodimg.css" />">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="<c:url value="/resources/css/bootstrap.min.js" />"></script>
  <%-- <script src="<c:url value="/resources/css/jquery.min.js" />"></script> --%>
  <script src="<c:url value="/resources/css/slider.js" />"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>
  
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
    
    
    .imgcontainer{
            position:relative;
            width:100%;
            height:250px;
            border-radius:5px;
            border:1px solid red;
            overflow:hidden;
        }
        
  </style>
  <script>
 function book_fun(id){

	 bootbox.confirm("Thank You For Choosing Our Product ,Press Ok For Continue", function (e) {                  
	        if(e)
	        { 
	        	location.href='bookProduct/'+id;
	        	
	        }
	   });
  }
		 
  </script>
 
</head>
<body>
 <jsp:include page="header.jsp" />


<% 
	//LocalDate date = LocalDate.of(2014, 2, 15);
	LocalDate date=LocalDate.now();
	DayOfWeek dayOfWeek=date.getDayOfWeek();
	 String currentDay=dayOfWeek.name();
%>


<div class="container">  
 <div id="imgGallary" class="imgcontainer">
   
    <img src="<c:url value="/resources/logo/slimg6.jpg" />" width="100%" height="250" alt="Image" class="imgs"/>
    <img src="<c:url value="/resources/logo/slimg7.jpg" />" width="100%" height="250" alt="Image" class="imgs" />
     <img src="<c:url value="/resources/logo/slimg3.jpg" />" width="100%" height="250" alt="Image" class="imgs" />
     <img src="<c:url value="/resources/logo/slimg4.jpg" />" width="100%" height="250" alt="Image" class="imgs"/>
   <img src="<c:url value="/resources/logo/slimg5.jpg" />" width="100%" height="250" alt="Image" class="imgs"/>
   <img src="<c:url value="/resources/logo/slimg8.jpg" />" width="100%" height="250" alt="Image" class="imgs"/>
   <img src="<c:url value="/resources/logo/slimg9.jpg" />" width="100%" height="250" alt="Image" class="imgs"/>
   <img src="<c:url value="/resources/logo/slimg10.jpg" />" width="100%" height="250" alt="Image" class="imgs"/>
  
  
  
  
    <%-- <div style="float: left">
      <img src="<c:url value="/resources/logo/offer.gif" />"
					class="img-responsive" alt="Image">
    </div >
    <div style="float:right;">
    <marquee SCROLLAMOUNT=15>
    <img src="<c:url value="/resources/logo/img1.jpg" />" width="100" height="60" alt="Image" />
    <img src="<c:url value="/resources/logo/img2.jpg" />" width="100" height="60" alt="Image" />
    <img src="<c:url value="/resources/logo/img3.jpg" />" width="100" height="60" alt="Image" />
   <!--  </marquee>
    <marquee SCROLLAMOUNT=15 direction="right"> -->
    <img src="<c:url value="/resources/logo/img4.jpg" />" width="100" height="60" alt="Image" />
    <img src="<c:url value="/resources/logo/img5.jpg" />" width="100" height="60" alt="Image" />
    </marquee>

    </div> --%>
  </div>
   </div>
   <br/>
<div class="container">    
  <div class="row">
  
  <c:if test="${!empty products}">
  <c:forEach items="${products}" var="product">
    <div class="col-sm-4" id="${product.productId}">
     <input type="hidden" value="${product.productId}" class="${product.category}"/>
     <input type="hidden" value="${product.productId}" class="allID"/>
      <div class="panel panel-primary">
        <div class="panel-heading">AWESOME <%=currentDay %> DEAL</div>
        <div class="panel-body"><img src="data:image/jpeg;png;jpg;base64,<c:out value="${product.base64image}" />" class="parentimage" style="width:100%" alt="Image"></div>
        <div class="panel-footer"><span><b>Buy Only @ </b></span><img src="<c:url value="/resources/logo/rupees.png" />" alt="Image" /> <span><b style="font-size: 18px"><c:out value="${product.price}" /> </b></span><button type="button" style="height: 32px;width: 80px;border:0" onclick="book_fun(${product.productId})"><img src="<c:url value="/resources/logo/bookit.png" />" alt="Image"/></button></div>
      </div>
    </div>
    </c:forEach>
    </c:if>
    <%-- 
    <div class="col-sm-4"> 
      <div class="panel panel-danger">
        <div class="panel-heading">BLACK FRIDAY DEAL</div>
        <div class="panel-body"><img src="data:image/jpeg;base64,<c:out value="${product.base64image}" />" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-success">
        <div class="panel-heading">BLACK FRIDAY DEAL</div>
        <div class="panel-body"><img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
      </div>
    </div>
  </div>
</div><br>

<div class="container">    
  <div class="row">
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading">BLACK FRIDAY DEAL</div>
        <div class="panel-body"><img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">BLACK FRIDAY DEAL</div>
        <div class="panel-body"><img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">BLACK FRIDAY DEAL</div>
        <div class="panel-body"><img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
      </div>
    </div>--%>
  </div>
  
</div><br><br>
 
<!-- <footer class="container-fluid text-center">
  <p>@Online Store </p>  
  <form class="form-inline">Get deals:
    <input type="email" class="form-control" size="50" placeholder="Email Address">
    <button type="button" class="btn btn-danger">Sign Up</button>
  </form>
</footer -->


 <jsp:include page="footer.jsp" />
 
 
 
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
