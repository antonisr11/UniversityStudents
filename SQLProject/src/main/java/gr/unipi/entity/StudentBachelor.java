package gr.unipi.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import java.sql.Date;

@Entity
@Table(name = "student_bachelor")
public class StudentBachelor {
    @Id
    @Size(max = 6)
    @Column(name = "Student_code", nullable = false, length = 6)
    private String id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "Student_ID", nullable = false)
    private Student student;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "Department_ID", nullable = false)
    private Department department;

    @NotNull
    @Column(name = "Registration", nullable = false)
    private Date registration;

    @Column(name = "Graduation")
    private Date graduation;

    @Column(name = "Grade")
    private Float grade;

    public StudentBachelor() {
    }

    public StudentBachelor(String id, Student student, Department department, Date registration, Date graduation, Float grade) {
        this.id = id;
        this.student = student;
        this.department = department;
        this.registration = registration;
        this.graduation = graduation;
        this.grade = grade;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public Date getGraduation() {
        return graduation;
    }

    public void setGraduation(Date graduation) {
        this.graduation = graduation;
    }

    public Float getGrade() {
        return grade;
    }

    public void setGrade(Float grade) {
        this.grade = grade;
    }

}