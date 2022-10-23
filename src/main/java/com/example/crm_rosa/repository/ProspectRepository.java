package com.example.crm_rosa.repository;

import com.example.crm_rosa.repository.entity.Prospect;
import com.example.crm_rosa.repository.entity.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ProspectRepository extends CrudRepository<Prospect, Long> {

    //TODO: change the long into a User and the name of the function appropriately
    List<Prospect> findProspectByUser(User user);

    List<Prospect> findProspectByEnterprise_Id(long enterpriseId);

    List<Prospect> findProspectByEnterprise_IdAndUser(long enterpriseId, User user);

    @Query("SELECT p FROM Prospect p WHERE (p.firstName LIKE %:search% OR p.lastName LIKE %:search%) AND p.prospectionStatus <> 'CLIENT' AND p.user.id = :id") //<> is SQL for !=
    List<Prospect> findProspectsBySearch(@Param("search") String search, @Param("id") long id);

    //CLIENT STUFF
    @Query("SELECT p FROM Prospect p WHERE p.prospectionStatus='CLIENT'")
    List<Prospect> findAllClients();

    @Query("SELECT p FROM Prospect p WHERE p.prospectionStatus='CLIENT' AND p.id = :id")
    Optional<Prospect> findClientById(@Param("id") long id);

    @Query("SELECT p FROM Prospect p WHERE p.enterprise.id = :id AND p.prospectionStatus = 'CLIENT'")
    List<Prospect> findClientsByEnterprise(@Param("id") long id);

    @Query("SELECT p FROM Prospect p WHERE p.enterprise.id = :idEnterprise AND p.user.id = :idUser AND p.prospectionStatus = 'CLIENT'")
    List<Prospect> findClientsByEnterpriseAndUser(@Param("idEnterprise") long idEnterprise, @Param("idUser") long idUser);

    @Query("SELECT p FROM Prospect p WHERE (p.firstName LIKE %:search% OR p.lastName LIKE %:search%) AND p.prospectionStatus = 'CLIENT' AND p.user.id = :id")
    List<Prospect> findClientBySearch(@Param("search") String search, @Param("id") long id);
}
