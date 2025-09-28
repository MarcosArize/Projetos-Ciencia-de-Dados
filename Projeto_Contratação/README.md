# 🚀 Projeto: Análise de Mercado

## 🧾 Descrição

Projeto de análise de mercado e recrutamento desenvolvido em Google Colab. Os dados originais foram extraídos de um banco de dados criado por mim presente na pasta Projetos_SQL/Projeto_Mercado/ e exportados para CSV. O objetivo do projeto é realizar limpeza e preparação dos dados (ETL), exploração e visualização (EDA) e análises estatísticas / modelagem básica para gerar insights sobre candidatos, candidaturas, entrevistas e experiências profissionais. ✨

---

## 📂 Estrutura de arquivos

```
Projeto_Contratacao/
├── README.md                # Documentação principal do projeto
├── data/
│   ├── raw/                 # Dados brutos e originais (CSVs)
│   └── processed/           # Dados limpos e tratados após o ETL
└── notebooks/
    └── etl_contratacao.ipynb # Notebook com o processo de ETL e Data Cleaning
```

---

## 🧰 Bibliotecas principais

* Python 3.8+
* pandas
* numpy
* matplotlib
* seaborn
* scikit-learn
* scipy
* pingouin

Instalação (ex.: Colab / local):

```bash
pip install pandas numpy matplotlib seaborn scikit-learn scipy pingouin
```

---

## ▶️ Como rodar (Google Colab)

1. Abra o Google Colab e carregue o notebook (ou abra o link fornecido no PDF). 🧑‍💻
2. Faça upload dos CSVs para o ambiente (`candidatos_v2.csv`, `candidaturas.csv`, `entrevistas.csv`, `experiencias.csv`). ⤴️
3. Execute as células do notebook na ordem. ▶️

Exemplo de carregamento:

```python
import pandas as pd

df_candidatos = pd.read_csv('candidatos_v2.csv')
df_candidaturas = pd.read_csv('candidaturas.csv')
df_entrevistas = pd.read_csv('entrevistas.csv')
df_experiencias = pd.read_csv('experiencias.csv')
```

---

## 🧹 Resumo do pipeline (ETL)

1. **Leitura** dos CSVs exportados do banco SQL. 📥
2. **Validação de schema** e tipos de dados (`dtypes`). ✅
3. **Limpeza de valores inválidos** e placeholders (`'\N'`, strings incompletas). 🧼
4. **Normalização de campos categóricos** (e.g. `genero`, `origem`, `nivel_formacao`, `cidade_residencia`). 🔁
5. **Parsing de datas** e criação de variáveis temporais (idade, `tempo_candidatura`, `tempo_entrevista`). 🗓️
6. **Conversão de colunas numéricas** (anos de formação, nota, experiência média) e tratamento de NA. 🔢
7. **Merge** entre tabelas para análises combinadas (ex.: `entrevistas` + `candidaturas`). 🔗

---

## 🔧 Principais transformações realizadas (exemplos)

* Normalização de `genero` para valores padronizados (`Masculino`, `Feminino`, `Nao informado`). ♀️♂️
* Correção e preenchimento de emails inválidos; substituição de `\N` por mensagens informativas. ✉️
* Conversão de `data_nascimento` / `data_candidatura` / `data_entrevista` para `datetime`. 🕒
* Cálculo da idade a partir de `data_nascimento`. 🎂
* Conversão de `anos_formacao` e `experiencia_media_anos` para numérico e preenchimento de valores ausentes. 📈
* Padronização de origens (`LinkedIn`, `Site`, `Indicação`, etc.). 🌐
* Cálculo de `tempo_candidatura` e `tempo_entrevista` como diferença em dias em relação a uma data de referência. ⏱️

---
## 📊 Análise Exploratória de Dados (EDA) e Insights Estratégicos  

Esta seção detalha a análise exploratória realizada após o ETL, focando em transformar os dados limpos em inteligência de negócio acionável para otimizar o processo de recrutamento.  

---

