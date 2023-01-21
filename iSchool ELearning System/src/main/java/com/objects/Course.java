package com.objects;

public class Course {
	String courseID;
	String courseDescription;
	String author;
	String duration;
	String originalPrice;
	String sellingPrice;
	String courseName;
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getCourseID() {
		return courseID;
	}
	public String getCourseDescription() {
		return courseDescription;
	}
	public String getAuthor() {
		return author;
	}
	public String getDuration() {
		return duration;
	}
	public String getOriginalPrice() {
		return originalPrice;
	}
	public String getSellingPrice() {
		return sellingPrice;
	}
	
	public void setCourseID(String courseID) {
		this.courseID = courseID;
	}
	public void setCourseDescription(String courseDescription) {
		this.courseDescription = courseDescription;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public void setOriginalPrice(String originalPrice) {
		this.originalPrice = originalPrice;
	}
	public void setSellingPrice(String sellingPrice) {
		this.sellingPrice = sellingPrice;
	}
	
}
