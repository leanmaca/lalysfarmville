package com.ics.bean;

import java.sql.Date;

public class StudentBean {
	public int schedule_id;
	public String student_fname;
	public String student_lname;
	public String student_mname;
	public String streetNum;
	public String brgy;
	public String district;
	public String province;
	public String region;
	public String emailAdd;
	public String contactNo;
	public String nationality;
	public String sex;
	public String civilStatus;
	public String empStatus;
	public String birthDate;
	public String birthPlace;
	public String educAttain;
	public String parent_lname;
	public String parent_fname;
	public String parent_mname;
	public String parent_address;
	public String studentClassification;
	public String accompNcae;
	public String course;
	public String scholarshipType;
	public String disabilityType;
	public int userID;
	public String status;
	public Date registerDate;
	public String ncaeWhere;
	public String ncaeWhen;
	public String cityMunicipality;
	public String company;
	public float salaryMin;
	public float salaryMax;
	
	public StudentBean(int schedule_id, String student_fname, String student_lname, String student_mname,
			String streetNum, String brgy, String district, String province, String region, String emailAdd,
			String contactNo, String nationality, String sex, String civilStatus, String empStatus, String birthDate,
			String birthPlace, String educAttain, String parent_lname, String parent_fname, String parent_mname,
			String parent_address, String studentClassification, String accompNcae,
			String course, String scholarshipType, String disabilityType, int userID, String status, Date registerDate, String ncaeWhen, String ncaeWhere, String cityMunicipality, String company) {
		super();
		this.schedule_id = schedule_id;
		this.student_fname = student_fname;
		this.student_lname = student_lname;
		this.student_mname = student_mname;
		this.streetNum = streetNum;
		this.brgy = brgy;
		this.district = district;
		this.province = province;
		this.region = region;
		this.emailAdd = emailAdd;
		this.contactNo = contactNo;
		this.nationality = nationality;
		this.sex = sex;
		this.civilStatus = civilStatus;
		this.empStatus = empStatus;
		this.birthDate = birthDate;
		this.birthPlace = birthPlace;
		this.educAttain = educAttain;
		this.parent_lname = parent_lname;
		this.parent_fname = parent_fname;
		this.parent_mname = parent_mname;
		this.parent_address = parent_address;
		this.studentClassification = studentClassification;
		this.accompNcae = accompNcae;
		this.course = course;
		this.scholarshipType = scholarshipType;
		this.disabilityType = disabilityType;
		this.userID = userID;
		this.status = status;
		this.registerDate = registerDate;
		this.ncaeWhere = ncaeWhere;
		this.ncaeWhen = ncaeWhen;
		this.cityMunicipality = cityMunicipality;
		this.company = company;
	}
	
	
	
	public StudentBean(int schedule_id, String student_fname, String student_lname, String student_mname,
			String streetNum, String brgy, String district, String province, String region, String emailAdd,
			String contactNo, String nationality, String sex, String civilStatus, String empStatus, String birthDate,
			String birthPlace, String educAttain, String parent_lname, String parent_fname, String parent_mname,
			String parent_address, String studentClassification, String accompNcae, String course,
			String scholarshipType, String disabilityType, int userID, String status, Date registerDate,
			String ncaeWhen, String ncaeWhere, String cityMunicipality, String company, float salaryMin,
			float salaryMax) {
		super();
		this.schedule_id = schedule_id;
		this.student_fname = student_fname;
		this.student_lname = student_lname;
		this.student_mname = student_mname;
		this.streetNum = streetNum;
		this.brgy = brgy;
		this.district = district;
		this.province = province;
		this.region = region;
		this.emailAdd = emailAdd;
		this.contactNo = contactNo;
		this.nationality = nationality;
		this.sex = sex;
		this.civilStatus = civilStatus;
		this.empStatus = empStatus;
		this.birthDate = birthDate;
		this.birthPlace = birthPlace;
		this.educAttain = educAttain;
		this.parent_lname = parent_lname;
		this.parent_fname = parent_fname;
		this.parent_mname = parent_mname;
		this.parent_address = parent_address;
		this.studentClassification = studentClassification;
		this.accompNcae = accompNcae;
		this.course = course;
		this.scholarshipType = scholarshipType;
		this.disabilityType = disabilityType;
		this.userID = userID;
		this.status = status;
		this.registerDate = registerDate;
		this.ncaeWhere = ncaeWhere;
		this.ncaeWhen = ncaeWhen;
		this.cityMunicipality = cityMunicipality;
		this.company = company;
		this.salaryMin = salaryMin;
		this.salaryMax = salaryMax;
	}



