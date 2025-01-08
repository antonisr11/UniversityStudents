package gr.unipi.entity.dto;

import gr.unipi.entity.Job;
import gr.unipi.entity.Student;
import jakarta.annotation.Nullable;
import jakarta.validation.constraints.*;
import java.math.BigInteger;
import java.sql.Date;

public class JobDto{
    @Nullable
    private BigInteger id;

    @NotNull(message = "Student must not be null")
    private Student student;

    @Size(min = 1, message = "Company's name must has at least one character")
    @Size(max = 100, message = "Company's name cannot exceed 50 characters")
    @NotNull(message = "Company's name must not be null")
    private String companyName;

    @Size(min = 1, message = "Job title must has at least one character")
    @Size(max = 100, message = "Job title cannot exceed 100 characters")
    @NotNull(message = "Job title must not be null")
    private String title;

    @Min(value = 1, message = "Weekly hours must be at least 1")
    @Max(value = 40, message = "Weekly hours must be at most 40")
    @NotNull(message = "Weekly hours must not be null")
    private Integer weeklyHours;

    @NotNull(message = "Start date must not be null")
    private Date start;

    @Nullable
    // This is String because it can be null, so request with end value '' is valid. If it was Date, then request with end value '' would be invalid
    private String end;

    @Size(max = 1500, message = "Leave reason reason cannot exceed 1500 characters")
    @Nullable
    private String leaveReason;

    public JobDto() {
    }

    public Job toJob() {
        return new Job(id, student, companyName, title, weeklyHours, leaveReason, start, end.equals("") ? null : Date.valueOf(end));
    }

    @Override
    public String toString() {
        return getClass().getSimpleName() + "(" +
                "ID = " + id + ", " +
                "student ID= " + student.getId() + ", " +
                "companyName = " + companyName + ", " +
                "title = " + title + ", " +
                "weeklyHours = " + weeklyHours + ", " +
                "leaveReason = " + leaveReason + ", " +
                "start = " + start + ")";
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

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }
}