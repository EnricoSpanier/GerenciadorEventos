package com.gerenciador.eventos.Controller;

import com.gerenciador.eventos.Object.User;
import com.gerenciador.eventos.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.preauthorize.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/users")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/me")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<User> getCurrentUser() {
        // Obter do SecurityContext
        // Para exemplo, assumir ID do user logado
        return ResponseEntity.ok(userService.findById(1L)); // Substitua por logic de auth
    }

    @PutMapping("/me")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<User> updateProfile(@RequestBody User user) {
        return ResponseEntity.ok(userService.updateUser(user));
    }

    // Outros métodos simplificados ou removidos se não necessários para BFF
}
