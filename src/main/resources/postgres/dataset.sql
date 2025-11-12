TRUNCATE TABLE
    Lessons,
    Users,
    Categories
    RESTART IDENTITY
    CASCADE;

-- Insertion de 10 Utilisateurs (IDs 1 à 10)
INSERT INTO Users (email, password, first_name, last_name, birth_date, role)
VALUES
    ('prof.alice@example.com', 'pass1', 'Alice', 'Bernard', '1980-03-10', 'PROFESSOR'), -- ID 1
    ('prof.bob@example.com', 'pass2', 'Bob', 'Charles', '1982-07-25', 'PROFESSOR'),   -- ID 2
    ('prof.cathy@example.com', 'pass3', 'Cathy', 'Dubois', '1990-01-01', 'PROFESSOR'), -- ID 3
    ('prof.david@example.com', 'pass4', 'David', 'Garcia', '1975-12-12', 'PROFESSOR'), -- ID 4
    ('prof.eva@example.com', 'pass5', 'Eva', 'Fournier', '1988-06-05', 'PROFESSOR'),   -- ID 5
    ('stud.felix@example.com', 'pass6', 'Félix', 'Leroy', '2000-04-20', 'STUDENT'),   -- ID 6
    ('stud.gloria@example.com', 'pass7', 'Gloria', 'Moreau', '1999-08-14', 'STUDENT'), -- ID 7
    ('stud.hugo@example.com', 'pass8', 'Hugo', 'Petit', '2001-10-30', 'STUDENT'),     -- ID 8
    ('admin.irene@example.com', 'pass9', 'Irène', 'Roux', '1970-02-02', 'ADMIN'),     -- ID 9
    ('admin.paul@example.com', 'pass10', 'Paul', 'Simon', '1984-09-17', 'ADMIN');      -- ID 10


-- Insertion de 7 Catégories (IDs 1 à 7)
INSERT INTO Categories (name)
VALUES
    ('Programmation Web'),      -- ID 1
    ('Bases de Données'),       -- ID 2
    ('Design Graphique'),       -- ID 3
    ('Musique & Audio'),        -- ID 4
    ('Langues Étrangères'),     -- ID 5
    ('Marketing Digital'),      -- ID 6
    ('Développement Personnel'); -- ID 7

-- Insertion de 50 Leçons

