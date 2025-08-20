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

## 📬 Contato

Projeto por: Marcos Arize

Para dúvidas ou contribuições: [arizemarcos@gmail.com](mailto:arizemarcos@gmail.com) 📧

