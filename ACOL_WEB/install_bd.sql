CREATE SEQUENCE id_st;
CREATE SEQUENCE id_para;
CREATE SEQUENCE id_choice;

-- Table des histoires et leur statut
CREATE TABLE Story (
       storyId number(6) DEFAULT id_st.nextval PRIMARY KEY,
       title NVARCHAR2(200) NOT NULL,
       isOpen int default 1 CHECK(isOpen = 1 OR isOpen= 0),
       isCompleted int default 0 CHECK(isCompleted = 1 OR isCompleted= 0),
       isPublished int default 0 CHECK(isPublished = 1 OR isPublished= 0),
);

-- Table des utilisateurs enregistrés
CREATE TABLE Users (
       login NVARCHAR2(100) NOT NULL PRIMARY KEY,
       password NVARCHAR2(100) NOT NULL
);

-- Table des utilisateurs qui participent à une histoire (invités + créateur + auteurs effectifs)
CREATE TABLE Participants (
       login NVARCHAR2(100) NOT NULL,
       storyId number(6),
       isWriting int default 0 CHECK(isWriting = 1 OR isWriting= 0),
       constraint UserPartFK foreign key (login) references Users(login),
       constraint storyPartFK foreign key (storyId) references Story(storyId) ON DELETE CASCADE,
       constraint particPartPK PRIMARY KEY(login, storyId)

);

-- Table des auteurs créateurs
CREATE TABLE Creators (
       login NVARCHAR2(100) NOT NULL,
       storyId number(6),
       constraint UserCreateFK foreign key (login) references Users(login),
       constraint storyCreateFK foreign key (storyId) references Story(storyId) ON DELETE CASCADE,
       constraint CreatePK PRIMARY KEY(storyId)
        --storyId suffit
);

-- liste des auteurs effectifs par les paragraphes (author)
CREATE TABLE Paragraph (
       paraId number(6) DEFAULT id_para.nextval,
       storyId number(6),
       title NVARCHAR2(200) NOT NULL,
       concluding int default 0 CHECK(concluding = 1 OR concluding= 0),
       isInitial int default 0 CHECK(isInitial = 1 OR isInitial= 0),
       author NVARCHAR2(100) NOT NULL,
       content NVARCHAR2(1600) NOT NULL,
       constraint authorFK foreign key (author) references Users(login),
       constraint storyParagraphFK foreign key (storyId) references Story(storyId) ON DELETE CASCADE,
       constraint paraPK PRIMARY KEY (paraId)
);

-- Table des choix dans un paragraphe
CREATE TABLE Choice (
       numero int,
       fatherId number(6),
       sonId number(6) default 0,
       isLocked int default 0 CHECK(isLocked = 1 OR isLocked= 0), -- Pour guarantir l'exclusion mutuelle d'un choix (un seul auteur edite un choix)
       displayable int default 0 CHECK(displayable = 1 OR displayable = 0), -- les choix qui mennent a un paragraphe conclusif
       title NVARCHAR2(200) NOT NULL,
       constraint father foreign key (fatherId) references Paragraph(paraId) ON DELETE CASCADE,
       constraint choicePK PRIMARY KEY(numero, fatherId)
);

-- Table des historiques, chaque utilisateur(login) a un seul historique
CREATE TABLE History (
       login NVARCHAR2(100) NOT NULL,
       numero int,
       fatherId number(6),
       depth number(6), -- pour pouvoir trier la liste des choix facilement
       constraint HistoryChoiceFK foreign key (numero,fatherId) references Choice(numero, fatherId) ON DELETE CASCADE,
       constraint HistoryFK foreign key (login) references Users(login),
       constraint historyPK PRIMARY KEY(login, numero, fatherId)

);


-- Peupler la base de donneess

INSERT INTO Story (title, isOpen, isCompleted, isPublished) VALUES
    ('L’Aède et la Sorcière', 1, 1, 1);

INSERT INTO Story (author, title) VALUES
    ('Oz','L’Aède et la Sorcière');

INSERT INTO Creators(login, storyid) VALUES ('Oz', 323);
INSERT INTO Participants(login, storyid) VALUES ('Oz', 323);
INSERT INTO Participants(login, storyid) VALUES ('Theodora', 323);
INSERT INTO Participants(login, storyid) VALUES ('Clément', 323);
INSERT INTO Participants(login, storyid) VALUES ('Fabi', 323);
INSERT INTO Participants(login, storyid) VALUES ('Camilla', 323);



