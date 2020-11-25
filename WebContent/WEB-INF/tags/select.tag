<%@ tag body-content="empty" language="java" pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag dynamic-attributes="optionMap" %>
<%@ attribute name="name" required="true"%>
<select name="${name }">
	<c:forEach items="${optionMap }" var="option" >
		<option value="${option.key }">${option.value }</option>
	</c:forEach>
</select>