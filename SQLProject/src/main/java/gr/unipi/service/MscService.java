package gr.unipi.service;

import gr.unipi.entity.Msc;
import gr.unipi.repository.MscRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.math.BigInteger;
import java.util.List;

@Service
public class MscService {

    private final MscRepository mscRepository;

    @Autowired
    public MscService(MscRepository mscRepository) {
        this.mscRepository = mscRepository;
    }

    public List<Msc> getAllMsc(){
        return mscRepository.findAll();
    }

    public Msc getMscById(BigInteger id){
        return mscRepository.getReferenceById(id);
    }

    public Msc saveMsc(Msc msc){
        return mscRepository.save(msc);
    }

    public void deleteMscByID(BigInteger id){
        mscRepository.deleteById(id);
    }

    public List<Msc> getFreeMscs() {
        return mscRepository.getFreeMscs();
    }

    public List<Msc> getCostPerMonthMscs() {
        return mscRepository.getCostPerMonthMscs();
    }
}
