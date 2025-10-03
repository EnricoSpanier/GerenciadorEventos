package com.gerenciador.eventos;

//imports
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDateTime;

public class Event {
    // Atributos básicos (POJO simples)
    private Long event_id;              // fazer ser preenchido automaticamente
    private Long creator_id;              // fazer ser preenchido automaticamente
    private String event_name;
    private Boolean is_EAD;
    private String address;
    private LocalDateTime event_date;
    private LocalDateTime buy_time_limit;
    private int lot_quantity;
    private int quantity;
  //private double price;
    private String description;
    private List<String> presenters;  //apresentadores
    private LocalDateTime createdAt;


    //constructor vazio
    public Event() { 
        this.event_id = null;
        this.creator_id = null;
        this.event_name = "";
        this.is_EAD = null;
        this.address = "";
        this.event_date = null;
        this.buy_time_limit = null;
        this.lot_quantity = 0;
        this.lot_quantity = 0;
        this.quantity = 0;
        //this.price = 0.0;
        this.description = "";
        this.presenters = new ArrayList<>();
        this.createdAt = null;
    }

    // Construtor completo
    public Event(Long event_id, Long creator_id, String event_name, Boolean is_EAD, String address, LocalDateTime event_date, LocalDateTime buy_time_limit, int lot_quantity, int quantity, String description, List<String> presenters) {
        this.event_id = event_id;
        this.creator_id = creator_id;
        this.event_name = event_name;
        this.is_EAD = is_EAD;
        this.address = address;
        this.event_date = event_date;
        this.buy_time_limit = buy_time_limit;
        this.lot_quantity = lot_quantity;
        this.quantity = quantity;
       // this.price = price;
        this.description = description;
        this.presenters = presenters;
        this.createdAt = LocalDateTime.now();
    }

    // Getters
    public Long getEvent_id() { 
        return event_id; 
    }

    public Long getCreator_id() { 
        return creator_id; 
    }

    public String getEvent_name() { 
        return event_name; 
    }

    public Boolean getIs_EAD() { 
        return is_EAD; 
    }

    public String getAddress() { 
        return address; 
    }

    public LocalDateTime getEvent_date() { 
        return event_date; 
    }

    public LocalDateTime getBuy_time_limit() { 
        return buy_time_limit; 
    }

    public Integer getLot_quantity() { 
        return lot_quantity; 
    }

    public Integer getQuantity() { 
        return quantity; 
    }

    public String getDescription() { 
        return description; 
    }

    public List<String> getPresenters() { 
        return presenters; 
    }

    public LocalDateTime getCreatedAt() { 
        return createdAt; 
    }

    // Setters
    public void setEvent_id(Long event_id) {
        this.event_id = event_id; 
    }
    public void setCreator_id(Long creator_id) { 
        this.creator_id = creator_id; 
    }
    public void setEvent_name(String event_name) { 
        this.event_name = event_name; 
    }
    public void setIs_EAD(Boolean is_EAD) { 
        this.is_EAD = is_EAD; 
    }
    public void setAddress(String address) { 
        this.address = address; 
    }
    public void setEvent_date(LocalDateTime event_date) { 
        this.event_date = event_date; 
    }
    public void setBuy_time_limit(LocalDateTime buy_time_limit) { 
        this.buy_time_limit = buy_time_limit; 
    }
    public void setLot_quantity(int lot_quantity) { 
        this.lot_quantity = lot_quantity; 
    }
    public void setQuantity(int quantity) { 
        this.quantity = quantity; 
    }
    public void setDescription(String description) { 
        this.description = description; 
    }
    public void setPresenters(List<String> presenters) { 
        this.presenters = presenters; 
    }
    public void setCreatedAt(LocalDateTime createdAt) { 
        this.createdAt = createdAt; 
    }
    //public void setPrice(double price) { 
      //  this.price = price;
    //}
    // Outros métodos, se necessário

    @Override
    public String toString() {
        return "Event{" +
                "event_id=" + event_id +
                ", creator_id=" + creator_id +
                ", event_name='" + event_name + '\'' +
                ", is_EAD=" + is_EAD +
                ", address='" + address + '\'' +
                ", event_date=" + event_date +
                ", buy_time_limit=" + buy_time_limit +
                ", lot_quantity=" + lot_quantity +
                ", quantity=" + quantity +
                ", description='" + description + '\'' +
                ", presenters=" + presenters +
                ", createdAt=" + createdAt +
                '}';
    }
}