---Parargraphe 1
INSERT INTO Paragraph (storyId, title, concluding, isInitial, author, content) VALUES
    (323, 'Arrivée de l’aède', 0, 1, 'Oz',
     'Un jour, il y a près de trois mille ans, un navire peint de brillantes couleurs ' ||
     'entrait dans un port du pays qui s’appelle encore la Grèce. Sur le pont du navire se ' ||
     'trouvait un aède portant une lyre dorée. Il jouait des chants fabuleux ensorcelant tous ' ||
     'ceux qui les entendaient. J’étais assis sur les quais entrain d’écouter les chants de l’aède');

---Paragraphe 2
INSERT INTO Paragraph (storyId, title, concluding, isInitial, author, content) VALUES
    (323, 'L’orage', 0, 0, 'Theodora',
    'Je restai sur les quais. Un vent violent souffla et des nuages noirs s’épaissèrent. Le tonnerre grondait ' ||
    'les voiles des navires du port se déchirèrent et les gens commencèrent à s’enfuir. Je me tourna ' ||
    'pour quitter les lieux et soudainement un objet mystérieux enflammé tomba des nuages et ' ||
    'atteignit le sol.');

---Paragraphe 3
INSERT INTO Paragraph (storyId, title, concluding, isInitial, author, content) VALUES
    (323, 'La Sorcière des Flammes', 0, 0, 'Clément',
     'Je me cachai derrière la barrière en bois voulant regarder ce qui allait se passer. Les flammes ' ||
     'devinrent de moins en moins violentes. Une silhouette d’une femme apparut petit à petit entre les flammes.' ||
     'L’aède s’approcha de la silhouette. Il commença à lui parler : ' ||
     '"_ Que fais-tu ici Gamora, sorcière des flammes."' ||
     '"_ Je viens récupérer ce qui m’appartient. Tu sais plus que moi que cette lyre est la mienne."' ||
     'L’aède refusa de donner à la sorcière la lyre. Cette dernière utilisa sa magie pour frapper l’objet' ||
     'précieux. L’aède perdut la lyre qui tomba par terre en se glissant jusqu’à mes pieds. Je la pris et...');

---Paragraphe 4
INSERT INTO Paragraph (storyId, title, concluding, isInitial, author, content) VALUES
(323, 'Loin du combat', 1, 0, 'Fabi',
    'Je décidai de quitter les lieux et me rendre dans la ville. Le tonnerre grondait toujours et de ' ||
    'petites explosions commencèrent à s’entendre dans toute la ville. Les habitants de la citadel ' ||
    'effrayés, parlèrent sans cesse du combat de l’aède contre une sorcière dénommée Gamora. Je rentrai chez moi,' ||
    'je pris mes affaires et je quittai la cité à toute allure. ' ||
    'Un mois plutard, j’entendis de la bouche d’un voyageur que la cité devint toute en cendre ' ||
    'et que tous ses habitants moururent dans la boucherie causée par l’aède et la sorcière dont tout' ||
    'le monde ignorait leur sort après la bataille. -------- FIN');

---Pragraphe 5
INSERT INTO Paragraph (storyId, title, concluding, isInitial, author, content) VALUES
(323, 'L’allié de la sorcière', 0, 0, 'Clément',
 'Je pris la lyre entre mes mains. Je me souvins des paroles de la sorcière et que cet objet-là lui appartenait. ' ||
 'Je la jettai alors vers la sorcière qui l’utilisa pour tuer l’aède. Voulant me remercier, la sorcière' ||
 'me proposa de devenir son allié ou d’exhausser un de mes voeux.');

---Pragraphe 6
INSERT INTO Paragraph (storyId, title, concluding, isInitial, author, content) VALUES
(323, 'L’ère de la destruction', 1, 0, 'Camilla',
 'Je choisis de devenir l’allié de la sorcière. Elle m’apprit tous les sorts et les secrets de la' ||
 'magie noire. Ensemble, nous devînmes les maîtres du monde.');

