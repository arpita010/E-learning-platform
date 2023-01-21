/**
 * 
 */
 function myfun()
 {
	document.getElementById("if1").removeAttribute("hidden");
	return true;
}
function deleteOrder(id)
{
	var form=document.getElementById("deleteOrderForm");
	var formfield=document.getElementById("delOrderId");
	formfield.value=id;
	form.submit();
}
function deleteCourse(id)
{
	var form=document.getElementById("deleteCourseForm");
	var formfield=document.getElementById("delCourseId");
	formfield.value=id;
	form.submit();
}
function deleteLesson(id)
{
	var form=document.getElementById("deleteLessonForm");
	var formfield=document.getElementById("delLessonId");
	formfield.value=id;
	form.submit();
}
function deleteStudent(id)
{
	var form=document.getElementById("deleteStudentForm");
	var formfield=document.getElementById("delStudentId");
	formfield.value=id;
	form.submit();
}
function deleteFeedback(id)
{
var form=document.getElementById("deleteFeedbackForm");
	var formfield=document.getElementById("delFeedbackId");
	formfield.value=id;
	form.submit();
	
}
function editCourse(id)
{
	var formfield=document.getElementById("editCourseId");
	formfield.value=id;
}
function editStudent(id)
{
	var formfield=document.getElementById("editStudentId");
	formfield.value=id;
}
function passwordValidation()
{
	var password=document.getElementById("password");
	var span=document.getElementById("passwordWarning");
	if(password.length<8)
	{
		span.innerHTML="**Password length must be atleast 8.";
		return false;
	}
	return true;
}
function emailValidation()
{
	var email=document.getElementById("email");
	var span=document.getElementById("emailWarning");
	let at=email.indexOf('@');
	let dot=email.lastIndexOf('.');
	if(at==-1||at==0)
	{
		span.innerHTML="**check position of '@'";
		return false;
	}
	if(dot==-1||dot<email.length-4)
	{
		span.innerHTML="**check position of '.'";
		return false;
	}
	return true;
}
function validForm()
{
	if(emailValidation()&&passwordValidation())
	return true;
	return false;
}