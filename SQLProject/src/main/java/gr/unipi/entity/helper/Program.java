package gr.unipi.entity.helper;

import java.math.BigInteger;
import java.sql.Date;

public class Program {

    private final BigInteger studentId;
    private final String lastName;
    private final String departmentId;
    private final String type;
    private final Date registrationDate;
    private final String studentCode;
    private final Boolean hasFinished;

    public Program(BigInteger studentId, String lastName,String departmentId, String type, Date registrationDate, String studentCode, Boolean hasFinished) {
        this.studentId = studentId;
        this.lastName = lastName;
        this.departmentId = departmentId;
        this.type = type;
        this.registrationDate = registrationDate;
        this.studentCode = studentCode;
        this.hasFinished = hasFinished;
    }

    public String getId() {
        return getStudentCode();
    }

    public BigInteger getStudentId() {
        return studentId;
    }

    public String getDepartmentId() {
        return departmentId;
    }

    public String getType() {
        return type;
    }

    public Date getRegistrationDate() {
        return registrationDate;
    }

    public String getStudentCode() {
        return studentCode;
    }

    public Boolean getHasFinished() {
        return hasFinished;
    }

    public String getLastName() {
        return lastName;
    }
}
