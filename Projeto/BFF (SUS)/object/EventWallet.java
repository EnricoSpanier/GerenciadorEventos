package com.gerenciador.eventos.Object;

import jakarta.persistence.*;
import lombok.Data;
import java.time.LocalDateTime;

@Entity
@Table(name = "walletevent")
@Data
public class Registration {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Long user_id;
    private Long event_id;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
