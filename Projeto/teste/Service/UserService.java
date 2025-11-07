package com.gerenciador.eventos.Service;

import com.gerenciador.eventos.Object.User;
import com.gerenciador.eventos.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

    public User createUser(User user) {
        if (userRepository.existsByEmail(user.getEmail())) {
            throw new IllegalArgumentException("Email já existe");
        }
        user.setPassword(encoder.encode(user.getPassword()));
        user.setIsActive(true);
        return userRepository.save(user);
    }

    public User findById(Long id) {
        return userRepository.findById(id).orElseThrow(() -> new RuntimeException("Usuário não encontrado"));
    }

    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public User updateUser(User user) {
        User existing = findById(user.getId());
        existing.setName(user.getName());
        existing.setEmail(user.getEmail());
        // Atualize outros campos...
        return userRepository.save(existing);
    }

    public void deactivateUser(Long id) {
        User user = findById(id);
        user.setIsActive(false);
        userRepository.save(user);
    }

    // Validações removidas ou simplificadas com JPA
}
