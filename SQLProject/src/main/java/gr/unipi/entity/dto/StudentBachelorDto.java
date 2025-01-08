package gr.unipi.entity.dto;

import gr.unipi.entity.Department;
import gr.unipi.entity.Student;
import gr.unipi.entity.StudentBachelor;
import jakarta.annotation.Nullable;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import java.sql.Date;

public class StudentBachelorDto{
    @Size(min = 6, max = 6, message = "ID must be 6 characters")
    private String id;
    @NotNull(message = "Student cannot be null")
    private Student student;
    @NotNull(message = "Department cannot be null")
    private Department department;
    @NotNull(message = "Registration cannot be null")
    private Date registration;
    @Nullable
    // This is String because it can be null, so request with graduation value '' is valid. If it was Date, then request with graduation value '' would be invalid
    private String graduation;
    @Nullable
    private Float grade;

    public StudentBachelorDto() {
    }

    public StudentBachelor toStudentBachelor() {
        return new StudentBachelor(id, student, department, registration, graduation.equals("") ? null : Date.valueOf(graduation), grade);
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id.toUpperCase();
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Date getRegistration() {
        return registration;
    }

    public void setRegistration(Date registration) {
        this.registration = registration;
    }

    public String getGraduation() {
        return graduation;
    }

    public void setGraduation(String graduation) {
        this.graduation = graduation;
    }

    public Float getGrade() {
        return grade;
    }

    public void setGrade(Float grade) {
        this.grade = grade;
    }
}