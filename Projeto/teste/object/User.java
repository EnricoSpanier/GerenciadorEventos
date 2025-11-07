package com.gerenciador.eventos.Object;

import jakarta.persistence.*;
import lombok.Data;
import java.time.LocalDateTime;

@Entity
@Table(name = "users")
@Data
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "user_name")
    private String name;
    private String email;
    private String fone;
    private String password;
    @Column(name = "birthdate")
    private String birthDate;
    private Boolean admin;
    @Column(name = "isactive")
    private Boolean isActive;
    @Column(name = "created_at")
    private LocalDateTime createdAt;
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    // Construtores e toString mantidos, mas use Lombok @Data para getters/setters
}
