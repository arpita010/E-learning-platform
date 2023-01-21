package com.objects;

public class Order {
	String orderId;
	String studentId;
	String studentEmail;
	String courseId;
	String courseName;
	String amount;
	public String getOrderId() {
		return orderId;
	}
	public String getStudentId() {
		return studentId;
	}
	public String getStudentEmail() {
		return studentEmail;
	}
	public String getCourseId() {
		return courseId;
	}
	public String getCourseName() {
		return courseName;
	}
	public String getAmount() {
		return amount;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public void setStudentEmail(String studentEmail) {
		this.studentEmail = studentEmail;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
}
