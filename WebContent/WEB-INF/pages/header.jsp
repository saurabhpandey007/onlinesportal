<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<div class="row">
		<div class="container">

			<div class="col-sm-3"">
				<img src="<c:url value="/resources/logo/shopping-logo.png" />"
					class="img-responsive" alt="Image">
			</div>
			<div class="col-sm-9"">
				<h1 style="color: NAVY; font-family: courier; font-weight: bold;">Online
					Shopping Store</h1>
			</div>

		</div>
	</div>


	<nav role="navigation" class="navbar navbar-inverse" style="background-color: #1E90FF;">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <!-- <a href="#" class="navbar-brand">Brand</a> -->
    </div>
    <!-- Collection of nav links, forms, and other content for toggling -->
    <div id="navbarCollapse" class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
            <li><a href="/OnlineShoppingPortal/">Home</a></li>
           <li> 
           <form role="search" class="navbar-form navbar-left">
            <div class="form-group">
            <select class="form-control input-small" id="sel1" onchange="showCategory(this)">
            <option>Category</option>
             <option>Mens</option>
            <option>Women</option>
            <option>Electronic</option>
            <option>Books</option>
          </select>
            </div>
        </form>
          </li>     
           
        <li>
        <form role="search" class="navbar-form navbar-left">
            <div class="form-group">
                <input type="text" placeholder="Search" class="form-control">
                <button type="button" class="btn btn-info">
      <span class="glyphicon glyphicon-search"></span> Search
    </button>
            </div>
        </form>
        </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
          <li> <a onclick="signUpClick()" class="btn btn-primary btn-md" style="border: 0px;">
          <span class="glyphicon glyphicon-hand-up"></span> Sign Up 
        </a></li>
            <li> <a onclick="onLoginClick()" class="btn btn-primary btn-md" style="border: 0px;">
          <span class="glyphicon glyphicon-log-in"></span> Sign In 
        </a>
        </ul>
    </div>
</nav>

 
 