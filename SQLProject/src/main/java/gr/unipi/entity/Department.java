package gr.unipi.entity;

import jakarta.persistence.*;

import java.util.*;

@Entity
@Table(name = "department")
public class Department {
    @Id
    @Column(name = "ID", nullable = false, length = 15)
    private String id;

    @Column(name = "Name", nullable = false, length = 100)
    private String name;

    @Column(name = "Creation_year", nullable = false)
    private Integer creationYear;

    @Column(name = "Website", length = 100)
    private String website;

    @Column(name = "Code", nullable = false, length = 1)
    private String code;

    @OneToMany(mappedBy = "department")
    private Set<StudentPhd> studentPhds = new LinkedHashSet<>();

    @OneToMany(mappedBy = "department")
    private Set<StudentBachelor> studentBachelors = new LinkedHashSet<>();

    @OneToMany(mappedBy = "department")
    private Set<Msc> mscs = new LinkedHashSet<>();
    
    public Department() {
    }

    public Department(String id, String name, Integer creationYear, String website, String code) {
        this.id = id;
        this.name = name;
        this.creationYear = creationYear;
        this.website = website;
        this.code = code;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getCreationYear() {
        return creationYear;
    }

    public void setCreationYear(Integer creationYear) {
        this.creationYear = creationYear;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Set<StudentPhd> getStudentPhds() {
        return studentPhds;
    }

    public void setStudentPhds(Set<StudentPhd> studentPhds) {
        this.studentPhds = studentPhds;
    }

    public Set<StudentBachelor> getStudentBachelors() {
        return studentBachelors;
    }

    public void setStudentBachelors(Set<StudentBachelor> studentBachelors) {
        this.studentBachelors = studentBachelors;
    }

    public Set<Msc> getMscs() {
        return mscs;
    }

    public void setMscs(Set<Msc> mscs) {
        this.mscs = mscs;
    }

}