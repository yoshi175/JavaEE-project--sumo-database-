<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<jsp:include page="header.jsp" />
<body>

	
	<div align="center">
	
	<form action="SearchCoach" method="GET">
		<input type="text" name="searchValue"/>
		<input type="submit" value="Search"/>
	</form>
	
	<br/>
	
	<input style="align: center;" type="button" value="Add coach" onclick="window.location.href='AddCoach'; return false;" />
	
	<br/><br/>
	
	<table class="list">
		<tr>
			<th>Name</th>
			<th>Birht date</th>
			<th>Highest rank</th>
			<th>Comp. matches</th>
			<th>Comp. wins</th>
			<th>Comp. losses</th>
			<th>Retired</th>
			<th>Club</th>
			<th>Update/Delete</th>
		</tr>
		<c:forEach var="tempCoach" items="${ALL_COACHES}">
		
			<!-- creating a unique update link with an specific id referring to the selected coach object -->
			<c:url var="updateCoach" value="UpdateCoach">
				<c:param name="coachId" value="${tempCoach.id}" />
			</c:url>
			
			<!-- creating a unique delete link with an specific id referring to the selected coach object -->
			<c:url var="deleteCoach" value="DeleteCoach">
				<c:param name="coachId" value="${tempCoach.id}" />
			</c:url>
			
			<tr>
				<td>${tempCoach.name}</td>
				<td>${tempCoach.birthdate}</td>
				<td>${tempCoach.highestRank}</td>
				<td>${tempCoach.competitiveMatches}</td>
				<td>${tempCoach.competitiveWins}</td>
				<td>${tempCoach.competitiveLosses}</td>
				<td>${tempCoach.retiredFromCompeting}</td>
				<td>${tempCoach.clubName}</td>
				<td>
					<a href="${updateCoach}"><i class="fa fa-refresh"></i></a>
					 | 
					<a href="${deleteCoach}"
						onclick="if (!(confirm('Delete ${tempCoach.name}?'))) return false">
						<i class="fa fa-trash"></i>
					</a>
				</td>
			</tr>
		</c:forEach>
		
	</table>
	</div>
</body>
</html>