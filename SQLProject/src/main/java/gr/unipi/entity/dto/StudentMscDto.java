package gr.unipi.entity.dto;

import gr.unipi.entity.Msc;
import gr.unipi.entity.Student;
import gr.unipi.entity.StudentMsc;
import jakarta.annotation.Nullable;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import java.sql.Date;

public class StudentMscDto {
    @Size(min = 6, max = 6, message = "ID must be 6 characters")
    private String id;
    @NotNull(message = "Student cannot be null")
    private Student student;
    @NotNull(message = "Msc cannot be null")
    private Msc msc;
    @NotNull(message = "Registration cannot be null")
    private Date registration;
    @Nullable
    // This is String because it can be null, so request with graduation value '' is valid. If it was Date, then request with graduation value '' would be invalid
    private String graduation;
    @Nullable
    private Float grade;

    public StudentMscDto() {
    }

    public StudentMsc toStudentMsc() {
        return new StudentMsc(id, student, msc, registration, graduation.equals("") ? null : Date.valueOf(graduation), grade);
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

    public Msc getMsc() {
        return msc;
    }

    public void setMsc(Msc msc) {
        this.msc = msc;
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