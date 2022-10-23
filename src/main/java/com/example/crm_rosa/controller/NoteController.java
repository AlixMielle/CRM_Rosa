package com.example.crm_rosa.controller;

import com.example.crm_rosa.controller.dto.NoteCreateDto;
import com.example.crm_rosa.repository.entity.Note;
import com.example.crm_rosa.repository.entity.Prospect;
import com.example.crm_rosa.service.NoteService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.websocket.server.PathParam;

@Controller
@RequestMapping("/notes")
public class NoteController {

    private NoteService noteService;

    public NoteController(NoteService noteService) {
        this.noteService = noteService;
    }

    @GetMapping("/{idProspect}")
    public String displayNotesOfProspect(@PathVariable("idProspect") long idProspect, Model model){
        model.addAttribute("notes", this.noteService.getAllNotesOfProspect(idProspect));
        model.addAttribute("idProspect", idProspect);
        return "notesAllView";
    }

    @GetMapping("/{idProspect}/{idNote}")
    public String displayNote(@PathVariable("idProspect") long idProspect, @PathVariable("idNote") long idNote, Model model){
        model.addAttribute("note", this.noteService.getNoteById(idNote));
        return "noteDetailsView";
    }

    @GetMapping("/add/{idProspect}")
    public String displayAddNoteForm(@PathVariable("idProspect") long idProspect, Model model){
        model.addAttribute("idProspect", idProspect);
        return "addNoteForm";
    }

    @PostMapping("/add")
    public String addNote(NoteCreateDto noteCreateDto, long idProspect){
        this.noteService.addNote(noteCreateDto, idProspect);
        return "redirect:/notes/" + idProspect;
    }

    @GetMapping("/edit/{id}")
    public String displayEditNoteForm(@PathVariable("id") long id, Model model){
        Note note =  this.noteService.getNoteById(id);
        model.addAttribute("note",note);
        model.addAttribute("idProspect", note.getProspect().getId());
        return "addNoteForm";
    }

    @PostMapping("/edit")
    public String editNote(NoteCreateDto noteCreateDto, long idNote, long idProspect){
        this.noteService.editNote(noteCreateDto, idNote);
        return "redirect:/notes/" + idProspect;
    }

    @GetMapping("/delete/{id}")
    public String deleteNoteConfirm(@PathVariable("id") long id, Model model){
        model.addAttribute("note", noteService.getNoteById(id));
        model.addAttribute("isDeleteForm", true);
        return "noteDetailsView";
    }

    @PostMapping("/delete/{id}")
    public String deleteProspect(@PathVariable("id") long id){
        noteService.deleteNoteById(id);
        return "redirect:/prospects/all";
    }
}