---Pragraphe 7
INSERT INTO Paragraph (storyId, title, concluding, isInitial, author, content) VALUES
(323, 'La lyre des merveilles', 1, 0, 'Camilla',
 'Je lui demandai d’exhausser mon voeu. En effet, je lui demandai de me créer une lyre semblable à celle' ||
 'qu’elle possédait et qui me permettrait d’obtenir tout ce que je voulais. Elle accepta et grâce à cette lyre, ' ||
 'je construisis un grand palais où je vis une merveilleuse vie.');

---Pragraphe 8
INSERT INTO Paragraph (storyId, title, concluding, isInitial, author, content) VALUES
(323, 'La fin de la sorcière', 1, 0, 'Clément',
 'Je rendis la lyre à l’aède. Celui-ci se servit de la grande puissance de cette objet magique pour tuer la' ||
 'sorcière. L’aède et moi devinrent de grands héros aux yeux de toute la ville et le roi nous proposa d’exhausser ' ||
 'un de nos voeux.');

---Pragraphe 9
INSERT INTO Paragraph (storyId, title, concluding, isInitial, author, content) VALUES
(323, 'Au fond de l’océan', 1, 0, 'Oz',
 'La lyre était magique. Je décidai alors de m’en servir pour venir à bout de ces deux créatures, car ' ||
 'plus personne ne savait quelles étaient leurs ambitions. Ne connaissant rien aux sorts et formules magiques,' ||
 ' je ne pouvais pas évoquer la magie de la lyre. Je décidai donc de la jeter au milieu de l’océan. La sorcière, impulsivement,' ||
 ' se jeta dans l’eau oubliant qu’elle était faite par du feu et qu’elle ne devait en aucun cas toucher l’eau. La sorcière ' ||
 'se vaporisa et mourra. L’aède me remercia et m’expliqua qu’il comptait faire pareil pour venir à bout de la méchanceté de la sorcière. L’aède et moi devinrent de grands héros aux yeux de toute la ville et le roi nous proposa d’exhausser ' ||
 'un de nos voeux.');

---Pragraphe 10
INSERT INTO Paragraph (storyId, title, concluding, isInitial, author, content) VALUES
(323, 'Risques et périls', 0, 0, 'Clément',
 'Je m’approchai dangereusement de l’objet enflammé. L’aède hurla en me disant de me cacher au plus vite.');

---Pragraphe 11
INSERT INTO Paragraph (storyId, title, concluding, isInitial, author, content) VALUES
(323, 'Pas intéressé par ces chants', 0, 0, 'Clément',
 'Je n’étais pas attiré par les chants et je quitte le port en direction de la ville. Un orage s’approchait du ' ||
 'port ce qui m’encouragea plus à partir.');

---C1
INSERT INTO Choice (numero, fatherId, sonId, title) VALUES
    (1, 302, 303, 'Je continuai à écouter les chants de l’aède.');
---C2
INSERT INTO Choice (numero, fatherId, sonId, title) VALUES
    (1, 303, 305, 'Je quittai les lieux et je décidai de me rendre dans la citadel.');
---C11
INSERT INTO Choice (numero, fatherId, sonId, title) VALUES
    (1, 312, 305, 'Je quittai les lieux et je décidai de me rendre dans la citadel.');
---C3
INSERT INTO Choice (numero, fatherId, sonId, title) VALUES
    (2, 303, 311, 'Je m’approchai dangereusement de l’objet enflammé.');
---C4
INSERT INTO Choice (numero, fatherId, sonId, title) VALUES
    (3, 303, 304, 'Je me cachai derrière une barrière en bois.');
---C12
INSERT INTO Choice (numero, fatherId, sonId, title) VALUES
    (1, 311, 304, 'Je me cachai derrière une barrière en bois.');
---C5
INSERT INTO Choice (numero, fatherId, sonId, title) VALUES
    (1, 304, 306, 'Je donnai la lyre à la sorcière car elle lui appartenait.');
---C6
INSERT INTO Choice (numero, fatherId, sonId, title) VALUES
    (2, 304, 309, 'Ayant peur de la sorcière, je rendis la lyre à l’aède.');
---C7
INSERT INTO Choice (numero, fatherId, sonId, title) VALUES
    (3, 304, 310, 'La lyre était magique. Je décidai donc de la garder.');
