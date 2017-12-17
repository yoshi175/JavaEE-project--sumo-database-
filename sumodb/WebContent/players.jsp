<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Sumo Database</title>

<link type="text/css" rel="stylesheet" href="css/sumodb.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<div align="center">

		<form action="SearchPlayer" method="GET">
			<input type="text" name="searchValue" /> <input type="submit"
				value="Search" />
		</form>

		<br /> <input style="align: center;" type="button" value="Add player"
			onclick="window.location.href='AddPlayer'; return false;" /> <br />
		<br />

		<table class="list">
			<tr>
				<th>Name</th>
				<th>Height</th>
				<th>Weight</th>
				<th>Birth date</th>
				<th>Native city</th>
				<th>Rank</th>
				<th>Coach</th>
				<th>Club</th>
				<th>Update/Delete</th>
			</tr>
			<c:forEach var="tempPlayer" items="${ALL_PLAYERS}">

				<!-- creating a unique update link with an specific id referring to the selected player object -->
				<c:url var="updatePlayer" value="UpdatePlayer">
					<c:param name="playerId" value="${tempPlayer.id}" />
				</c:url>

				<!-- creating a unique delete link with an specific id referring to the selected player object -->
				<c:url var="deletePlayer" value="DeletePlayer">
					<c:param name="playerId" value="${tempPlayer.id}" />
				</c:url>

				<tr>
					<td>${tempPlayer.name}</td>
					<td>${tempPlayer.heightCm}</td>
					<td>${tempPlayer.weightKg}</td>
					<td>${tempPlayer.birthdate}</td>
					<td>${tempPlayer.nativeCity}</td>
					<td>${tempPlayer.rank}</td>
					<td>${tempPlayer.coachName}</td>
					<td>${tempPlayer.clubName}</td>
					<td><a href="${updatePlayer}"><i class="fa fa-refresh"></i></a>
						| <a href="${deletePlayer}"
						onclick="if (!(confirm('Delete ${tempPlayer.name}?'))) return false">
							<i class="fa fa-trash"></i>
					</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>