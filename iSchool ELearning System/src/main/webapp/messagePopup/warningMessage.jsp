<!-- warning message -->
<%
String message=(String)session.getAttribute("message");
if(message!=null)	{
%>
<div class="container-fluid text-center mt-2" style="max-width:50vw;">

<div class="alert alert-danger alert-dismissible fade show text-center"
	role="alert">
	<strong><%=message %></strong>
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>
</div>

<%
}
session.removeAttribute("message");

%>