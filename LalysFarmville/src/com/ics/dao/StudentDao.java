package com.ics.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ics.bean.LoginBean;
import com.ics.bean.StudentBean;

public class StudentDao {
	public void updateStudent(String firstName, String lastName, String middleName, String streetNumber,
			String barangay, String district, String province, String region, String emailAddress, String contactNo,
			String nationality, String sex, String civilStatus, String employmentStatus, String birthDate,
			String birthPlace, String educAttain, String parentLName, String parentFName, String parentMName,
			String parentAddress, String studentClassification, String disabilityInput, String takeNCAE, String course,
			String scholarship, String scheduleId, String status, String passedUserId, String ncaeWhen, String ncaeWhere, String cityMunicipality) {
		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
					"2001may19");
			Statement stat = conn.createStatement();
			Statement stat2 = conn.createStatement();

			stat.execute("UPDATE student SET student_fname='" + firstName + "', student_lname='" + lastName
					+ "', student_mname='" + middleName + "', streetNum='" + streetNumber + "', brgy='" + barangay
					+ "', district='" + district + "', province='" + province + "', region='" + region + "', emailAdd='"
					+ emailAddress + "', contactNo='" + contactNo + "', nationality='" + nationality + "', sex='" + sex
					+ "', civilStatus='" + civilStatus + "', empStatus='" + employmentStatus + "', birthDate='"
					+ birthDate + "', birthPlace='" + birthPlace + "', educAttain='" + educAttain + "', parent_lname='"
					+ parentLName + "', parent_fname='" + parentFName + "', parent_mname='" + parentMName
					+ "', parent_address='" + parentAddress + "', student_classification='" + studentClassification
					+ "', typeDisability='" + disabilityInput + "', accompNcae='" + takeNCAE + "', course='" + course
					+ "', typeScholarship='"+ scholarship +"', schedule_id='" + scheduleId + "', status='" + status
					+ "', whenNcae='"+ ncaeWhen +"', whereNcae='"+ ncaeWhere +"', citymunicipality='"+ cityMunicipality +"' WHERE user_id=" + passedUserId + "");
			
			System.out.println("UPDATE student SET student_fname='" + firstName + "', student_lname='" + lastName
					+ "', student_mname='" + middleName + "', streetNum='" + streetNumber + "', brgy='" + barangay
					+ "', district='" + district + "', province='" + province + "', region='" + region + "', emailAdd='"
					+ emailAddress + "', contactNo='" + contactNo + "', nationality='" + nationality + "', sex='" + sex
					+ "', civilStatus='" + civilStatus + "', empStatus='" + employmentStatus + "', birthDate='"
					+ birthDate + "', birthPlace='" + birthPlace + "', educAttain='" + educAttain + "', parent_lname='"
					+ parentLName + "', parent_fname='" + parentFName + "', parent_mname='" + parentMName
					+ "', parent_address='" + parentAddress + "', student_classification='" + studentClassification
					+ "', typeDisability='" + disabilityInput + "', accompNcae='" + takeNCAE + "', course='" + course
					+ "', typeScholarship='"+ scholarship +"', schedule_id='" + scheduleId + "', status='" + status
					+ "', whenNcae='"+ ncaeWhen +"', whereNcae='"+ ncaeWhere +"', citymunicipality='"+ cityMunicipality +"' WHERE user_id=" + passedUserId + "");

		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public void deleteStudent(String studentId) {
		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
					"2001may19");
			Statement stat = conn.createStatement();
			Statement stat2 = conn.createStatement();

			stat.execute("DELETE FROM student WHERE user_id=" + studentId + "");
			stat2.execute("DELETE FROM loginaccount WHERE user_id=" + studentId + "");
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public void updateCompany(String company, String salaryMin, String salaryMax, String userId) {
		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
					"2001may19");
			Statement stat = conn.createStatement();
			Statement stat2 = conn.createStatement();

			stat.execute("UPDATE student set gradTrace='"+ company +"', salarymin='"+ salaryMin +"', salarymax='"+ salaryMax +"' WHERE user_id="+ userId +"");

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public StudentBean selectStudent(String userId) throws ClassNotFoundException {
		StudentBean student = null;
		Class.forName("com.mysql.jdbc.Driver");
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
				"2001may19");
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from student where user_id = '" + userId + "'")) {

