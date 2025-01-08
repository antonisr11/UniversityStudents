package gr.unipi.repository;

import gr.unipi.entity.Job;
import org.springframework.data.jpa.repository.JpaRepository;

import java.math.BigInteger;

public interface JobRepository extends JpaRepository<Job, BigInteger> {
}