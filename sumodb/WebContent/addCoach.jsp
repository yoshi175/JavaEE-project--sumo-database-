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
		$('#addCoachForm')
				.validate(
						{
							rules : {
								coachName : {
									required : true
								},
								birthdate : {
									required : true,
									pattern : /([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/
								},
								competitiveMatches : {
									required : true,
									digits : true
								},
								competitiveWins : {
									required : true,
									digits : true
								},
								competitiveLosses : {
									required : true,
									digits : true
								},
								retiredFromCompeting : {
									required : true,
									pattern : /([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/
								}
							},
							messages : {
								birthdate : {
									pattern : "Invalid format. Please enter yyyy-mm-dd."
								},
								retiredFromCompeting : {
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
		<h3 style="text-align: center;">Create coach</h3>
		<form class="addAndUpdateForm" id="addCoachForm" action="AddCoach"
			method="POST">

			<table>
				<tbody>
					<tr>
						<td><label>Name</label></td>
						<td><input type="text" name="coachName" /></td>
					</tr>

					<tr>
						<td><label>Birth date</label></td>
						<td><input type="text" name="birthdate" /></td>
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
						<td><input type="text" name="competitiveMatches" /></td>
					</tr>

					<tr>
						<td><label>Competitive wins</label></td>
						<td><input type="text" name="competitiveWins" /></td>
					</tr>

					<tr>
						<td><label>Competitive losses</label></td>
						<td><input type="text" name="competitiveLosses" /></td>
					</tr>

					<tr>
						<td><label>Retired from competing</label></td>
						<td><input type="text" name="retiredFromCompeting" /></td>
					</tr>

					<tr>
						<td><label>Club</label></td>
						<td><select name="selectedClub">
								<c:forEach var="tempClub" items="${ALL_CLUBS}">
									<option value="${tempClub.id}">${tempClub.name}</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td><label></label></td>
						<td><input type="submit" name="addCoach" value="Add" /></td>
					</tr>

				</tbody>
			</table>
		</form>
	</div>
</body>
</html>