			ResultSet rs = preparedStatement.executeQuery("select * from student where user_id = '" + userId + "'");
			while (rs.next()) {
				// System.out.println(rs.getString("student_fname"));
				int userId1 = rs.getInt("user_id");
				String firstName = rs.getString("student_fname");
				String lastName = rs.getString("student_lname");
				String middleName = rs.getString("student_mname");
				String streetNum = rs.getString("streetNum");
				String brgy = rs.getString("brgy");
				String district = rs.getString("district");
				String province = rs.getString("province");
				String region = rs.getString("region");
				String emailAdd = rs.getString("emailAdd");
				String contactNo = rs.getString("contactNo");
				String nationality = rs.getString("nationality");
				String sex = rs.getString("sex");
				String civilStatus = rs.getString("civilStatus");
				String employmentStatus = rs.getString("empStatus");
				String birthDate = rs.getString("birthDate");
				String birthPlace = rs.getString("birthPlace");
				String educAttain = rs.getString("educAttain");
				String parentLName = rs.getString("parent_lname");
				String parentFName = rs.getString("parent_fname");
				String parentMName = rs.getString("parent_mname");
				String parentAddress = rs.getString("parent_address");
				String studentClassification = rs.getString("student_classification");
				String disabilityType = rs.getString("typeDisability");
				String accompNcae = rs.getString("accompNcae");
				String course = rs.getString("course");
				String scholarshipType = rs.getString("typeScholarship");
				String status = rs.getString("status");
				Date regDate = rs.getDate("registerDate");
				int scheduleId = rs.getInt("schedule_id");
				String ncaeWhen = rs.getString("whenNcae");
				String ncaeWhere = rs.getString("whereNcae");
				String cityMunicipality = rs.getString("citymunicipality");
				String company = rs.getString("gradTrace");
				Float salaryMin = rs.getFloat("salarymin");
				Float salaryMax = rs.getFloat("salarymax");
				student = new StudentBean(scheduleId, firstName, lastName, middleName, streetNum, brgy, district,
						province, region, emailAdd, contactNo, nationality, sex, civilStatus, employmentStatus,
						birthDate, birthPlace, educAttain, parentLName, parentFName, parentMName, parentAddress,
						studentClassification, accompNcae, course, scholarshipType, disabilityType, userId1, status, regDate, ncaeWhen, ncaeWhere, cityMunicipality, company, salaryMin, salaryMax);
			}
			System.out.println(userId);
		} catch (Exception p) {
			System.out.println(p);
		}

		return student;
	}
	

	public void addStudent(String firstName, String lastName, String middleName, String streetNumber, String barangay,
			String district, String province, String region, String emailAddress, String contactNo, String nationality,
			String sex, String civilStatus, String employmentStatus, String birthDate, String birthPlace,
			String educAttain, String parentLName, String parentFName, String parentMName, String parentAddress,
			String studentClassification, String disabilityInput, String takeNCAE, String course, Date sqlDate, String ncaeWhen, String ncaeWhere, String cityMunicipality) {
		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
					"2001may19");
			Statement stat = conn.createStatement();
			stat.execute(
					"INSERT INTO student(schedule_id, student_fname, student_lname, student_mname, streetNum, brgy, district, province, region, emailAdd, contactNo, nationality, sex, civilStatus, empStatus, birthDate, birthPlace, educAttain, parent_lname, parent_fname, parent_mname, parent_address, student_classification, typeDisability, accompNcae, course, typescholarship, status, whenNcae, whereNcae, citymunicipality, registerDate) VALUES("
							+ 0 + ", '" + firstName + "','" + lastName + "','" + middleName + "','" + streetNumber
							+ "','" + barangay + "','" + district + "','" + province + "','" + region + "','"
							+ emailAddress + "','" + contactNo + "','" + nationality + "','" + sex + "','" + civilStatus
							+ "','" + employmentStatus + "','" + birthDate + "','" + birthPlace + "','" + educAttain
							+ "','" + parentLName + "','" + parentFName + "','" + parentMName + "','" + parentAddress
							+ "','" + studentClassification + "','" + disabilityInput + "','" + takeNCAE + "','"
							+ course + "','tbd', 'Pending Approval', '"+ ncaeWhen +"', '"+ ncaeWhere +"', '"+ cityMunicipality +"', '"+ sqlDate +"');");

		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public String selectStudentCourse(String userId) throws ClassNotFoundException {
		String course = null;
		Class.forName("com.mysql.jdbc.Driver");
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
				"2001may19");
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from student where user_id = '" + userId + "'")) {

			ResultSet rs = preparedStatement.executeQuery("select * from student where user_id = '" + userId + "'");
			while (rs.next()) {
				// System.out.println(rs.getString("student_fname"));
				int userId1 = rs.getInt("user_id");
				String firstName = rs.getString("student_fname");
				String lastName = rs.getString("student_lname");
				String middleName = rs.getString("student_mname");
				String streetNum = rs.getString("streetNum");
				String brgy = rs.getString("brgy");
				String district = rs.getString("district");
				String province = rs.getString("province");
				String region = rs.getString("region");
				String emailAdd = rs.getString("emailAdd");
				String contactNo = rs.getString("contactNo");
				String nationality = rs.getString("nationality");
				String sex = rs.getString("sex");
				String civilStatus = rs.getString("civilStatus");
				String employmentStatus = rs.getString("empStatus");
				String birthDate = rs.getString("birthDate");
				String birthPlace = rs.getString("birthPlace");
				String educAttain = rs.getString("educAttain");
				String parentLName = rs.getString("parent_lname");
				String parentFName = rs.getString("parent_fname");
				String parentMName = rs.getString("parent_mname");
				String parentAddress = rs.getString("parent_address");
				String studentClassification = rs.getString("student_classification");
				String disabilityType = rs.getString("typeDisability");
				String accompNcae = rs.getString("accompNcae");
				 course = rs.getString("course");
				String scholarshipType = rs.getString("typeScholarship");
				String status = rs.getString("status");
				int scheduleId = rs.getInt("schedule_id");
				
			}
			System.out.println(userId);
		} catch (Exception p) {
			System.out.println(p);
		}

		return course;
	}
	
	public int selectStudentSchedule(String userId) throws ClassNotFoundException {
		int scheduleId = 0;
		Class.forName("com.mysql.jdbc.Driver");
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
				"2001may19");
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from student where user_id = '" + userId + "'")) {

			ResultSet rs = preparedStatement.executeQuery("select * from student where user_id = '" + userId + "'");
			while (rs.next()) {
				// System.out.println(rs.getString("student_fname"));
				int userId1 = rs.getInt("user_id");
				String firstName = rs.getString("student_fname");
				String lastName = rs.getString("student_lname");
				String middleName = rs.getString("student_mname");
				String streetNum = rs.getString("streetNum");
				String brgy = rs.getString("brgy");
				String district = rs.getString("district");
				String province = rs.getString("province");
				String region = rs.getString("region");
				String emailAdd = rs.getString("emailAdd");
				String contactNo = rs.getString("contactNo");
				String nationality = rs.getString("nationality");
				String sex = rs.getString("sex");
				String civilStatus = rs.getString("civilStatus");
				String employmentStatus = rs.getString("empStatus");
				String birthDate = rs.getString("birthDate");
				String birthPlace = rs.getString("birthPlace");
				String educAttain = rs.getString("educAttain");
				String parentLName = rs.getString("parent_lname");
				String parentFName = rs.getString("parent_fname");
				String parentMName = rs.getString("parent_mname");
				String parentAddress = rs.getString("parent_address");
				String studentClassification = rs.getString("student_classification");
				String disabilityType = rs.getString("typeDisability");
				String accompNcae = rs.getString("accompNcae");
				String course = rs.getString("course");
				String scholarshipType = rs.getString("typeScholarship");
				String status = rs.getString("status");
				
				scheduleId = rs.getInt("schedule_id");
				
			}
			System.out.println(userId);
		} catch (Exception p) {
			System.out.println(p);
		}

		return scheduleId;
	}
	
	public List<StudentBean> selectStudentList() throws ClassNotFoundException {
		List<StudentBean> student = new ArrayList<>();
		Class.forName("com.mysql.jdbc.Driver");
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
				"2001may19");
				PreparedStatement preparedStatement = connection
						.prepareStatement("SELECT * FROM student WHERE status<>'Pending Approval'")) {

			ResultSet rs = preparedStatement.executeQuery("SELECT * FROM student WHERE status<>'Pending Approval'");
			while (rs.next()) {
				// System.out.println(rs.getString("student_fname"));
				StudentBean studentBean = new StudentBean();
				studentBean.setUserID(rs.getInt("user_id"));
				studentBean.setStudentFName(rs.getString("student_fname"));
				studentBean.setStudentLName(rs.getString("student_lname"));
				studentBean.setStudentMName(rs.getString("student_mname"));
				studentBean.setStreetNum(rs.getString("streetNum"));
				studentBean.setBrgy(rs.getString("brgy"));
				studentBean.setDistrict(rs.getString("district"));
				studentBean.setProvince(rs.getString("province"));
				studentBean.setRegion(rs.getString("region"));
				studentBean.setEmailAdd(rs.getString("emailAdd"));
				studentBean.setContactNo(rs.getString("contactNo"));
				studentBean.setNationality(rs.getString("nationality"));
				studentBean.setSex(rs.getString("sex"));
				studentBean.setCivilStatus(rs.getString("civilStatus"));
				studentBean.setEmpStatus(rs.getString("empStatus"));
				studentBean.setBirthDate(rs.getString("birthDate"));
				studentBean.setBirthPlace(rs.getString("birthPlace"));
				studentBean.setEducAttain(rs.getString("educAttain"));
				studentBean.setParentLName(rs.getString("parent_lname"));
				studentBean.setParentFName(rs.getString("parent_fname"));
				studentBean.setParentMName(rs.getString("parent_mname"));
				studentBean.setParentAddress(rs.getString("parent_address"));
				studentBean.setStudentClassification(rs.getString("student_classification"));
				studentBean.setDisabilityType(rs.getString("typeDisability"));
				studentBean.setAccompNcae(rs.getString("accompNcae"));
				studentBean.setCourse(rs.getString("course"));
				studentBean.setScholarshipType(rs.getString("typeScholarship"));
				studentBean.setStatus(rs.getString("status"));
				studentBean.setScheduleId(rs.getInt("schedule_id"));
				studentBean.setRegisterDate(rs.getDate("registerDate"));
				studentBean.setNcaeWhen(rs.getString("whenNcae"));
				studentBean.setNcaeWhere(rs.getString("whereNcae"));
				studentBean.setCityMunicipality(rs.getString("citymunicipality"));
				studentBean.setCompany(rs.getString("gradTrace"));
				studentBean.setSalaryMin(rs.getFloat("salarymin"));
				studentBean.setSalaryMax(rs.getFloat("salarymax"));
				student.add(studentBean);
				
			}
			//System.out.println(userId);
		} catch (Exception p) {
			System.out.println(p);
		}

		return student;
	}
	
	public List<StudentBean> selectStudentListPending() throws ClassNotFoundException {
		List<StudentBean> student = new ArrayList<>();
		Class.forName("com.mysql.jdbc.Driver");
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
				"2001may19");
				PreparedStatement preparedStatement = connection
						.prepareStatement("SELECT * FROM student WHERE status='Pending Approval'")) {

			ResultSet rs = preparedStatement.executeQuery("SELECT * FROM student WHERE status='Pending Approval'");
			while (rs.next()) {
				// System.out.println(rs.getString("student_fname"));
				StudentBean studentBean = new StudentBean();
				studentBean.setUserID(rs.getInt("user_id"));
				studentBean.setStudentFName(rs.getString("student_fname"));
				studentBean.setStudentLName(rs.getString("student_lname"));
				studentBean.setStudentMName(rs.getString("student_mname"));
				studentBean.setStreetNum(rs.getString("streetNum"));
				studentBean.setBrgy(rs.getString("brgy"));
				studentBean.setDistrict(rs.getString("district"));
				studentBean.setProvince(rs.getString("province"));
				studentBean.setRegion(rs.getString("region"));
				studentBean.setEmailAdd(rs.getString("emailAdd"));
				studentBean.setContactNo(rs.getString("contactNo"));
				studentBean.setNationality(rs.getString("nationality"));
				studentBean.setSex(rs.getString("sex"));
				studentBean.setCivilStatus(rs.getString("civilStatus"));
				studentBean.setEmpStatus(rs.getString("empStatus"));
				studentBean.setBirthDate(rs.getString("birthDate"));
				studentBean.setBirthPlace(rs.getString("birthPlace"));
				studentBean.setEducAttain(rs.getString("educAttain"));
				studentBean.setParentLName(rs.getString("parent_lname"));
				studentBean.setParentFName(rs.getString("parent_fname"));
				studentBean.setParentMName(rs.getString("parent_mname"));
				studentBean.setParentAddress(rs.getString("parent_address"));
				studentBean.setStudentClassification(rs.getString("student_classification"));
				studentBean.setDisabilityType(rs.getString("typeDisability"));
				studentBean.setAccompNcae(rs.getString("accompNcae"));
				studentBean.setCourse(rs.getString("course"));
				studentBean.setScholarshipType(rs.getString("typeScholarship"));
				studentBean.setStatus(rs.getString("status"));
				studentBean.setScheduleId(rs.getInt("schedule_id"));
				studentBean.setRegisterDate(rs.getDate("registerDate"));
				studentBean.setNcaeWhen(rs.getString("whenNcae"));
				studentBean.setNcaeWhere(rs.getString("whereNcae"));
				studentBean.setCityMunicipality(rs.getString("citymunicipality"));
				studentBean.setCompany(rs.getString("gradTrace"));
				studentBean.setSalaryMin(rs.getFloat("salarymin"));
				studentBean.setSalaryMax(rs.getFloat("salarymax"));
				student.add(studentBean);
				
			}
			//System.out.println(userId);
		} catch (Exception p) {
			System.out.println(p);
		}

		return student;
	}
	public List<StudentBean> selectStudentListSearch(String search) throws ClassNotFoundException {
		List<StudentBean> student = new ArrayList<>();
		Class.forName("com.mysql.jdbc.Driver");
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
				"2001may19");
				PreparedStatement preparedStatement = connection
						.prepareStatement("SELECT * FROM student WHERE status!='Pending Approval' AND (student_fname LIKE '%"+ search +"%' OR student_lname LIKE '%"+ search +"%' OR student_mname LIKE '%"+ search +"%')")) {

			ResultSet rs = preparedStatement.executeQuery("SELECT * FROM student WHERE status!='Pending Approval' AND (student_fname LIKE '%"+ search +"%' OR student_lname LIKE '%"+ search +"%' OR student_mname LIKE '%"+ search +"%')");
			while (rs.next()) {
				// System.out.println(rs.getString("student_fname"));
				StudentBean studentBean = new StudentBean();
				studentBean.setUserID(rs.getInt("user_id"));
				studentBean.setStudentFName(rs.getString("student_fname"));
				studentBean.setStudentLName(rs.getString("student_lname"));
				studentBean.setStudentMName(rs.getString("student_mname"));
				studentBean.setStreetNum(rs.getString("streetNum"));
				studentBean.setBrgy(rs.getString("brgy"));
				studentBean.setDistrict(rs.getString("district"));
				studentBean.setProvince(rs.getString("province"));
				studentBean.setRegion(rs.getString("region"));
				studentBean.setEmailAdd(rs.getString("emailAdd"));
				studentBean.setContactNo(rs.getString("contactNo"));
				studentBean.setNationality(rs.getString("nationality"));
				studentBean.setSex(rs.getString("sex"));
				studentBean.setCivilStatus(rs.getString("civilStatus"));
				studentBean.setEmpStatus(rs.getString("empStatus"));
				studentBean.setBirthDate(rs.getString("birthDate"));
				studentBean.setBirthPlace(rs.getString("birthPlace"));
				studentBean.setEducAttain(rs.getString("educAttain"));
				studentBean.setParentLName(rs.getString("parent_lname"));
				studentBean.setParentFName(rs.getString("parent_fname"));
				studentBean.setParentMName(rs.getString("parent_mname"));
				studentBean.setParentAddress(rs.getString("parent_address"));
				studentBean.setStudentClassification(rs.getString("student_classification"));
				studentBean.setDisabilityType(rs.getString("typeDisability"));
				studentBean.setAccompNcae(rs.getString("accompNcae"));
				studentBean.setCourse(rs.getString("course"));
				studentBean.setScholarshipType(rs.getString("typeScholarship"));
				studentBean.setStatus(rs.getString("status"));
				studentBean.setScheduleId(rs.getInt("schedule_id"));
				studentBean.setRegisterDate(rs.getDate("registerDate"));
				studentBean.setNcaeWhen(rs.getString("whenNcae"));
				studentBean.setNcaeWhere(rs.getString("whereNcae"));
				studentBean.setCityMunicipality(rs.getString("citymunicipality"));
				studentBean.setCompany(rs.getString("gradTrace"));
				studentBean.setSalaryMin(rs.getFloat("salarymin"));
				studentBean.setSalaryMax(rs.getFloat("salarymax"));
				student.add(studentBean);
				
			}
			//System.out.println(userId);
		} catch (Exception p) {
			System.out.println(p);
		}

		return student;
	}
	
	public List<StudentBean> selectStudentListSearchPending(String search) throws ClassNotFoundException {
		List<StudentBean> student = new ArrayList<>();
		Class.forName("com.mysql.jdbc.Driver");
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
				"2001may19");
				PreparedStatement preparedStatement = connection
						.prepareStatement("SELECT * FROM student WHERE (student_fname LIKE '%"+ search +"%' OR student_lname LIKE '%"+ search +"%' OR student_mname LIKE '%"+ search +"%') AND status='Pending Approval'")) {

			ResultSet rs = preparedStatement.executeQuery("SELECT * FROM student WHERE (student_fname LIKE '%"+ search +"%' OR student_lname LIKE '%"+ search +"%' OR student_mname LIKE '%"+ search +"%') AND status='Pending Approval'");
			while (rs.next()) {
				// System.out.println(rs.getString("student_fname"));
				StudentBean studentBean = new StudentBean();
				studentBean.setUserID(rs.getInt("user_id"));
				studentBean.setStudentFName(rs.getString("student_fname"));
				studentBean.setStudentLName(rs.getString("student_lname"));
				studentBean.setStudentMName(rs.getString("student_mname"));
				studentBean.setStreetNum(rs.getString("streetNum"));
				studentBean.setBrgy(rs.getString("brgy"));
				studentBean.setDistrict(rs.getString("district"));
				studentBean.setProvince(rs.getString("province"));
				studentBean.setRegion(rs.getString("region"));
				studentBean.setEmailAdd(rs.getString("emailAdd"));
				studentBean.setContactNo(rs.getString("contactNo"));
				studentBean.setNationality(rs.getString("nationality"));
				studentBean.setSex(rs.getString("sex"));
				studentBean.setCivilStatus(rs.getString("civilStatus"));
				studentBean.setEmpStatus(rs.getString("empStatus"));
				studentBean.setBirthDate(rs.getString("birthDate"));
				studentBean.setBirthPlace(rs.getString("birthPlace"));
				studentBean.setEducAttain(rs.getString("educAttain"));
				studentBean.setParentLName(rs.getString("parent_lname"));
				studentBean.setParentFName(rs.getString("parent_fname"));
				studentBean.setParentMName(rs.getString("parent_mname"));
				studentBean.setParentAddress(rs.getString("parent_address"));
				studentBean.setStudentClassification(rs.getString("student_classification"));
				studentBean.setDisabilityType(rs.getString("typeDisability"));
				studentBean.setAccompNcae(rs.getString("accompNcae"));
				studentBean.setCourse(rs.getString("course"));
				studentBean.setScholarshipType(rs.getString("typeScholarship"));
				studentBean.setStatus(rs.getString("status"));
				studentBean.setScheduleId(rs.getInt("schedule_id"));
				studentBean.setRegisterDate(rs.getDate("registerDate"));
				studentBean.setNcaeWhen(rs.getString("whenNcae"));
				studentBean.setNcaeWhere(rs.getString("whereNcae"));
				studentBean.setCityMunicipality(rs.getString("citymunicipality"));
				studentBean.setCompany(rs.getString("gradTrace"));
				studentBean.setSalaryMin(rs.getFloat("salarymin"));
				studentBean.setSalaryMax(rs.getFloat("salarymax"));
				student.add(studentBean);
				
			}
			//System.out.println(userId);
		} catch (Exception p) {
			System.out.println(p);
		}

		return student;
	}
	//"SELECT COUNT(*) FROM student WHERE registerDate BETWEEN '"+ startDate +"' AND '"+ endDate +"'"
	public int countStudent(String startDate, String endDate) throws ClassNotFoundException {
		int count = 0;
		Class.forName("com.mysql.jdbc.Driver");
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
				"2001may19");
				PreparedStatement preparedStatement = connection
						.prepareStatement("SELECT COUNT(*) FROM student WHERE registerDate BETWEEN '"+ startDate +"' AND '"+ endDate +"'")) {

			ResultSet rs = preparedStatement.executeQuery("SELECT COUNT(*) FROM student WHERE registerDate BETWEEN '"+ startDate +"' AND '"+ endDate +"'");
			rs.next();
			count = rs.getInt(1);
			//System.out.println(userId);
		} catch (Exception p) {
			System.out.println(p);
		}
		return count;
	}
	
	public List<StudentBean> selectStudentListReport(String startDate, String endDate) throws ClassNotFoundException {
		List<StudentBean> student = new ArrayList<>();
		Class.forName("com.mysql.jdbc.Driver");
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
				"2001may19");
				PreparedStatement preparedStatement = connection
						.prepareStatement("SELECT * FROM student WHERE registerDate BETWEEN '"+ startDate +"' AND '"+ endDate +"'")) {

			ResultSet rs = preparedStatement.executeQuery("SELECT * FROM student WHERE registerDate BETWEEN '"+ startDate +"' AND '"+ endDate +"'");
			while (rs.next()) {
				// System.out.println(rs.getString("student_fname"));
				StudentBean studentBean = new StudentBean();
				studentBean.setUserID(rs.getInt("user_id"));
				studentBean.setStudentFName(rs.getString("student_fname"));
				studentBean.setStudentLName(rs.getString("student_lname"));
				studentBean.setStudentMName(rs.getString("student_mname"));
				studentBean.setStreetNum(rs.getString("streetNum"));
				studentBean.setBrgy(rs.getString("brgy"));
				studentBean.setDistrict(rs.getString("district"));
				studentBean.setProvince(rs.getString("province"));
				studentBean.setRegion(rs.getString("region"));
				studentBean.setEmailAdd(rs.getString("emailAdd"));
				studentBean.setContactNo(rs.getString("contactNo"));
				studentBean.setNationality(rs.getString("nationality"));
				studentBean.setSex(rs.getString("sex"));
				studentBean.setCivilStatus(rs.getString("civilStatus"));
				studentBean.setEmpStatus(rs.getString("empStatus"));
				studentBean.setBirthDate(rs.getString("birthDate"));
				studentBean.setBirthPlace(rs.getString("birthPlace"));
				studentBean.setEducAttain(rs.getString("educAttain"));
				studentBean.setParentLName(rs.getString("parent_lname"));
				studentBean.setParentFName(rs.getString("parent_fname"));
				studentBean.setParentMName(rs.getString("parent_mname"));
				studentBean.setParentAddress(rs.getString("parent_address"));
				studentBean.setStudentClassification(rs.getString("student_classification"));
				studentBean.setDisabilityType(rs.getString("typeDisability"));
				studentBean.setAccompNcae(rs.getString("accompNcae"));
				studentBean.setCourse(rs.getString("course"));
				studentBean.setScholarshipType(rs.getString("typeScholarship"));
				studentBean.setStatus(rs.getString("status"));
				studentBean.setScheduleId(rs.getInt("schedule_id"));
				studentBean.setRegisterDate(rs.getDate("registerDate"));
				studentBean.setNcaeWhen(rs.getString("whenNcae"));
				studentBean.setNcaeWhere(rs.getString("whereNcae"));
				studentBean.setCityMunicipality(rs.getString("citymunicipality"));
				studentBean.setCompany(rs.getString("gradTrace"));
				studentBean.setSalaryMin(rs.getFloat("salarymin"));
				studentBean.setSalaryMax(rs.getFloat("salarymax"));
				student.add(studentBean);
				
			}
			//System.out.println(userId);
		} catch (Exception p) {
			System.out.println(p);
		}

		return student;
	}
	
	public List<StudentBean> selectStudentListSalaryRange(String startDate, String endDate, String salaryMin, String salaryMax) throws ClassNotFoundException {
		List<StudentBean> student = new ArrayList<>();
		Class.forName("com.mysql.jdbc.Driver");
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
				"2001may19");
				PreparedStatement preparedStatement = connection
						.prepareStatement("SELECT * FROM student WHERE registerDate BETWEEN '"+ startDate +"' AND '"+ endDate +"' AND salarymin BETWEEN "+ salaryMin +" AND "+ salaryMax +" OR salarymax BETWEEN "+ salaryMin +" AND "+ salaryMax +"")) {

			ResultSet rs = preparedStatement.executeQuery("SELECT * FROM student WHERE registerDate BETWEEN '"+ startDate +"' AND '"+ endDate +"' AND salarymin BETWEEN "+ salaryMin +" AND "+ salaryMax +" OR salarymax BETWEEN "+ salaryMin +" AND "+ salaryMax +"" );
			System.out.println("SELECT * FROM lalysfarmville.student WHERE (registerDate BETWEEN '"+ startDate +"' AND '"+ endDate +"') AND (salarymin<="+salaryMin+" OR salarymin>="+salaryMax+"  OR salarymax<="+salaryMin+" OR salarymax>="+salaryMax+".00)");
			while (rs.next()) {
				// System.out.println(rs.getString("student_fname"));
				StudentBean studentBean = new StudentBean();
				studentBean.setUserID(rs.getInt("user_id"));
				studentBean.setStudentFName(rs.getString("student_fname"));
				studentBean.setStudentLName(rs.getString("student_lname"));
				studentBean.setStudentMName(rs.getString("student_mname"));
				studentBean.setStreetNum(rs.getString("streetNum"));
				studentBean.setBrgy(rs.getString("brgy"));
				studentBean.setDistrict(rs.getString("district"));
				studentBean.setProvince(rs.getString("province"));
				studentBean.setRegion(rs.getString("region"));
				studentBean.setEmailAdd(rs.getString("emailAdd"));
				studentBean.setContactNo(rs.getString("contactNo"));
				studentBean.setNationality(rs.getString("nationality"));
				studentBean.setSex(rs.getString("sex"));
				studentBean.setCivilStatus(rs.getString("civilStatus"));
				studentBean.setEmpStatus(rs.getString("empStatus"));
				studentBean.setBirthDate(rs.getString("birthDate"));
				studentBean.setBirthPlace(rs.getString("birthPlace"));
				studentBean.setEducAttain(rs.getString("educAttain"));
				studentBean.setParentLName(rs.getString("parent_lname"));
				studentBean.setParentFName(rs.getString("parent_fname"));
				studentBean.setParentMName(rs.getString("parent_mname"));
				studentBean.setParentAddress(rs.getString("parent_address"));
				studentBean.setStudentClassification(rs.getString("student_classification"));
				studentBean.setDisabilityType(rs.getString("typeDisability"));
				studentBean.setAccompNcae(rs.getString("accompNcae"));
				studentBean.setCourse(rs.getString("course"));
				studentBean.setScholarshipType(rs.getString("typeScholarship"));
				studentBean.setStatus(rs.getString("status"));
				studentBean.setScheduleId(rs.getInt("schedule_id"));
				studentBean.setRegisterDate(rs.getDate("registerDate"));
				studentBean.setNcaeWhen(rs.getString("whenNcae"));
				studentBean.setNcaeWhere(rs.getString("whereNcae"));
				studentBean.setCityMunicipality(rs.getString("citymunicipality"));
				studentBean.setCompany(rs.getString("gradTrace"));
				studentBean.setSalaryMin(rs.getFloat("salarymin"));
				studentBean.setSalaryMax(rs.getFloat("salarymax"));
				student.add(studentBean);
				
			}
			//System.out.println(userId);
		} catch (Exception p) {
			System.out.println(p);
		}

		return student;
	}
	
	public List<StudentBean> selectStudentScheduleList(String scheduleid) throws ClassNotFoundException {
		List<StudentBean> student = new ArrayList<>();
		Class.forName("com.mysql.jdbc.Driver");
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
				"2001may19");
				PreparedStatement preparedStatement = connection
						.prepareStatement("SELECT * FROM student WHERE schedule_id="+ scheduleid +" AND status<>'Pending Approval'")) {

			ResultSet rs = preparedStatement.executeQuery("SELECT * FROM student WHERE schedule_id="+ scheduleid +" AND status<>'Pending Approval'");
			while (rs.next()) {
				// System.out.println(rs.getString("student_fname"));
				StudentBean studentBean = new StudentBean();
				studentBean.setUserID(rs.getInt("user_id"));
				studentBean.setStudentFName(rs.getString("student_fname"));
				studentBean.setStudentLName(rs.getString("student_lname"));
				studentBean.setStudentMName(rs.getString("student_mname"));
				studentBean.setStreetNum(rs.getString("streetNum"));
				studentBean.setBrgy(rs.getString("brgy"));
				studentBean.setDistrict(rs.getString("district"));
				studentBean.setProvince(rs.getString("province"));
				studentBean.setRegion(rs.getString("region"));
				studentBean.setEmailAdd(rs.getString("emailAdd"));
				studentBean.setContactNo(rs.getString("contactNo"));
				studentBean.setNationality(rs.getString("nationality"));
				studentBean.setSex(rs.getString("sex"));
				studentBean.setCivilStatus(rs.getString("civilStatus"));
				studentBean.setEmpStatus(rs.getString("empStatus"));
				studentBean.setBirthDate(rs.getString("birthDate"));
				studentBean.setBirthPlace(rs.getString("birthPlace"));
				studentBean.setEducAttain(rs.getString("educAttain"));
				studentBean.setParentLName(rs.getString("parent_lname"));
				studentBean.setParentFName(rs.getString("parent_fname"));
				studentBean.setParentMName(rs.getString("parent_mname"));
				studentBean.setParentAddress(rs.getString("parent_address"));
				studentBean.setStudentClassification(rs.getString("student_classification"));
				studentBean.setDisabilityType(rs.getString("typeDisability"));
				studentBean.setAccompNcae(rs.getString("accompNcae"));
				studentBean.setCourse(rs.getString("course"));
				studentBean.setScholarshipType(rs.getString("typeScholarship"));
				studentBean.setStatus(rs.getString("status"));
				studentBean.setScheduleId(rs.getInt("schedule_id"));
				studentBean.setRegisterDate(rs.getDate("registerDate"));
				studentBean.setNcaeWhen(rs.getString("whenNcae"));
				studentBean.setNcaeWhere(rs.getString("whereNcae"));
				studentBean.setCityMunicipality(rs.getString("citymunicipality"));
				studentBean.setCompany(rs.getString("gradTrace"));
				studentBean.setSalaryMin(rs.getFloat("salarymin"));
				studentBean.setSalaryMax(rs.getFloat("salarymax"));
				student.add(studentBean);
				
			}
			//System.out.println(userId);
		} catch (Exception p) {
			System.out.println(p);
		}

		return student;
	}
}
