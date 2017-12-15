<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Sumo DB</title>
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
			$('#addClubForm').validate({
				rules:{
					clubName:{
						required:true
					},
					startingYear:{
						required:true,
						pattern:/([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/
					},
					city:{
						required:true
					}
				},
				messages:{
					startingYear:{
						pattern:"Invalid format. Please enter yyyy-mm-dd."
					}
				}
			});
		});
	
	</script>

</head>
<body style="background: lightgrey;">
	<jsp:include page="header.jsp" />
	
	<br/>
	
	<form id="addClubForm" action="AddClub" method="POST">
	
		<table>
			<tbody>
				<tr>
					<td><label>Club name</label></td>
					<td><input type="text" name="clubName" /></td>
				</tr>
				
				<tr>
					<td><label>Starting year</label></td>
					<td><input type="text" name="startingYear" /></td>
				</tr>
				
				<tr>
					<td><label>City</label></td>
					<td><input type="text" name="city" /></td>
				</tr>
				
				<tr>
					<td><label></label></td>
					<td><input type="submit" name="addClub" value ="Add" /></td>
				</tr>
			</tbody>
		</table>
	</form>
	
</body>
</html>