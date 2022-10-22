package com.example.crm_rosa.repository;

import com.example.crm_rosa.repository.entity.Note;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NoteRepository extends CrudRepository<Note, Long> {

    List<Note> findAllByProspect_Id(long idProspect);
}