INSERT INTO Lessons (name, price, online, user_id, category_id, image_url)
VALUES
-- Programmation Web (Category 1)
('HTML & CSS Avancé', 35.99, TRUE, 1, 1, 'https://static.alphorm.com/bgplayer/FR_695/FR_695_bg_player_large.png'),
('Introduction à JavaScript ES6+', 55.00, TRUE, 1, 1, 'https://d3f1iyfxxz8i1e.cloudfront.net/courses/course_image/c788b2abd849.png'),
('Développement Front-end avec React', 120.50, TRUE, 2, 1, 'https://www.eni-elearning.com/wp-content/uploads/2022/01/ET_DEV_REA-1.jpg'),
('Vue.js pour les débutants', 99.00, TRUE, 2, 1, 'https://www.gekkode.com/wp-content/uploads/2022/07/Tutoriel-VUEJS-3.png'),
('API REST avec Node.js & Express', 110.00, FALSE, 3, 1, 'https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/228043331/original/1c0d2ed865769a155b2525f7961a86a65d092ea0/develop-node-js-restful-api-with-express-and-mongodb.jpg'),
('Sécurité Web : Bonnes Pratiques', 70.00, TRUE, 3, 1, 'https://www.bastien-monnet.fr/files/pictures/les-bonnes-pratiques-en-securite-informatique_couverture.jpg'),
('Tests Unitaires en JavaScript', 65.00, TRUE, 4, 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0GlRqtv-WxZjDG2J12USNgJs3TNl8juZXPQ&s'),
('Optimisation de la performance Web', 85.00, TRUE, 5, 1, null),
('Création de sites statiques avec Hugo', 40.00, TRUE, 1, 1, null),
('Architecture Microservices', 150.00, TRUE, 2, 1, 'https://media.geeksforgeeks.org/wp-content/cdn-uploads/20210916202745/Microservice-Architecture-Introduction-Challeneges-Best-Practices.png'),

-- Bases de Données (Category 2)
('SQL pour l''analyse de données', 60.00, TRUE, 1, 2, null),
('Modélisation de Bases de Données', 75.00, TRUE, 3, 2, 'https://product-manager.eyrolles.com/media/products/7f65f87b-3934-4f24-ad34-0e9f44b009f4/image/modelisation-de-bases-de-donnees-690f1199'),
('Administration PostgreSQL Avancée', 130.00, TRUE, 4, 2, 'https://www.certifications-eni.com/rsc/fr/vignettes/Postgre_SQL.jpg'),
('NoSQL avec MongoDB', 80.00, TRUE, 5, 2, 'https://miro.medium.com/v2/resize:fit:1400/0*tdiQR1PX3wb-V_bG.jpg'),
('Optimisation des requêtes SQL', 95.00, TRUE, 1, 2, 'https://assets.axopen.com/assets/uploads/requetessql_4ba93b64b8.png'),

-- Design Graphique (Category 3)
('Fondamentaux d''Illustrator', 45.00, FALSE, 2, 3, 'https://www.web-studios.fr/wp-content/uploads/2020/06/communication-2805785_960_720-2.png'),
('Introduction à Figma pour l''UI/UX', 55.00, TRUE, 3, 3, 'https://www.cadschool.ch/wp-content/uploads/maxresdefault-1.jpg'),
('Théorie des Couleurs et Typographie', 30.00, TRUE, 4, 3, 'https://i0.wp.com/zenuacademie.com/wp-content/uploads/2018/01/ombres-tons-nuances-couleurs.png?resize=640%2C640&ssl=1'),
('Design de Logos Pro', 88.00, TRUE, 5, 3, 'https://img.freepik.com/vecteurs-libre/ensemble-idees-conception-logo-entreprise-vecteur_53876-60292.jpg?semt=ais_hybrid&w=740&q=80'),
('Retouche Photo Avancée avec GIMP', 49.00, TRUE, 1, 3, 'https://mediatheque.chateaurenard.com/images/Articles/BLOG/pixel/Gimp-2.10.8-mascotte.png'),

-- Musique & Audio (Category 4)
('Production Musicale avec Ableton Live', 160.00, TRUE, 2, 4, 'https://www.profilculture-formation.com/resources/upload/actu_formation/AbletonLive_carr_.jpg'),
('Mixage et Mastering de Base', 115.00, TRUE, 3, 4, null),
('Solfege pour les Débutants', 35.00, TRUE, 4, 4, null),
('Apprendre la Guitare (Niveau 1)', 50.00, FALSE, 5, 4, null),
('Synthèse Sonore Avancée', 140.00, TRUE, 1, 4, 'https://www.easyzic.com/common/datas/dossiers/67/67/principe.png'),
('Création de Podcast : de l''idée à la publication', 70.00, TRUE, 2, 4, null),
('Harmonie Jazz', 180.00, FALSE, 3, 4, null),

-- Langues Étrangères (Category 5)
('Anglais Professionnel', 60.00, TRUE, 4, 5, null),
('Espagnol Conversational Rapide', 45.00, FALSE, 5, 5, null),
('Introduction au Mandarin', 90.00, TRUE, 1, 5, null),
('Allemand : Les bases de la grammaire', 50.00, TRUE, 2, 5, null),
('Français pour les voyageurs', 40.00, TRUE, 3, 5, null),
('Perfectionnement en Anglais B2/C1', 75.00, TRUE, 4, 5, 'https://www.flcformation.fr/wp-content/uploads/2023/04/commutateur-moderne-indiquant-un-niveau-avance-en-anglais-1024x569.jpg'),
('Japonais : Hiragana et Katakana', 80.00, TRUE, 5, 5, 'https://m.media-amazon.com/images/I/61TzeMjDZWL._AC_UF1000,1000_QL80_.jpg'),
('Conversation en Italien', 55.00, FALSE, 1, 5, 'https://moveup-formation.fr/wp-content/uploads/2019/08/italien02-1.jpg'),

-- Marketing Digital (Category 6)
('SEO : Les Fondamentaux pour 2024', 90.00, TRUE, 2, 6, 'https://www.laplume.mg/wp-content/uploads/2024/01/revolution-seo-2024.jpg'),
('Publicité Google Ads (SEA)', 110.00, TRUE, 3, 6, null),
('Stratégie de Réseaux Sociaux (Instagram/TikTok)', 85.00, TRUE, 4, 6, null),
('Email Marketing Efficace', 60.00, TRUE, 5, 6, null),
('Analyse Web avec Google Analytics 4', 75.00, TRUE, 1, 6, 'https://fredericgonzalo.com/app/uploads/2023/08/Screen-Shot-2023-08-08-at-11.14.35-AM-750x375.png'),
('Rédaction Web & Copywriting', 65.00, TRUE, 2, 6, null),
('Marketing d''Influence', 105.00, FALSE, 3, 6, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9iS7pbF8mbAcwKbBj8JF34laprtHaqdxjCQ&s'),

-- Développement Personnel (Category 7)
('Gestion du Temps et Productivité', 40.00, TRUE, 4, 7, null),
('Prise de Parole en Public', 80.00, FALSE, 5, 7, null),
('Mindfulness et Réduction du Stress', 35.00, TRUE, 1, 7, null),
('Négociation et Communication', 70.00, TRUE, 2, 7, null),
('Les secrets de la motivation', 45.00, TRUE, 3, 7, null),
('Développer sa Résilience', 55.00, TRUE, 4, 7, null),
('Introduction au Coaching de Vie', 95.00, TRUE, 5, 7, null);