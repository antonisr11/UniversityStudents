package gr.unipi.entity.dto;

import gr.unipi.entity.Department;
import gr.unipi.entity.Msc;
import jakarta.annotation.Nullable;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import java.math.BigInteger;
import java.sql.Date;

public class MscDto {
    @Nullable
    private BigInteger id;
    @NotNull(message = "Department cannot be null")
    private Department department;
    @NotNull(message = "Title cannot be null")
    private String title;
    @NotNull(message = "Creation date cannot be null")
    private Date creation;
    @Min(value = 1, message = "Months must be greater than 0")
    @NotNull(message = "Duration cannot be null")
    private Integer monthsDuration;
    @Min(value = 0, message = "You believe they will pay you to take this MSc? Cost can not be negative..")
    @NotNull(message = "Cost cannot be null")
    private Float cost;

    public MscDto() {
    }

    public Msc toMsc() {
        return new Msc(id, department, title, creation, monthsDuration, cost);
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
}