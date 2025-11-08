package com.gerenciador.eventos.Controller;

import com.gerenciador.eventos.Object.Registration;
import com.gerenciador.eventos.Service.RegistrationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/registrations")
public class RegistrationController {
    @Autowired
    private RegistrationService registrationService;

    @PostMapping
    public ResponseEntity<Registration> register(@RequestBody Registration reg) {
        return ResponseEntity.ok(registrationService.register(reg));
    }

    @GetMapping("/me")
    public ResponseEntity<List<Registration>> getMyRegistrations() {
        // User ID from JWT
        return ResponseEntity.ok(registrationService.getByUser(1L)); // Substitua
    }
}