---C8
INSERT INTO Choice (numero, fatherId, sonId, title) VALUES
    (2, 302, 312, 'Je n’étais pas attiré par les chants et je quitte le port en direction de la ville.');
---C9
INSERT INTO Choice (numero, fatherId, sonId, title) VALUES
    (1, 306, 307, 'Je choisis de devenir l’allié de la sorcière.');
---C10
INSERT INTO Choice (numero, fatherId, sonId, title) VALUES
    (2, 306, 308, 'Je lui demandai d’exhausser un de mes voeux.');
---------------------------------------------
----Ajouter l'histoire
INSERT INTO STORY (title, isopen, iscompleted, ispublished) VALUES ('Mon Odyssée', 0, 1, 1)

----Ajouter les utilisateurs

INSERT INTO USERS (LOGIN, PASSWORD) VALUES ('Jabberwocky', '12');
INSERT INTO USERS (LOGIN, PASSWORD) VALUES ('Agatha', '13');
INSERT INTO USERS (LOGIN, PASSWORD) VALUES ('Enora', '14');
INSERT INTO USERS (LOGIN, PASSWORD) VALUES ('Swara', '15');
INSERT INTO USERS (LOGIN, PASSWORD) VALUES ('Hatter', '16');
INSERT INTO USERS (LOGIN, PASSWORD) VALUES ('Twatty', '17');
INSERT INTO USERS (LOGIN, PASSWORD) VALUES ('Scate', '18');
INSERT INTO USERS (LOGIN, PASSWORD) VALUES ('Amanda', '19');
INSERT INTO USERS (LOGIN, PASSWORD) VALUES ('Chris', '20');
INSERT INTO USERS (LOGIN, PASSWORD) VALUES ('Ramos', '21');

----Ajouter les participants

INSERT INTO Participants(login, storyid) VALUES ('Jabberwocky', 288);
INSERT INTO Participants(login, storyid) VALUES ('Agatha', 288);
INSERT INTO Participants(login, storyid) VALUES ('Swara', 288);
INSERT INTO Participants(login, storyid) VALUES ('Hatter', 288);
INSERT INTO Participants(login, storyid) VALUES ('Chris', 288);
INSERT INTO Participants(login, storyid) VALUES ('Scate', 288);
INSERT INTO Participants(login, storyid) VALUES ('Ramos', 288);
INSERT INTO Participants(login, storyid) VALUES ('Enora', 288);



----Ajouter l'auteur créateur

INSERT INTO Creators(login, storyid) VALUES ('Jabberwocky', 288);

----Ajouter les paragraphes

INSERT INTO Paragraph (storyId, title, concluding, isInitial, author, content) VALUES
(288, 'Début du voyage', 0, 1, 'Jabberwocky', 'La guerre des trois Serpents est achevée. Chacun des survivants s’apprête à regagner son royaume. Je monte à bord du navire à direction de Télas, mon île d’origine. Le navire est rempli de Télassiens qui ont participé à la guerre. Les vents emportent notre navire vers le sud. L’équipage est entrain de festoyer leur victoire. Soudain, un furieux vent du Nord se déchaîne et couvre la terre et la mer de nuages. Le navire se laisse emporter par les vagues violentes et les voiles commencent à se déchirer.');

