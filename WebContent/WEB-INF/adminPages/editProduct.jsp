<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OnLine Shopping Portal</title>
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />">
   <script src="<c:url value="/resources/css/bootstrap.min.js" />"></script>
  <script src="<c:url value="/resources/css/jquery.min.js" />"></script>
</head>
<body>
<div class="container">
  <div class="row" style="text-align: center"><span style="font-size: 25px;color:#00004d;text-decoration:underline;">Please Fill Product Informations</span></div><br/>
  <form:form class="form-horizontal" action="editProduct" method="POST" modelAttribute="products" enctype="multipart/form-data" >
    <div class="form-group">
    <form:input type="hidden" class="form-control" path="productId" id="pid"  value="${ products.productId}"/>
      <label class="control-label col-sm-2" for="name">Product Name:</label>
      <div class="col-sm-10">
        <form:input type="text" class="form-control" path="product_name" id="pname"  value="${ products.product_name}"/>
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="name">Product Description:</label>
      <div class="col-sm-10">
        <form:input type="text" path="product_desc" class="form-control" id="pdesc" value="${ products.product_desc}" />
      </div>
    </div>
    
      <div class="form-group">
      <label class="control-label col-sm-2" for="name">Product Quantity:</label>
      <div class="col-sm-10">
        <form:input type="number" path="quantity" class="form-control" id="pqntyty" placeholder="Enter Product Quantity" />
      </div>
    </div>
    
      <div class="form-group">
      <label class="control-label col-sm-2" for="name">Product Category:</label>
      <div class="col-sm-10">
        <form:select path="category" class="form-control" id="pcatogry" selected="${ products.category}" >
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
        <form:input type="number" path="price" class="form-control" id="pprice" placeholder="Enter Product Price" />
      </div>
    </div>
    <div class="form-group">
    <label for="oldImage" class="control-label col-sm-2">Existing Product Image:</label>
    <img src="data:image/jpeg;png;jpg;base64,<c:out value="${products.base64image}" />"  style="width:100px;height: 70px;" alt="Image"><br/><br/>
    <label for="exampleInputFile" class="control-label col-sm-2">Product Image:</label>
    <div class="col-sm-10">
    <input type="file" name="file" class="form-control-file" id="InputFile" aria-describedby="fileHelp"/>
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