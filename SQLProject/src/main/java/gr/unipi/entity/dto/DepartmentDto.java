package gr.unipi.entity.dto;

import gr.unipi.entity.Department;
import jakarta.annotation.Nullable;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

public class DepartmentDto{

    @Size(min = 1, message = "Department's name must has at least one character")
    @Size(max = 15, message = "Department's name cannot exceed 15 characters")
    @NotNull(message = "Department's name cannot be null")
    private String id;
    @Size(min = 1, message = "Department's name must has at least one character")
    @Size(max = 100, message = "Department's name cannot exceed 100 characters")
    @NotNull(message = "Department's name cannot be null")
    private String name;

    @Min(value = 1821, message = "Creation year must be after 1821")
    @NotNull(message = "Creation year cannot be null")
    private Integer creationYear;
    @Size(max = 100, message = "Department's website cannot exceed 100 characters")
    @Pattern(regexp = "^(((http|https):\\/\\/).*|^$)", message = "Website must start with 'https://' or 'http://'")
    @Nullable
    private String website;
    @Size(min = 1, message = "Department's code must be only one character")
    @Size(max = 1, message = "Department's code must be only one character")
    @NotNull
    private String code;

    public DepartmentDto() {
    }

    public Department toDepartment(){
        return new Department(id, name, creationYear, website, code);
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
}