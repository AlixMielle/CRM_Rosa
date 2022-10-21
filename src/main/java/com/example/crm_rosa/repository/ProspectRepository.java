package com.example.crm_rosa.repository;

import com.example.crm_rosa.repository.entity.Prospect;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProspectRepository extends CrudRepository<Prospect, Long> {

    //TODO: change the long into a User and the name of the function appropriately
    List<Prospect> findProspectByUser(long idOfUser);
}
