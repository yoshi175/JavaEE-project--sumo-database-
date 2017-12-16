<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<jsp:include page="header.jsp" />

	<br />
	<div>
		<h3 style="text-align: center;">Update club</h3>
		<form class="addAndUpdateForm" action="UpdateClub" method="POST">

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