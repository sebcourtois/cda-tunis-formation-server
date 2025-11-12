package org.afpa.cda.tunisformationserver.controller;

import org.afpa.cda.tunisformationserver.model.Lesson;
import org.afpa.cda.tunisformationserver.repository.LessonRepository;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class LessonsController {

    private final LessonRepository repository;

    public LessonsController(LessonRepository repository) {
        this.repository = repository;
    }

    @CrossOrigin
    @GetMapping("/lessons")
    List<Lesson> all() {
        return this.repository.findAll();
    }
}
