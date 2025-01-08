package gr.unipi.entity.dto;

import gr.unipi.entity.Student;
import jakarta.annotation.Nullable;
import jakarta.validation.constraints.*;
import java.math.BigInteger;
import java.sql.Date;

public class StudentDto {
    @Nullable
    private BigInteger id;

    @Size(min = 1, message = "First name must has at least one character")
    @Size(max = 50, message = "First name cannot exceed 50 characters")
    @NotEmpty(message = "First name must not be empty")
    private String firstName;

    @Size(min = 1, message = "Last name must has at least one character")
    @Size(max = 50, message = "Last name cannot exceed 50 characters")
    @NotEmpty(message = "Last name must not be empty")
    private String lastName;

    @Size(max = 50, message = "Father name cannot exceed 50 characters")
    @Nullable
    private String fatherName;

    @Size(min = 1, message = "Email must has at least one character")
    @Size(max = 100, message = "Email cannot exceed 100 characters")
    @Email(message = "Wrong email format")
    @NotEmpty(message = "Email must not be empty")
    private String email;

    @PastOrPresent(message = "Birth must be in the past or present")
    @NotNull(message = "Birth must not be empty")
    private Date birth;

    @Pattern(regexp = "^(Unwed|Married|Divorced|Widower)$", message = "Marital Status must be one of the followings: 'Unwed' or 'Married' or 'Divorced' or 'Widower'")
    @NotEmpty(message = "Marital status must not be empty")
    private String maritalStatus;

    @Pattern(regexp = "^(2[0-9]{9}|69[0-9]{8})$", message = "Wrong phone format (number of digits must be 10 and starting with 2 or 69)")
    @NotEmpty(message = "Phone must not be empty")
    private String phone;

    public StudentDto() {
    }

    public Student toStudent() {
        return new Student(id, firstName, lastName, fatherName, email, birth, maritalStatus, phone);
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

    @Nullable
    public String getFatherName() {
        return fatherName;
    }

    public void setFatherName(@Nullable String fatherName) {
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
}