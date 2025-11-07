package com.gerenciador.eventos.Repository;

import com.gerenciador.eventos.Object.Registration;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RegistrationRepository extends JpaRepository<Registration, Long> {
    List<Registration> findByUserId(Long userId);
    boolean existsByUserIdAndEventId(Long userId, Long eventId);
}
