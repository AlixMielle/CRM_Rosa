package com.example.crm_rosa.controller;

import com.example.crm_rosa.controller.dto.EventCreateDto;
import com.example.crm_rosa.controller.dto.NoteCreateDto;
import com.example.crm_rosa.repository.entity.Event;
import com.example.crm_rosa.repository.entity.Note;
import com.example.crm_rosa.service.CalendarService;
import com.example.crm_rosa.service.NoteService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Optional;

@Controller
@RequestMapping("/events")
public class CalendarController {


    private CalendarService calendarService;

    public CalendarController(CalendarService calendarService) {
        this.calendarService = calendarService;
    }



    @GetMapping("/{idProspect}")
    public String displayEventsofProspect(@PathVariable("idProspect") long idProspect, Model model){
        model.addAttribute("events", this.calendarService.getAllEventsOfProspect(idProspect));
        model.addAttribute("idProspect", idProspect);
        return "eventsAllView";
    }

    @GetMapping("/{idProspect}/{idEvent}")
    public String displayEvent(@PathVariable("idEvent") long idProspect, @PathVariable("idEvent") long idEvent, Model model){
        model.addAttribute("event", this.calendarService.getEventById(idEvent));
        return "noteDetailsView";
    }

    @GetMapping("/add/{idProspect}")
    public String displayAddEventForm(@PathVariable("idProspect") long idProspect, Model model){
        model.addAttribute("idProspect", idProspect);
        return "addEventForm.jsp";
    }

    @PostMapping("/add")
    public String addEvent(EventCreateDto eventCreateDto, long idProspect){
        this.calendarService.addEvent(eventCreateDto, idProspect);
        return "redirect:/events/" + idProspect;
    }

    @GetMapping("/edit/{id}")
    public String displayEditEventForm(@PathVariable("id") long id, Model model){
        Event event =  this.calendarService.getEventById(id);
        model.addAttribute("event",event);
        model.addAttribute("idProspect", event.getProspect().getId());
        return "addEventForm.jsp";
    }

    @PostMapping("/edit")
    public String editEvent(EventCreateDto eventCreateDto, long idEvent, long idProspect){
        this.calendarService.editEvent(eventCreateDto, idEvent);
        return "redirect:/events/" + idProspect;
    }

    @GetMapping("/delete/{id}")
    public String deleteEventConfirm(@PathVariable("id") long id, Model model){
        model.addAttribute("event", calendarService.getEventById(id));
        model.addAttribute("deletedForm", true);
        return "eventDetailsView";
    }

    @PostMapping("/delete/{id}")
    public String deleteEvent(@PathVariable("id") long id){
        calendarService.deleteEventById(id);
        return "redirect:/events";
    }

}
