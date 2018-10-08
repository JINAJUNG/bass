package com.bass.test.vo;

import org.apache.ibatis.type.Alias;

@Alias("si")
public class StudentInfo {
		private Integer student_num;
		private String student_name;
		private String student_major;
		private Integer total_credit_hour;
		private double gpa;
		private Integer student_phone;//string으로 변환필요
		private String student_address;
		private String student_professor;
		private String student_email;
		private Integer student_grade;//String변환 학년 
		
		public StudentInfo() {
			
		}
		public StudentInfo(Integer student_num, String student_name, String student_major, Integer total_credit_hour,
				double gpa, Integer student_phone, String student_address, String student_professor,
				String student_email, Integer student_grade) {
			super();
			this.student_num = student_num;
			this.student_name = student_name;
			this.student_major = student_major;
			this.total_credit_hour = total_credit_hour;
			this.gpa = gpa;
			this.student_phone = student_phone;
			this.student_address = student_address;
			this.student_professor = student_professor;
			this.student_email = student_email;
			this.student_grade = student_grade;
		}
		public Integer getStudent_num() {
			return student_num;
		}
		public void setStudent_num(Integer student_num) {
			this.student_num = student_num;
		}
		public String getStudent_name() {
			return student_name;
		}
		public void setStudent_name(String student_name) {
			this.student_name = student_name;
		}
		public String getStudent_major() {
			return student_major;
		}
		public void setStudent_major(String student_major) {
			this.student_major = student_major;
		}
		public Integer getTotal_credit_hour() {
			return total_credit_hour;
		}
		public void setTotal_credit_hour(Integer total_credit_hour) {
			this.total_credit_hour = total_credit_hour;
		}
		public double getGpa() {
			return gpa;
		}
		public void setGpa(double gpa) {
			this.gpa = gpa;
		}
		public Integer getStudent_phone() {
			return student_phone;
		}
		public void setStudent_phone(Integer student_phone) {
			this.student_phone = student_phone;
		}
		public String getStudent_address() {
			return student_address;
		}
		public void setStudent_address(String student_address) {
			this.student_address = student_address;
		}
		public String getStudent_professor() {
			return student_professor;
		}
		public void setStudent_professor(String student_professor) {
			this.student_professor = student_professor;
		}
		public String getStudent_email() {
			return student_email;
		}
		public void setStudent_email(String student_email) {
			this.student_email = student_email;
		}
		public Integer getStudent_grade() {
			return student_grade;
		}
		public void setStudent_grade(Integer student_grade) {
			this.student_grade = student_grade;
		}
		@Override
		public String toString() {
			return "StudentInfo [student_num=" + student_num + ", student_name=" + student_name + ", student_major="
					+ student_major + ", total_credit_hour=" + total_credit_hour + ", gpa=" + gpa + ", student_phone="
					+ student_phone + ", student_address=" + student_address + ", student_professor="
					+ student_professor + ", student_email=" + student_email + ", student_grade=" + student_grade + "]";
		}
		
		
}
