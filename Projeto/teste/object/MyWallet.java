package com.gerenciador.eventos.Object;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;
import java.time.LocalDateTime;

@Entity
@Table(name = "mywallet")
@Data
public class MyWallet {
    @Id
    private Long user_id;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
