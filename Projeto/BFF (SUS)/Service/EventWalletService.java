package com.gerenciador.eventos.Service;

import com.gerenciador.eventos.Object.Registration;
import com.gerenciador.eventos.Repository.RegistrationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RegistrationService {
    @Autowired
    private RegistrationRepository registrationRepository;

    public Registration register(Registration reg) {
        if (registrationRepository.existsByUserIdAndEventId(reg.getUser_id(), reg.getEvent_id())) {
            throw new IllegalArgumentException("Já inscrito");
        }
        return registrationRepository.save(reg);
    }

    public List<Registration> getByUser(Long userId) {
        return registrationRepository.findByUserId(userId);
    }

    public void unregister(Long userId, Long eventId) {
        // Implementar delete se necessário
    }
}
