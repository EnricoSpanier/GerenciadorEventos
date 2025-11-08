package com.gerenciador.eventos.Service;

import com.gerenciador.eventos.Object.Event;
import com.gerenciador.eventos.Repository.EventRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class EventService {
    @Autowired
    private EventRepository eventRepository;

    public Event createEvent(Event e) {
        if (e.getBuy_time_limit() == null) e.setBuy_time_limit(e.getEvent_date());
        if (eventRepository.existsByEventName(e.getEvent_name())) {
            throw new IllegalArgumentException("Nome de evento já existe");
        }
        return eventRepository.save(e);
    }

    public Event updateEvent(Event e) {
        return eventRepository.save(e);
    }

    public Event findById(Long id) {
        return eventRepository.findById(id).orElseThrow(() -> new RuntimeException("Evento não encontrado"));
    }

    public List<Event> searchEvents(String search, LocalDateTime date, String location, Boolean type) {
        return eventRepository.searchEvents(search, date, location, type);
    }

    public void delete(Long id) {
        eventRepository.deleteById(id);
    }
}