INSERT INTO Paragraph (storyId, title, concluding, isInitial, author, content) VALUES (288, 'Frôler le danger', 0, 0, 'Agatha', 'Je cours vers une barrière en bois et je m’y accroche fortement. Les eaux salées des hautes vagues  me frappent sans cesse au visage. Le courant d’eau est si fort qu’il me jette dans l’océan.');
INSERT INTO Paragraph (storyId, title, concluding, isInitial, author, content) VALUES (288, 'Le survivant', 0, 0, 'Swara', 'Je descends dans la cave du bateau. Je reste caché là. L’eau commence à pénétrer à travers les fissures du navire. Je cherche des objets lourds pour étancher ces fissures mais en vain. Je monte dans le pont du bateau. Il y avait personne là. Certains se sont jetés dans l’eau pour échapper la mort et d’autres sont morts à cause des vents violents. Le bateau est entrain de se diriger vers deux falaises hautes et verticales trop raides et trop lisses pour qu’un homme puisse l’escalader.');
INSERT INTO Paragraph (storyId, title, concluding, isInitial, author, content) VALUES (288, 'Au fond de l’océan.', 0, 0, 'Hatter', 'Je me jette dans l’océan. L’eau est très froide et agitée. J’essaie de nager pour m’accrocher à une plaque en bois. Le courant d’eau est très violent. Je me trouve submergé par les vagues et noyé dans le fond de l’océan. Dix heures après cet orage, je me réveille dans la plage d’une île mystérieuse dont personne ne connaissait l’existence. ');
INSERT INTO Paragraph (storyId, title, concluding, isInitial, author, content) VALUES (288, 'Charybde', 0, 0, 'Chris', 'Je guide le bateau vers la falaise droite. En s’approchant de l’entrée d’une géante grotte au pied de la falaise, je reconnais cet endroit. C’était là où vivait la redoutable Charybde, le monstre des eaux qui aspire les eaux trois fois par jour et les vomit ensuite. Je ne peux pas changer de direction car je me trouve soudainement aspiré par ce monstre. Évitant le moment où elle engloutit tout dans ses profondeurs agitées, je passe à côté au moment où elle rejette l’eau bouillonnante. Je me trouve alors poussé de la falaise de Charybde et devant l’ouverture béante et sombre de la caverne de la falaise gauche.');
INSERT INTO Paragraph (storyId, title, concluding, isInitial, author, content) VALUES (288, 'Scylla', 0, 0, 'Agatha', 'La falaise gauche était l’habitation de Scylla, le dragon à six têtes. J’entre dans la caverne submergée par les eaux de l’océan. Soudainement, les six têtes se projettent en avant et détruisent une grande partie du navire. Je manie mon épée et je me coupe en deux une des têtes. Le dragon lance des cris de détresse et disparaît dans le noir. Je réussis à sortir de la caverne et l’orage s’apaise de plus en plus. Un vent doux souffla et m’aide à guider le bateau vers le nord.');
INSERT INTO Paragraph (storyId, title, concluding, isInitial, author, content) VALUES (288, 'L’île des Amazones', 0, 0, 'Je quitte la plage et je me dirige vers le centre de l’île. Au milieu de cette île se trouvait une montagne géante et des forêts tropicales avec des milliers d’espèces animales et végétales hors du commun. Alors que je suis entrain de chercher de quoi me nourrir, des flèches surgissent de nulle part et j’entends des cris et des hurlements derrière les arbres denses. Des femmes, munies de lances et d’arcs apparaissent et me prennent en otage. Elles m’emmènent vers leur village qui se situait au pied de la montagne. Elle parlait une langue étrangère et je ne pouvais ni comprendre ce qu’elles disaient  ni leur demander qui elles étaient. En arrivant au centre du village, une femme, qui est probablement leur chef, s’avance vers moi. Elle me demanda qui j’étais. Heureusement qu’elle parlait la même langue que moi. Je lui raconte mon aventure et elle m’explique que cette île est peuplée uniquement par des femmes et que j’étais le premier homme à y mettre les pieds depuis plus de quarante ans. Elle me propose d’y rester où je pourrais vivre une vie merveilleuse. Elle me donne alors une eau appelée le nectar des Amazones. En buvant cette eau, je pourrais rester si je suis un homme pacifique et bon. Sinon, je mourrais.');
INSERT INTO Paragraph (storyId, title, concluding, isInitial, author, content) VALUES (288, 'Le nouveau bateau', 0, 0, 'Je reste sur la plage de l’île. Je trouve des grandes plaques en bois jetées dans le sable. C’était probablement des plaques du navire détruit qui ont été rejetées par les eaux lors de l’orage. Je décide de construire alors un nouveau petit bateau avec ces plaques. Je rassemble un maximum de bois et je les dépose côte-à-côte sur le sable. Je devais les encastrer. Alors je décide de rassembler des racines d’arbres et des plantes pour m’en servir. ');
INSERT INTO Paragraph (storyId, title, concluding, isInitial, author, content) VALUES (288, 'De retour', 1, 0, 'Le navire continue son voyage vers le nord. Après vingt jours, je pouvais apercevoir l’île de Télas à l’horizon. Je retrouve ma femme et mes enfants à qui je leur raconte toute mon aventure incroyable et inoubliable -------------- FIN.');
INSERT INTO Paragraph (storyId, title, concluding, isInitial, author, content) VALUES (288, 'L''Amazonien', 1, 0, 'Sans hésiter, je prends le nectar et je le bois. Les minutes passent lentement pendant laquelle je n’attendais que ma mort. La reine des Amazones sourit et me souhaite la bienvenue sur l’île. Elle me propose de marier sa fille et devenir le prince des Amazones. J’accepte et un grand festin est organisé à l’occasion. Des années passent et je deviens le commandant des forces amazoniennes. Moi, à la tête de cette armée, je réussis à conquérir de nombreuses terres et contrées permettant à l’empire Amazonien de gouverner tous les territoires. ----------------- FIN');
INSERT INTO Paragraph (storyId, title, concluding, isInitial, author, content) VALUES (288, 'Emprisonné!!', 0, 0, 'Je refuse de boire le nectar. Je ne pouvais pas risquer ma vie pour cela. La chef demande alors de m’emprisonner et m’accuse d’être un traître. Je reste emprisonné sept jours attendant mon procès. Un jour, la princesse vient me voir en prison. Elle ouvre la porte et me demande de sortir. Je la suis vers une grotte au bord de la mer. J’aperçois un navire flottant dans les eaux. Elle me dit que ce navire me permettrait de regagner mon île. Je lui demande pourquoi elle m’avait aidé. Elle me raconte que son père aussi était tué par sa mère car il avait désobéi à cet ordre. La princesse me dit aussi qu’elle ne voulait plus voir les hommes tués par sa mère et partager le même sort que son père. Je la prends dans mon bras et je lui demande de venir avec moi et de fuir la tyrannie de sa mère. Elle refuse en me disant que sa place était à l’île des Amazones et qu’elle devait accomplir son destin. Je me monte alors à bord du navire et je quitte l’île.');


