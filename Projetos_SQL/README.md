# SQL — Visão Geral dos Projetos

Este repositório centraliza meus projetos em **SQL** (modelagem, DDL, queries analíticas e scripts de suporte); aqui está uma visão geral rápida e uma seção resumida dedicada a cada projeto feito em **SQL**

---
## 🔎 Projeto: Recrutamento de candidatos no mercado de trabalho
**Local:** `Projeto_Mercado/`  
**Objetivo:** gerenciar dados do processo seletivo (candidatos → candidaturas → entrevistas → experiências) para apoiar análises de RH e KPIs.

### O que tem
- `ddl_recrutamento.sql` — script de criação do banco `recrutamento` e tabelas principais.
- `seed_sample_data.sql` (opcional) — inserts de exemplo para testes.
- `queries/` — consultas úteis e KPIs sugeridos (taxa de conversão, tempo médio de contratação, top cidades, etc.).

### Esquema (resumo das tabelas)
- `candidatos` — id, nome, email, data_nascimento, genero, cidade_residencia, nivel_formacao, anos_formacao, numero_de_vagas_candidatadas.
- `candidaturas` — id_candidatura, id_candidato (FK), id_vaga, data_candidatura, origem, curriculo_texto, status_candidato, experiencia_media_anos, contratado.
- `entrevistas` — id_entrevista, id_candidatura (FK), entrevistador, data_entrevista, nota, feedback.
- `experiencias` — id_experiencia, id_candidato (FK), empresa, cargo, data_inicio, data_fim, anos_experiencia.

### Uso rápido
1. Abrir cliente MySQL (CLI, Workbench, DBeaver...).  
2. Executar o DDL:
```sql
SOURCE recrutamento/ddl_recrutamento.sql;
