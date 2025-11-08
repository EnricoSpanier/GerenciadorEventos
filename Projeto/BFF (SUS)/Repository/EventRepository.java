package com.gerenciador.eventos.Repository;

import com.gerenciador.eventos.Object.Event;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EventRepository extends JpaRepository<Event, Long> {
    Event findByEventName(String name);
    boolean existsByEventName(String name);

    @Query("SELECT e FROM Event e WHERE (:search IS NULL OR e.event_name LIKE %:search%) " +
           "AND (:date IS NULL OR e.event_date = :date) " +
           "AND (:location IS NULL OR e.address LIKE %:location%) " +
           "AND (:type IS NULL OR e.ead = :type)")
    List<Event> searchEvents(String search, LocalDateTime date, String location, Boolean type);
}
