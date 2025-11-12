package org.afpa.cda.tunisformationserver.repository;

import org.afpa.cda.tunisformationserver.model.Lesson;
import org.springframework.data.repository.ListCrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LessonRepository extends ListCrudRepository<Lesson, Long> {
}
