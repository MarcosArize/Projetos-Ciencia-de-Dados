-- Criar banco de dados e usar
CREATE DATABASE IF NOT EXISTS recrutamento;
USE recrutamento;

-- Tabela de candidatos
CREATE TABLE candidatos (
    id_candidato INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(200) NOT NULL,
    email VARCHAR(200),
    data_nascimento DATE,
    genero VARCHAR(20),
    cidade_residencia VARCHAR(100),
    nivel_formacao VARCHAR(100), -- Ensino Médio, Graduação, Mestrado, etc.
	anos_formacao INT,
    numero_de_vagas_candidatadas INT
);

-- Tabela de candidaturas
CREATE TABLE candidaturas (
    id_candidatura INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_candidato INT UNSIGNED NOT NULL,
    id_vaga INT,
    data_candidatura DATE,
    origem VARCHAR(50), -- linkedin, site, indicação, etc.
    curriculo_texto TEXT, -- aqui coloque o texto relacionado do curriculo,
    status_candidato VARCHAR(50), -- triagem, entrevista, contratado, recusado
    experiencia_media_anos DECIMAL(4,2),
    contratado TINYINT(1) DEFAULT 0, -- se contratado 1 se não 0,
    CONSTRAINT fk_candidaturas_candidato
        FOREIGN KEY (id_candidato)
        REFERENCES candidatos(id_candidato)
        ON DELETE CASCADE
        ON UPDATE CASCADE
	
);

-- Tabela de entrevistas
CREATE TABLE entrevistas (
    id_entrevista INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_candidatura INT UNSIGNED NOT NULL,
    entrevistador VARCHAR(100),
    data_entrevista DATE,
    nota DECIMAL(4,2), -- ex: 9.50
    feedback TEXT,
    CONSTRAINT fk_entrevistas_candidatura
        FOREIGN KEY (id_candidatura)
        REFERENCES candidaturas(id_candidatura)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Tabela de experiências profissionais
CREATE TABLE experiencias (
    id_experiencia INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_candidato INT UNSIGNED NOT NULL,
    empresa VARCHAR(200),
    cargo VARCHAR(200),
    data_inicio DATE,
    data_fim DATE,
    anos_experiencia DECIMAL(4,2),
    CONSTRAINT fk_experiencias_candidato
        FOREIGN KEY (id_candidato)
        REFERENCES candidatos(id_candidato)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);