	public StudentBean() {
		
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}
	public int getUserID() {
		return userID;
	}
	public void setScheduleId(int schedule_id) {
		this.schedule_id = schedule_id;
	}
	
	public int getScheduleId() {
		return schedule_id;
	}
	
	public void setStudentFName(String student_fname) {
		this.student_fname = student_fname;
	}
	
	public String getStudentFName() {
		return student_fname;
	}
	
	public void setStudentLName(String student_lname) {
		this.student_lname = student_lname;
	}
	
	public String getStudentLName() {
		return student_lname;
	}
	
	public void setStudentMName(String student_mname) {
		this.student_mname = student_mname;
	}
	
	public String getStudentMName() {
		return student_mname;
	}
	
	public void setStreetNum(String streetNum) {
		this.streetNum = streetNum;
	}
	
	public String getStreetNum() {
		return streetNum;
	}
	
	public void setBrgy(String brgy) {
		this.brgy = brgy;
	}
	
	public String getBrgy() {
		return brgy;
	}
	
	public void setDistrict(String district) {
		this.district = district;
	}
	
	public String getDistrict() {
		return district;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	
	public String getProvince() {
		return province;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	
	public String getRegion() {
		return region;
	}
	public void setEmailAdd(String emailAdd) {
		this.emailAdd = emailAdd;
	}
	
	public String getEmailAdd() {
		return emailAdd;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	
	public String getContactNo() {
		return contactNo;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	
	public String getNationality() {
		return nationality;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	
	public String getSex() {
		return sex;
	}
	public void setCivilStatus(String civilStatus) {
		this.civilStatus = civilStatus;
	}
	
	public String getCivilStatus() {
		return civilStatus;
	}
	public void setEmpStatus(String empStatus) {
		this.empStatus = empStatus;
	}
	
	public String getEmpStatus() {
		return empStatus;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthPlace(String birthPlace) {
		this.birthPlace = birthPlace;
	}
	
	public String getBirthPlace() {
		return birthPlace;
	}
	public void setEducAttain(String educAttain) {
		this.educAttain = educAttain;
	}
	
	public String getEducAttain() {
		return educAttain;
	}
	public void setParentLName(String parent_lname) {
		this.parent_lname = parent_lname;
	}
	
	public String getParentLName() {
		return parent_lname;
	}
	public void setParentFName(String parent_fname) {
		this.parent_fname = parent_fname;
	}
	
	public String getParentFName() {
		return parent_fname;
	}
	public void setParentMName(String parent_mname) {
		this.parent_mname = parent_mname;
	}
	
	public String getParentMName() {
		return parent_mname;
	}
	public void setParentAddress(String parent_address) {
		this.parent_address = parent_address;
	}
	
	public String getParentAddress() {
		return parent_address;
	}
	public void setDisabilityType(String disabilityType) {
		this.disabilityType = disabilityType;
	}
	
	public String getDisabilityType() {
		return disabilityType;
	}
	public void setAccompNcae(String accompNcae) {
		this.accompNcae = accompNcae;
	}
	
	public String getAccompNcae() {
		return accompNcae;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	
	public String getCourse() {
		return course;
	}
	public void setScholarshipType(String scholarshipType) {
		this.scholarshipType = scholarshipType;
	}
	
	public String getScholarshipType() {
		return scholarshipType;
	}
	public void setStudentClassification(String studentClassification) {
		this.studentClassification = studentClassification;
	}
	
	public String getStudentClassification() {
		return studentClassification;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getStatus() {
		return status;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public String getNcaeWhere() {
		return ncaeWhere;
	}

	public void setNcaeWhere(String ncaeWhere) {
		this.ncaeWhere = ncaeWhere;
	}

	public String getNcaeWhen() {
		return ncaeWhen;
	}

	public void setNcaeWhen(String ncaeWhen) {
		this.ncaeWhen = ncaeWhen;
	}

	public String getCityMunicipality() {
		return cityMunicipality;
	}

	public void setCityMunicipality(String cityMunicipality) {
		this.cityMunicipality = cityMunicipality;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}



	public float getSalaryMin() {
		return salaryMin;
	}



	public void setSalaryMin(float salaryMin) {
		this.salaryMin = salaryMin;
	}



	public float getSalaryMax() {
		return salaryMax;
	}



	public void setSalaryMax(float salaryMax) {
		this.salaryMax = salaryMax;
	}

	
}
