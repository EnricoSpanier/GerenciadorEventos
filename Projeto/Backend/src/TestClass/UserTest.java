//Pakages declararion



// import 
import java.time.LocalDate;
import java.time.LocalDateTime;

public class User {

    // Atributos básicos (POJO simples)
    private Long id;              // fazer ser preenchido automaticamente
    private String name;
    private String email;
    private String fone;
    private String password;      // Senha sem cryptografia
    private LocalDate birthDate;
    private LocalDateTime createdAt;

    //Construtor vazio
    public User() { 
        this.id = null;
        this.name = "";
        this.email = "";
        this.fone = "";
        this.password = "";
        this.birthDate = null;
        this.createdAt = null;
    }

    // Construtor completo
    public User(Long id, String name, String email, String fone, String password, LocalDate birthDate) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.fone = fone;
        this.password = password;
        this.birthDate = birthDate;
        this.createdAt = LocalDateTime.now();
    }

    // Getters
    public Long getId() { 
        return id; 
    }

    public String getName() { 
        return name; 
    }

    public String getEmail() { 
        return email; 
    }

    public String getFone() { 
        return fone; 
    }

    public String getPassword() { 
        return password; 
    }

    public LocalDate getBirthDate() { 
        return birthDate; 
    }

    public LocalDateTime getCreatedAt() { 
        return createdAt; 
    }

    // Setters
    public void setId(Long id) {
        this.id = id; 
    }

    public void setName(String name) { 
        this.name = name; 
    }

    public void setEmail(String email) {
        this.email = email;  
    }

    public void setFone(String fone) { 
        this.fone = fone;
    }

    public void setPassword(String password) { 
        this.password = password; 
    }

    public void setBirthDate(LocalDate birthDate) { 
        this.birthDate = birthDate; 
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                '}';
    }
}
