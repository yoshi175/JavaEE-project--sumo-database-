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
		$('#updateClubForm')
				.validate(
						{
							rules : {
								clubName : {
									required : true
								},
								startingYear : {
									required : true,
									pattern : /([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/
								},
								city : {
									required : true
								}
							},
							messages : {
								startingYear : {
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
		<h3 style="text-align: center;">Update club</h3>
		<form class="addAndUpdateForm" id="updateClubForm" action="UpdateClub"
			method="POST">

			<input type="hidden" name="clubId" value="${UPDATE_CLUB.id}" />

			<table>
				<tbody>
					<tr>
						<td><label>Club name</label></td>
						<td><input type="text" name="clubName"
							value="${UPDATE_CLUB.name}" /></td>
					</tr>

					<tr>
						<td><label>Starting year</label></td>
						<td><input type="text" name="startingYear"
							value="${UPDATE_CLUB.startingYear}" /></td>
					</tr>

					<tr>
						<td><label>City</label></td>
						<td><input type="text" name="city"
							value="${UPDATE_CLUB.city}" /></td>
					</tr>

					<tr>
						<td><label></label></td>
						<td><input type="submit" name="saveClub" value="Save" /></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>