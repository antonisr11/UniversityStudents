package gr.unipi.repository;

import gr.unipi.entity.Msc;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.math.BigInteger;
import java.util.List;

@Repository
public interface MscRepository extends JpaRepository<Msc, BigInteger> {
    @Query(value="CALL getFreeMscs()", nativeQuery = true)
    List<Msc> getFreeMscs();

    @Query(value="CALL getCostPerMonthMscs()", nativeQuery = true)
    List<Msc> getCostPerMonthMscs();
}