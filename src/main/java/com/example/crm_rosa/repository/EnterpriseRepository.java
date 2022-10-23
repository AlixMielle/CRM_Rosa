package com.example.crm_rosa.repository;

import com.example.crm_rosa.repository.entity.Enterprise;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EnterpriseRepository extends CrudRepository<Enterprise, Long> {
    @Query("SELECT e FROM Enterprise e WHERE e.name LIKE %:keyword%")
    List<Enterprise> searchByName(@Param("keyword")String keyword);

    @Query("SELECT e FROM Enterprise e ORDER BY e.name ASC")
    List<Enterprise> sortByAlphabeticalOrder();

    @Query("SELECT e FROM Enterprise e ORDER BY e.name DESC")
    List<Enterprise> resortByAlphabeticalOrder();
}
