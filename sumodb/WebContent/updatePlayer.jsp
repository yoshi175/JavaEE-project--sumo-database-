<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
</head>
<body>

	<jsp:include page="header.jsp" />
	
	<form action="UpdatePlayer" method="POST">
		<input type="hidden" name="playerId" value="${UPDATE_PLAYER.id}" />
		<table>
			<tbody>
				<tr>
					<td><label>Name</label></td>
					<td><input type="text" name="name" value="${UPDATE_PLAYER.name}"/></td>
				</tr>
				
				<tr>
					<td><label>Height (cm)</label></td>
					<td><input type="text" name="heightCm" value="${UPDATE_PLAYER.heightCm}"/></td>
				</tr>
				
				<tr>
					<td><label>Weight (kg)</label></td>
					<td><input type="text" name="weightKg" value="${UPDATE_PLAYER.weightKg}"/></td>
				</tr>
				
				<tr>
					<td><label>Birth date</label></td>
					<td><input type="text" name="birthdate" value="${UPDATE_PLAYER.birthdate}"/></td>
				</tr>
				
				<tr>
					<td><label>Native city</label></td>
					<td><input type="text" name="nativeCity" value="${UPDATE_PLAYER.nativeCity}"/></td>
				</tr>
				
				<tr>
					<td><label>Rank</label></td>
					<td>
						<select name="selectedRank">
							<c:forEach var="tempRank" items="${ENUM_SUMO_RANKS}">
								<option value="${tempRank.toString()}">${tempRank.toString()}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
					<td><label>Coach</label></td>
					<td>
						<select name="selectedCoach">
							<c:forEach var="tempCoach" items="${ALL_COACHES}">
								<option value="${tempCoach.id}" ${tempCoach.id == UPDATE_PLAYER.coachId ? 'selected="selected"' : ''}>${tempCoach.name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
					<td><label>Club</label></td>
					<td>
						<select name="selectedClub">
							<c:forEach var="tempClub" items="${ALL_CLUBS}">
								<option value="${tempClub.id}" ${tempClub.id == UPDATE_PLAYER.clubId ? 'selected="selected"' : ''}>${tempClub.name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
					<td><label></label></td>
					<td><input type="submit" name="savePlayer" value="Save"/></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>