package gr.unipi.entity;

import jakarta.persistence.*;
import java.math.BigInteger;
import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "msc")
public class Msc {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", nullable = false)
    private BigInteger id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "Department_ID", nullable = false)
    private Department department;

    @Column(name = "Title", nullable = false, length = 100)
    private String title;

    @Column(name = "Creation", nullable = false)
    private Date creation;

    @Column(name = "Months_duration", nullable = false)
    private Integer monthsDuration;

    @Column(name = "Cost", nullable = false)
    private Float cost;

    @OneToMany(mappedBy = "msc")
    private Set<StudentMsc> studentMscs = new LinkedHashSet<>();

    public Msc() {
    }

    public Msc(BigInteger id, Department department, String title, Date creation, Integer monthsDuration, Float cost) {
        this.id = id;
        this.department = department;
        this.title = title;
        this.creation = creation;
        this.monthsDuration = monthsDuration;
        this.cost = cost;
    }

    public BigInteger getId() {
        return id;
    }

    public void setId(BigInteger id) {
        this.id = id;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getCreation() {
        return creation;
    }

    public void setCreation(Date creation) {
        this.creation = creation;
    }

    public Integer getMonthsDuration() {
        return monthsDuration;
    }

    public void setMonthsDuration(Integer monthsDuration) {
        this.monthsDuration = monthsDuration;
    }

    public Float getCost() {
        return cost;
    }

    public void setCost(Float cost) {
        this.cost = cost;
    }

    public Set<StudentMsc> getStudentMscs() {
        return studentMscs;
    }

    public void setStudentMscs(Set<StudentMsc> studentMscs) {
        this.studentMscs = studentMscs;
    }

}