<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OnLine Shopping Portal</title>
<link rel="stylesheet" href="<c:url value="/resources/css/adminlogin.css" />">
</head>
<body bgcolor="#EEF5F5">
    <%-- <form:form name="submitForm" method="POST">
        <div align="center">
            <table>
                <tr>
                    <td>User Name</td>
                    <td><input type="text" name="userName" /></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Submit" /></td>
                </tr>
            </table>
            <div style="color: red">${error}</div>
        </div>
    </form:form> --%>
    
    

<form action="admin" method="POST">
  <div class="imgcontainer">
    <img src="<c:url value="/resources/logo/User_Circle.png" />" alt="Avatar" class="avatar"><br/>
    <h2>Admin Login</h2>
  </div>

  <div class="container">
  	<c:if test="${!empty model.errormsg}">
  		<span style="color:red">${model.errormsg}</span><br/>
  	</c:if>
     <label><b>Username&nbsp;&nbsp;&nbsp;</b></label>
    <input type="text" placeholder="Enter Username" name="uname" required><br/><br/>

    <label><b>Password&nbsp;&nbsp;&nbsp;</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required><br/><br/>
        
    <button type="submit">Login</button>
   </div>
  </form>
</body>
</html>