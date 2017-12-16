<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Sumo Database</title>
</head>
<body>

	<jsp:include page="header.jsp" />

	<br />
	<div>
		<h3 style="text-align: center;">Update coach</h3>
		<form class="addAndUpdateForm" action="UpdateCoach" method="POST">

			<input type="hidden" name="coachId" value="${UPDATE_COACH.id}" />


			<table>
				<tbody>
					<tr>
						<td><label>Name</label></td>
						<td><input type="text" name="coachName"
							value="${UPDATE_COACH.name}" /></td>
					</tr>

					<tr>
						<td><label>Birth date</label></td>
						<td><input type="text" name="birthdate"
							value="${UPDATE_COACH.birthdate}" /></td>
					</tr>

					<tr>
						<td><label>Highest rank</label></td>
						<td><select name="selectedRank">
								<c:forEach var="tempRank" items="${ENUM_SUMO_RANKS}">
									<option value="${tempRank.toString()}">${tempRank.toString()}</option>
								</c:forEach>
						</select></td>
					</tr>

					<tr>
						<td><label>Competitive matches</label></td>
						<td><input type="text" name="competitiveMatches"
							value="${UPDATE_COACH.competitiveMatches}" /></td>
					</tr>

					<tr>
						<td><label>Competitive wins</label></td>
						<td><input type="text" name="competitiveWins"
							value="${UPDATE_COACH.competitiveWins}" /></td>
					</tr>

					<tr>
						<td><label>Competitive losses</label></td>
						<td><input type="text" name="competitiveLosses"
							value="${UPDATE_COACH.competitiveLosses}" /></td>
					</tr>

					<tr>
						<td><label>Retired from competing</label></td>
						<td><input type="text" name="retiredFromCompeting"
							value="${UPDATE_COACH.retiredFromCompeting}" /></td>
					</tr>

					<tr>
						<td><label>Club</label></td>
						<td><select name="selectedClub">
								<c:forEach var="tempClub" items="${ALL_CLUBS}">
									<option value="${tempClub.id}"
										${tempClub.id == UPDATE_COACH.clubId ? 'selected="selected"' : ''}>${tempClub.name}</option>
								</c:forEach>
						</select></td>
					</tr>

					<tr>
						<td><label></label></td>
						<td><input type="submit" name="saveCoach" value="Save" /></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>