package com.gerenciador.eventos.Controller;

import com.gerenciador.eventos.Object.Event;
import com.gerenciador.eventos.Service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/api/events")
public class EventController {

    @Autowired
    private EventService eventService;

    @Autowired
    private CloudinaryService cloudinaryService; // Novo service para upload, veja abaixo

    @PostMapping
    public ResponseEntity<Event> createEvent(@RequestPart Event event, @RequestPart(required = false) MultipartFile image) {
        if (image != null) {
            String url = cloudinaryService.upload(image);
            event.setImageUrl(url);
        }
        return ResponseEntity.status(HttpStatus.CREATED).body(eventService.createEvent(event));
    }

    @GetMapping
    public ResponseEntity<List<Event>> search(@RequestParam(required = false) String search,
                                              @RequestParam(required = false) LocalDateTime date,
                                              @RequestParam(required = false) String location,
                                              @RequestParam(required = false) Boolean type) {
        return ResponseEntity.ok(eventService.searchEvents(search, date, location, type));
    }

    @GetMapping("/featured")
    public ResponseEntity<List<Event>> getFeatured() {
        // Lógica para destaque, ex: últimos 5
        return ResponseEntity.ok(eventService.searchEvents(null, null, null, null).subList(0, 5));
    }

    // Outros métodos...
}
