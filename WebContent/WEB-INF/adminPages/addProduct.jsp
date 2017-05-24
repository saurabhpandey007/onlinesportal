<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

 <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />">
   <script src="<c:url value="/resources/css/bootstrap.min.js" />"></script>
  <script src="<c:url value="/resources/css/jquery.min.js" />"></script>
</head>
<body>
<div class="container">
  <div class="row" style="text-align: center"><span style="font-size: 25px;color:#00004d;text-decoration:underline;">Please Fill Product Informations</span></div><br/>
  <form:form class="form-horizontal" action="addProduct" method="POST" modelAttribute="products" enctype="multipart/form-data" >
    <div class="form-group">
      <label class="control-label col-sm-2" for="name">Product Name:</label>
      <div class="col-sm-10">
        <form:input type="text" class="form-control" path="product_name" id="pname" placeholder="Enter Product Name"/>
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="name">Product Description:</label>
      <div class="col-sm-10">
        <form:input type="text" path="product_desc" class="form-control" id="pname" placeholder="Enter Product Description" required="required"/>
      </div>
    </div>
    
      <div class="form-group">
      <label class="control-label col-sm-2" for="name">Product Quantity:</label>
      <div class="col-sm-10">
        <form:input type="number" path="quantity" class="form-control" id="pname" placeholder="Enter Product Quantity" required="required"/>
      </div>
    </div>
    
      <div class="form-group">
      <label class="control-label col-sm-2" for="name">Product Category:</label>
      <div class="col-sm-10">
        <form:select path="category" class="form-control" id="pname" placeholder="Enter Product Description" required="required">
           <form:option value="MENS">MENS</form:option>
            <form:option value="WOMEN">WOMEN</form:option>
            <form:option value="ELECTRONIC">ELECTRONIC</form:option>
            <form:option value="BOOKS">BOOKS   </form:option>          
        </form:select>
      </div>
    </div>
      
    <div class="form-group">
      <label class="control-label col-sm-2" for="name">Product Price In Rupees:</label>
      <div class="col-sm-10">
        <form:input type="number" path="price" class="form-control" id="pname" placeholder="Enter Product Price" required="required"/>
      </div>
    </div>
    <div class="form-group">
    <label for="exampleInputFile" class="control-label col-sm-2">Product Image:</label>
    <div class="col-sm-10">
    <input type="file" name="file" class="form-control-file" id="InputFile" aria-describedby="fileHelp" required="required"/>
     </div>
  </div>
  <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
        <button type="submit" class="btn btn-primary">Submit</button>
      </div>
    </div>
  </form:form>
</div>
</body>
</html>