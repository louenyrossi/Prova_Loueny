CREATE DATABASE IF NOT EXISTS saep_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE saep_db;
CREATE TABLE usuarios (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
login VARCHAR(60) NOT NULL UNIQUE,
senha_hash VARCHAR(255) NOT NULL
) ENGINE=InnoDB;
CREATE TABLE tutores (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(120) NOT NULL,
cpf_criptografado TEXT NOT NULL,
telefone VARCHAR(20) NOT NULL,
email VARCHAR(120) NOT NULL
) ENGINE=InnoDB;
CREATE TABLE pets (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
especie VARCHAR(50) NOT NULL,
raca VARCHAR(80) NOT NULL,
data_nascimento DATE NOT NULL,
tutor_id INT NOT NULL,
CONSTRAINT fk_pet_tutor FOREIGN KEY (tutor_id)
REFERENCES tutores(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
CREATE TABLE agendamentos (
id INT AUTO_INCREMENT PRIMARY KEY,
pet_id INT NOT NULL,
data_hora DATETIME NOT NULL,
motivo VARCHAR(255) NOT NULL,
observacoes TEXT NOT NULL,
CONSTRAINT fk_agendamento_pet FOREIGN KEY (pet_id)
REFERENCES pets(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
INSERT INTO usuarios VALUES (1, 'Administrador', 'admin',
'$2b$12$G3u2JYle3DwdtBB3JUfD4eMvYHkL2p2ry8D0zxTl0m2zj1KBWT0si');

INSERT INTO usuarios VALUES (2, 'Recepção', 'recepcao',
'$2b$12$IniF9Wusd.PODBe4pXHwxeoKz.i/ILI.uql7zmxgiBhVm9ZSaE3zy');
INSERT INTO usuarios VALUES (3, 'Veterinário', 'vet',
'$2b$12$XdUNZqjiTCxpedU45wvzZu6S7CyG2ebeNvpsEVp9la03SgkJUJbCW');
INSERT INTO tutores VALUES (1, 'Tutor Exemplo A',
'AmWNjmPjOb+GX/S6VH4ba2JYa4RhklQe9CtMLECO43puxoBYTf2E', '17999990001', 'tutor1@exemplo.com');
INSERT INTO tutores VALUES (2, 'Tutor Exemplo B',
'FpBdcWvQ3Uv18YmhV5/8ZzD/JLddWXjkvtRED8/hvmPAbJdSIY7j', '17999990002', 'tutor2@exemplo.com');
INSERT INTO tutores VALUES (3, 'Tutor Exemplo C',
'Z54/l7XrzL71VrjGwP0V3Xgq6Du1lRaxhyBdo6E4ioukq7SwToNx', '17999990003', 'tutor3@exemplo.com');
INSERT INTO pets VALUES
(1,'Thor','Cachorro','SRD','2022-01-10',1),
(2,'Luna','Gato','SRD','2023-03-15',2),
(3,'Mel','Cachorro','Poodle','2021-06-20',3);
INSERT INTO agendamentos VALUES
(1,1,'2026-10-10 08:00:00','Consulta','Primeiro atendimento'),
(2,2,'2026-10-10 09:00:00','Vacinação','Verificar carteira'),
(3,3,'2026-10-11 10:00:00','Retorno','Reavaliação');