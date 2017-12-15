<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<!--include jQuery -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"
	type="text/javascript"></script>
	 
	<!--include jQuery Validation Plugin-->
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.12.0/jquery.validate.min.js"
	type="text/javascript"></script>
	
	<!--Optional: include only if you are using the extra rules in additional-methods.js -->
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.12.0/additional-methods.min.js"
	type="text/javascript"></script>
	
	<script type="text/javascript">
	
		$(function(){
			$('#addPlayerForm').validate({
				rules:{
					playerName:{
						required:true
					},
					heightCm:{
						required:true,
						digits:true
					},
					weightKg:{
						required:true,
						digits:true
					},
					birthdate:{
						required:true,
						pattern:/([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/
					},
					nativeCity:{
						required:true
					}
				},
				messages:{
					birthdate:{
						pattern:"Invalid format. Please enter yyyy-mm-dd."
					}
				}
			});
		});
	
	</script>
</head>
<body>

	<jsp:include page="header.jsp" />
	
	<form id="addPlayerForm" action="AddPlayer" method="POST">
		
		<table>
			<tbody>
				<tr>
					<td><label>Name</label></td>
					<td><input type="text" name="playerName" /></td>
				</tr>
				
				<tr>
					<td><label>Height (cm)</label></td>
					<td><input type="text" name="heightCm" /></td>
				</tr>
				
				<tr>
					<td><label>Weight (kg)</label></td>
					<td><input type="text" name="weightKg" /></td>
				</tr>
				
				<tr>
					<td><label>Birth date</label></td>
					<td><input type="text" name="birthdate" /></td>
				</tr>
				
				<tr>
					<td><label>Native city</label></td>
					<td><input type="text" name="nativeCity" /></td>
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
								<option value="${tempCoach.id}" >${tempCoach.name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
					<td><label>Club</label></td>
					<td>
						<select name="selectedClub">
							<c:forEach var="tempClub" items="${ALL_CLUBS}">
								<option value="${tempClub.id}" >${tempClub.name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
					<td><label></label></td>
					<td><input type="submit" name="addPlayer" value="Add"/></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>