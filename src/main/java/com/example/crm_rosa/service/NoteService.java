package com.example.crm_rosa.service;

import com.example.crm_rosa.controller.dto.NoteCreateDto;
import com.example.crm_rosa.repository.NoteRepository;
import com.example.crm_rosa.repository.ProspectRepository;
import com.example.crm_rosa.repository.entity.Note;
import com.example.crm_rosa.repository.entity.Prospect;
import org.hibernate.ObjectNotFoundException;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class NoteService {

    private NoteRepository noteRepository;
    private ProspectRepository prospectRepository;

    public NoteService(NoteRepository noteRepository, ProspectRepository prospectRepository) {
        this.noteRepository = noteRepository;
        this.prospectRepository = prospectRepository;
    }

    public List<Note> getAllNotesOfProspect(long idProspect){  //need to add the idUser? maybe not, actually.
        return this.noteRepository.findAllByProspect_Id(idProspect);
    }

    public Note getNoteById(long idNote){
        return this.noteRepository.findById(idNote).orElseThrow(() -> new ObjectNotFoundException(idNote, "Note"));
    }

    public void addNote(NoteCreateDto noteCreateDto, long idProspect){
        Note note = new Note();
        Prospect prospect = this.prospectRepository.findById(idProspect).orElseThrow(() -> new ObjectNotFoundException(idProspect, "Prospect"));
        note.setProspect(prospect);
        note.setTitle(noteCreateDto.getTitle());
        note.setContent(noteCreateDto.getContent());
        note.setCreatedAt(LocalDate.now());
        prospect.addNote(note);

        this.noteRepository.save(note);
    }

    public void editNote(NoteCreateDto noteCreateDto, long idNote, long idProspect){
        Note note = this.noteRepository.findById(idNote).orElseThrow(() -> new ObjectNotFoundException(idNote, "Note"));
        Prospect prospect = this.prospectRepository.findById(idProspect).orElseThrow(() -> new ObjectNotFoundException(idProspect, "Prospect"));
        note.setTitle(noteCreateDto.getTitle());
        note.setContent(noteCreateDto.getContent());

        this.noteRepository.save(note);
    }

    public void deleteNoteById(long id){
        Note note = this.getNoteById(id);
        note.getProspect().removeNote(note);
        this.noteRepository.deleteById(id);
    }
}
