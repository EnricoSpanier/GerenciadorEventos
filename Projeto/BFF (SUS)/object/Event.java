package com.gerenciador.eventos.Object;

import jakarta.persistence.*;
import lombok.Data;
import java.time.LocalDateTime;

@Entity
@Table(name = "event")
@Data
public class Event {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long event_id;
    private Long creator_id;
    private String event_name;
    private Boolean ead;
    private String address;
    private LocalDateTime event_date;
    private LocalDateTime buy_time_limit;
    private Integer capacity;
    private Integer quant;
    private String description;
    @Column(name = "image_url")
    private String imageUrl; // Novo para upload
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
