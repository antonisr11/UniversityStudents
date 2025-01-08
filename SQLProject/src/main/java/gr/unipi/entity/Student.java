package gr.unipi.entity;

import jakarta.persistence.*;
import java.math.BigInteger;
import java.sql.Date;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "student")
public class Student {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", nullable = false)
    private BigInteger id;

    @Column(name = "First_name", nullable = false, length = 50)
    private String firstName;

    @Column(name = "Last_name", nullable = false, length = 50)
    private String lastName;

    @Column(name = "Father_name", length = 50)
    private String fatherName;

    @Column(name = "Email", nullable = false, length = 100)
    private String email;

    @Column(name = "Birth", nullable = false)
    private Date birth;

    @Lob
    @Column(name = "Marital_status", nullable = false)
    private String maritalStatus;

    @Column(name = "Phone", nullable = false, length = 10)
    private String phone;

    @OneToMany(mappedBy = "student")
    private Set<StudentBachelor> studentBachelors = new LinkedHashSet<>();

    @OneToMany(mappedBy = "student")
    private Set<StudentMsc> studentMscs = new LinkedHashSet<>();

    @OneToMany(mappedBy = "student")
    private Set<StudentPhd> studentPhds = new LinkedHashSet<>();

    @OneToMany(mappedBy = "student")
    private Set<Job> jobs = new LinkedHashSet<>();

    public Student() {
    }

    public Student(BigInteger id, String firstName, String lastName, String fatherName, String email, Date birth, String maritalStatus, String phone) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.fatherName = fatherName;
        this.email = email;
        this.birth = birth;
        this.maritalStatus = maritalStatus;
        this.phone = phone;
    }

    public Student(BigInteger id, String firstName, String lastName, String fatherName, String email, Date birth, String maritalStatus, String phone, Set<StudentBachelor> studentBachelors, Set<StudentMsc> studentMscs, Set<StudentPhd> studentPhds, Set<Job> jobs) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.fatherName = fatherName;
        this.email = email;
        this.birth = birth;
        this.maritalStatus = maritalStatus;
        this.phone = phone;
        this.studentBachelors = studentBachelors;
        this.studentMscs = studentMscs;
        this.studentPhds = studentPhds;
        this.jobs = jobs;
    }

    public BigInteger getId() {
        return id;
    }

    public void setId(BigInteger id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFatherName() {
        return fatherName;
    }

    public void setFatherName(String fatherName) {
        this.fatherName = fatherName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getBirth() {
        return birth;
    }

    public int getBirthYear() {
        return birth.toLocalDate().getYear();
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public String getMaritalStatus() {
        return maritalStatus;
    }

    public void setMaritalStatus(String maritalStatus) {
        this.maritalStatus = maritalStatus;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public List<StudentMsc> getStudentMscs() {
        return new ArrayList<>(studentMscs);
    }

    public void setStudentMscs(Set<StudentMsc> studentMscs) {
        this.studentMscs = studentMscs;
    }

    public List<StudentPhd> getStudentPhds() {
        return new ArrayList<>(studentPhds);
    }

    public void setStudentPhds(Set<StudentPhd> studentPhds) {
        this.studentPhds = studentPhds;
    }

    public List<Job> getJobs() {
        return new ArrayList<>(jobs);
    }

    public void setJobs(Set<Job> jobs) {
        this.jobs = jobs;
    }

    public List<StudentBachelor> getStudentBachelors() {
        return new ArrayList<>(studentBachelors);
    }

    public void setStudentBachelors(Set<StudentBachelor> studentBachelors) {
        this.studentBachelors = studentBachelors;
    }

}