### 🎯 Principais Perguntas de Negócio  
A análise foi guiada para responder a questões críticas de negócio:  

- **Perfil do Candidato:** Quem são os candidatos que atraímos versus quem são os que contratamos?  
- **Eficácia dos Canais:** Quais canais de aquisição de talentos oferecem o melhor retorno sobre o investimento (ROI) em termos de qualidade?  
- **Eficiência do Funil:** Onde estão os gargalos em nosso processo seletivo?  
- **Preditores de Sucesso:** Quais características e competências realmente diferenciam um candidato contratado de um não contratado?  

---

### 📈 Análises Realizadas  
Para responder a essas perguntas, foram realizadas as seguintes análises:  

- **Análise de Perfil:** Comparação demográfica, gênero e educacional entre o pool geral de candidatos e o grupo de contratados.  
- **Análise de Canais de Sourcing:** Avaliação da taxa de conversão (candidaturas vs. contratações) para cada canal de origem.  
- **Análise do Funil de Recrutamento:** Mapeamento das taxas de conversão entre as etapas de triagem, entrevista e contratação.  
- **Análise de Experiência Profissional:** Investigação da correlação entre anos de experiência e o sucesso na contratação.  
- **Análise de Desempenho em Entrevistas:** Comparação das notas médias entre contratados e não contratados, e análise da consistência entre os entrevistadores.  
- **Análise Qualitativa de Feedbacks:** Extração de temas e palavras-chave recorrentes dos feedbacks textuais para decodificar os critérios de avaliação.  

---

### 💡 Principais Insights Gerados  

- **O Canal de Origem é o Maior Preditor de Qualidade:**  
  Indicação e LinkedIn mostraram taxas de conversão superiores, gerando candidatos mais qualificados. Já canais de alto volume, como o site da empresa, apresentaram eficiência muito menor, consumindo recursos com baixo retorno.  

- **A Inconsistência dos Entrevistadores é um Risco Crítico:**  
  Houve variação estatisticamente significativa nas notas entre entrevistadores. Alguns são mais rigorosos, outros mais benevolentes, comprometendo a equidade e eficácia do processo.  

- **O Mito dos "Anos de Experiência":**  
  A quantidade de anos de experiência não é um bom preditor de sucesso. Contratados e não contratados apresentaram médias semelhantes. O que pesa é a relevância e a qualidade da experiência.  

- **A Entrevista é o "Momento da Verdade":**  
  Houve diferença clara entre a nota média dos contratados (**> 8.2**) e dos não contratados (**≈ 6.1**). Isso reforça a necessidade de padronização e calibração desta etapa.  

- **Decodificando o "Fit Cultural" com Feedbacks:**  
  Feedbacks textuais revelaram que soft skills como *liderança*, *visão estratégica* e *comunicação* foram decisivas para os contratados. Para os reprovados, termos como *conhecimento superficial* e *falta de experiência prática* foram recorrentes.  

- **O "Funil de Talentos" Acadêmico:**  
  Candidatos com forte background acadêmico (Mestrado/Doutorado em Física, Astronomia, Neurociência) apresentaram desempenho excepcional, sendo altamente bem avaliados em vagas de dados.  

---

### 🔬 Análise Estatística Avançada  

Para validar os achados da EDA, foram aplicados testes estatísticos:  
- **Teste de Pearson:** Confirmou que a relação entre o tempo da entrevista e a nota do candidato é estatisticamente significativa.
- **ANOVA (Análise de Variância):** Confirmou que diferenças entre canais, formações e entrevistadores eram estatisticamente significativas.  
- **Teste de Bartlett:** Identificou se o conjunto de amostras possuiam variancias iguais.  
- **Teste de Qui-Quadrado:** Confirmou que existe uma relação entre o nivel de formação do candidato e sua contratação. 


## 📬 Contato

Projeto por: Marcos Arize

Para dúvidas ou contribuições: [arizemarcos@gmail.com](mailto:arizemarcos@gmail.com) 📧


