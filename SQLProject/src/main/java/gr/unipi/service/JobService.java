package gr.unipi.service;

import gr.unipi.entity.Job;
import gr.unipi.repository.JobRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.math.BigInteger;
import java.util.List;

@Service
public class JobService {

    private final JobRepository jobRepository;

    @Autowired
    public JobService(JobRepository jobRepository) {
        this.jobRepository = jobRepository;
    }

    public List<Job> getAllJobs(){
        return jobRepository.findAll();
    }

    public Job getJobById(BigInteger ID){
        return jobRepository.getReferenceById(ID);
    }
    public void deleteJobById(BigInteger ID) {
        jobRepository.deleteById(ID);
    }
    public void saveJob(Job job){
        jobRepository.saveAndFlush(job);
    }

}
