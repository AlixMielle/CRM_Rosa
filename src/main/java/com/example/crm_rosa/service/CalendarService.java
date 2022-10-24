/*
package com.example.crm_rosa.service;

import com.example.crm_rosa.controller.dto.EventCreateDto;
import com.example.crm_rosa.repository.EventRepository;
import com.example.crm_rosa.repository.ProspectRepository;
import com.example.crm_rosa.repository.entity.Event;
import com.example.crm_rosa.repository.entity.Prospect;
import org.hibernate.ObjectNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CalendarService {

        private EventRepository eventRepository;
        private ProspectRepository prospectRepository;

    public CalendarService(EventRepository eventRepository, ProspectRepository prospectRepository) {
            this.eventRepository = eventRepository;
            this.prospectRepository = prospectRepository;
        }

        public List<Event> getAllEventsOfProspect(long idProspect) {
            return this.eventRepository.findAllByProspect_Id(idProspect);

    }

    public Event getEventById(long idEvent) {

        return this.eventRepository.findById(idEvent).orElseThrow(() -> new ObjectNotFoundException(idEvent, "Event"));
    }

    public void addEvent(EventCreateDto eventCreateDto, long idProspect) {
        Event event = new Event();
        Prospect prospect = this.prospectRepository.findById(idProspect).orElseThrow(() -> new ObjectNotFoundException(idProspect, "Prospect"));
        //event.setProspect(prospect);
        event.setStartingDate(eventCreateDto.getStartingDate());
        event.setEndingDate(eventCreateDto.getEndingDate());
        event.setTitre(eventCreateDto.getTitre());
        event.setDescription(eventCreateDto.getDescription());
        event.setAdresse(eventCreateDto.getAdresse());
        event.setTel(eventCreateDto.getTel());
    }

    public void editEvent(EventCreateDto eventCreateDto, Long idEvent) {
        Event event = this.eventRepository.findById(idEvent).orElseThrow(() -> new ObjectNotFoundException(idEvent, "Evènement"));
        event.setStartingDate(eventCreateDto.getStartingDate());
        event.setEndingDate(eventCreateDto.getEndingDate());
        event.setTitre(eventCreateDto.getTitre());
        event.setDescription(eventCreateDto.getDescription());
        event.setAdresse(eventCreateDto.getAdresse());
        event.setTel(eventCreateDto.getTel());

        this.eventRepository.save(event);
    }

    public void deleteEventById(long id) {
        Event event = this.getEventById(id);
       // event.getProspect().removeEvent(event);
        this.eventRepository.deleteById(id);
    }
}
*/
