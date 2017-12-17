<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Sumo Database</title>

<link type="text/css" rel="stylesheet" href="css/sumodb.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!--include jQuery -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"
	type="text/javascript"></script>

<!--include jQuery Validation Plugin-->
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.12.0/jquery.validate.min.js"
	type="text/javascript"></script>

<!--Optional: include only if you are using the extra rules in additional-methods.js -->
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.12.0/additional-methods.min.js"
	type="text/javascript"></script>

<script type="text/javascript">
	$(function() {
		$('#updatePlayerForm')
				.validate(
						{
							rules : {
								playerName : {
									required : true
								},
								heightCm : {
									required : true,
									digits : true
								},
								weightKg : {
									required : true,
									digits : true
								},
								birthdate : {
									required : true,
									pattern : /([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/
								},
								nativeCity : {
									required : true
								}
							},
							messages : {
								birthdate : {
									pattern : "Invalid format. Please enter yyyy-mm-dd."
								}
							}
						});
	});
</script>
</head>
<body>

	<jsp:include page="header.jsp" />

	<br />
	<div>
		<h3 style="text-align: center;">Update player</h3>
		<form class="addAndUpdateForm" id="updatePlayerForm"
			action="UpdatePlayer" method="POST">
			<input type="hidden" name="playerId" value="${UPDATE_PLAYER.id}" />
			<table>
				<tbody>
					<tr>
						<td><label>Name</label></td>
						<td><input type="text" name="name"
							value="${UPDATE_PLAYER.name}" /></td>
					</tr>

					<tr>
						<td><label>Height (cm)</label></td>
						<td><input type="text" name="heightCm"
							value="${UPDATE_PLAYER.heightCm}" /></td>
					</tr>

					<tr>
						<td><label>Weight (kg)</label></td>
						<td><input type="text" name="weightKg"
							value="${UPDATE_PLAYER.weightKg}" /></td>
					</tr>

					<tr>
						<td><label>Birth date</label></td>
						<td><input type="text" name="birthdate"
							value="${UPDATE_PLAYER.birthdate}" /></td>
					</tr>

					<tr>
						<td><label>Native city</label></td>
						<td><input type="text" name="nativeCity"
							value="${UPDATE_PLAYER.nativeCity}" /></td>
					</tr>

					<tr>
						<td><label>Rank</label></td>
						<td><select name="selectedRank">
								<c:forEach var="tempRank" items="${ENUM_SUMO_RANKS}">
									<option value="${tempRank.toString()}">${tempRank.toString()}</option>
								</c:forEach>
						</select></td>
					</tr>

					<tr>
						<td><label>Coach</label></td>
						<td><select name="selectedCoach">
								<c:forEach var="tempCoach" items="${ALL_COACHES}">
									<option value="${tempCoach.id}"
										${tempCoach.id == UPDATE_PLAYER.coachId ? 'selected="selected"' : ''}>${tempCoach.name}</option>
								</c:forEach>
						</select></td>
					</tr>

					<tr>
						<td><label>Club</label></td>
						<td><select name="selectedClub">
								<c:forEach var="tempClub" items="${ALL_CLUBS}">
									<option value="${tempClub.id}"
										${tempClub.id == UPDATE_PLAYER.clubId ? 'selected="selected"' : ''}>${tempClub.name}</option>
								</c:forEach>
						</select></td>
					</tr>

					<tr>
						<td><label></label></td>
						<td><input type="submit" name="savePlayer" value="Save" /></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>