----- Ajouter les choix pour chaque paragraphe

---Paragraphe 1
INSERT INTO Choice (numero, fatherId, sonId, title) VALUES
(1, 265, 266, 'Je m''accroche à une barrière en bois');
INSERT INTO Choice (numero, fatherId, sonId, title) VALUES
(2, 265, 267, 'Je me cache dans la cave du bateau');
INSERT INTO Choice (numero, fatherId, sonId, title) VALUES
(3, 265, 268, 'Je me jette dans l''océan');

---Paragraphe 2
INSERT INTO Choice (numero, fatherId, sonId, title) VALUES
(1, 266, 268, 'Je me trouve au milieu de l''océan');

---Paragraphe 3
INSERT INTO Choice (numero, fatherId, sonId, title) VALUES
(1, 267, 269, 'Je guide le bateau vers la falaise droite');
INSERT INTO Choice (numero, fatherId, sonId, title) VALUES
(2, 267, 270, 'Je guide le bateau vers la falaise gauche');
INSERT INTO Choice (numero, fatherId, sonId, title) VALUES
(3, 267, 268, 'Je me jette dans l''océan');

---Paragraphe 4
INSERT INTO Choice (numero, fatherId, sonId, title) VALUES
(1, 268, 271, 'Je pars à la découverte de l’île');
INSERT INTO Choice (numero, fatherId, sonId, title) VALUES
(2, 268, 272, 'Je reste sur la plage espérant qu’un navire vienne me sauver');

---Paragraphe 5
INSERT INTO Choice (numero, fatherId, sonId, title) VALUES
(1, 269, 270, 'Je me trouve devant la falaise gauche');

---Paragraphe 6
INSERT INTO Choice (numero, fatherId, sonId, title) VALUES
(1, 270, 273, 'Le navire se dirige vers le nord.');

---Paragraphe 7
INSERT INTO Choice (numero, fatherId, sonId, title) VALUES
(1, 271, 274, 'Sans hésiter, je bois le nectar.');
INSERT INTO Choice (numero, fatherId, sonId, title) VALUES
(2, 271, 275, 'Je refuse de boire le nectar');

---Paragraphe 8
INSERT INTO Choice (numero, fatherId, sonId, title) VALUES
(1, 272, 271, 'Je pars à la recherche de racines et d’arbres.');

---Paragraphe 11
INSERT INTO Choice (numero, fatherId, sonId, title) VALUES
(1, 275, 273, 'Je guide le navire vers le nord.');
