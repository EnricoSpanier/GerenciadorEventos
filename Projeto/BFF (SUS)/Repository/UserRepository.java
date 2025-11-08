package com.gerenciador.eventos.Repository;

import com.gerenciador.eventos.Object.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);
    boolean existsByEmail(String email);
    boolean existsByName(String name);
    boolean existsByFone(String fone);
}
