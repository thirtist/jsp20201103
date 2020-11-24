<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>

<nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
    
    <c:forEach var="page" begin="${param.myBegin }" end="${param.myEnd }">
 	   <li class="page-item"><a class="page-link" href="#">${page }</a></li>    
    </c:forEach>
    
<!--<li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li> -->
    <li class="page-item"><a class="page-link" href="#">Next</a></li>
  </ul>
</nav>