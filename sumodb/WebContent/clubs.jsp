<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>

<jsp:include page="header.jsp" />

<body style="background: lightgrey;">
	
	<div align="center">
	
	
	<form action="SearchClub" method="GET">
		<input type="text" name="searchValue"/>
		<input type="submit" value="<fmt:message key="label.search" />"/>
	</form>
	
	<br/>
	
	<input style="align: center;" type="button" value="<fmt:message key="label.createClub" />" onclick="window.location.href='addClub.jsp'; return false;" />
	
	<br/>
	<br/>
	
	<table border="1">
		<tr>
			<th><fmt:message key="label.name" /></th>
			<th><fmt:message key="label.startingYear" /></th>
			<th><fmt:message key="label.city" /></th>
			<th><fmt:message key="label.updateDelete" /></th>
		</tr>
		
		<c:forEach var="tempClub" items="${ALL_CLUBS}"> 
		
			<!-- creating a unique update link with an specific id referring to the selected club object -->
			<c:url var="updateClub" value="UpdateClub">
				<c:param name="clubId" value="${tempClub.id}" />
			</c:url>
			
			<!-- creating a unique delete link with an specific id referring to the selected club object -->
			<c:url var="deleteClub" value="DeleteClub">
				<c:param name="clubId" value="${tempClub.id}" />
			</c:url>
			<tr>
				<td>${tempClub.name}</td>
				<td>${tempClub.startingYear}</td>
				<td>${tempClub.city}</td>
				<td>
					<a href="${updateClub}"><fmt:message key="label.update" /></a>
					 | 
					<a href="${deleteClub}"
						onclick="if (!(confirm('Delete ${tempClub.name}?'))) return false">
						<fmt:message key="label.delete" /></a>
				</td>
				
			</tr>	
		</c:forEach>
	</table>
	</div>
</body>
</html>