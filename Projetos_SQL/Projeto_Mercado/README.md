# 🗂️ Repositório: `recrutamento` — Banco de Dados para Tracking de Candidaturas (ATS simples)

## 🔎 Visão geral
Este repositório contém um schema SQL para um banco de dados relacional (MySQL/MariaDB) chamado **`recrutamento`**, pensado para rastrear candidatos, candidaturas, entrevistas e experiências profissionais. Ideal como protótipo de um  **Applicant Tracking System (ATS)** leve — claro, normalizado e pronto para integração com dashboards ou aplicações.

## 🗝️ Palavras-chave
`MySQL`, `MariaDB`, `SQL`, `schema`, `database`, `ATS`, `Applicant Tracking System`, `recrutamento`, `candidatos`, `candidaturas`, `entrevistas`, `experiencias`, `modelagem de dados`, `integridade referencial`, `FK`, `pipeline de recrutamento`

## 🧩 Estrutura do banco de dados
O schema foi projetado para simplicidade e boa normalização. Tabelas principais:

### `candidatos`
- `id_candidato` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY  
- `nome_completo` VARCHAR(200)  
- `email` VARCHAR(200)  
- `data_nascimento` DATE  
- `genero` VARCHAR(20)  
- `cidade_residencia` VARCHAR(100)  
- `nivel_formacao` VARCHAR(100)  
- `anos_formacao` INT  
- `numero_de_vagas_candidatadas` INT

### `candidaturas`
- `id_candidatura` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY  
- `id_candidato` INT UNSIGNED (FK -> `candidatos.id_candidato`)  
- `id_vaga` INT  
- `data_candidatura` DATE  
- `origem` VARCHAR(50) — (ex: linkedin, site, indicação)  
- `curriculo_texto` TEXT  
- `status_candidato` VARCHAR(50) — (ex: `triagem`, `entrevista`, `contratado`, `recusado`)  
- `experiencia_media_anos` DECIMAL(4,2)  
- `contratado` TINYINT(1) DEFAULT 0

### `entrevistas`
- `id_entrevista` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY  
- `id_candidatura` INT UNSIGNED (FK -> `candidaturas.id_candidatura`)  
- `entrevistador` VARCHAR(100)  
- `data_entrevista` DATE  
- `nota` DECIMAL(4,2)  
- `feedback` TEXT

### `experiencias`
- `id_experiencia` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY  
- `id_candidato` INT UNSIGNED (FK -> `candidatos.id_candidato`)  
- `empresa` VARCHAR(200)  
- `cargo` VARCHAR(200)  
- `data_inicio` DATE  
- `data_fim` DATE  
- `anos_experiencia` DECIMAL(4,2)


