package gr.unipi.entity;

import jakarta.persistence.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import java.math.BigInteger;
import java.sql.Date;

@Entity
@Table(name = "jobs")
public class Job {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", nullable = false)
    private BigInteger id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "Student_ID", nullable = false)
    private Student student;

    @Column(name = "Company_name", nullable = false, length = 100)
    private String companyName;

    @Column(name = "Title", nullable = false, length = 100)
    private String title;

    @Column(name = "Weekly_hours", nullable = false)
    private Integer weeklyHours;

    @Column(name = "Leave_reason", length = 1000)
    private String leaveReason;

    @Column(name = "Start", nullable = false)
    private Date start;

    @Column(name = "End")
    private Date end;

    public Job() {
    }

    public Job(BigInteger id, Student student, String companyName, String title, Integer weeklyHours, String leaveReason, Date start, Date end) {
        this.id = id;
        this.student = student;
        this.companyName = companyName;
        this.title = title;
        this.weeklyHours = weeklyHours;
        this.leaveReason = leaveReason;
        this.start = start;
        this.end = end;
    }

    public BigInteger getId() {
        return id;
    }

    public void setId(BigInteger id) {
        this.id = id;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getWeeklyHours() {
        return weeklyHours;
    }

    public void setWeeklyHours(Integer weeklyHours) {
        this.weeklyHours = weeklyHours;
    }

    public String getLeaveReason() {
        return leaveReason;
    }

    public void setLeaveReason(String leaveReason) {
        this.leaveReason = leaveReason;
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
        this.end = end;
    }

}