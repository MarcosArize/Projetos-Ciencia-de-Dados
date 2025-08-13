# Projetos de Ciência de Dados

Repositório com diversos projetos aplicados de **Ciência de Dados**, **Machine Learning** e **Deep Learning**.  
Cada pasta contém um projeto independente com seu próprio código, documentação e resultados.

## 📂 Projetos

### 1. [Previsão de Custos de Planos de Saúde com MLP](./Projeto_MLP/README.md)
Rede Neural MLP para prever custos de planos de saúde a partir de características de clientes.  
Inclui análise exploratória, pré-processamento, visualizações, modelagem e avaliação de desempenho.

**Principais técnicas:**
- Pandas, Numpy, Seaborn, Matplotlib
- Scikit-learn (MLPRegressor, StandardScaler)
- Análise de correlação, boxplots, histograma
- R² ≈ 0,674

---

### 2. [Exemplo Básico de Rede Neural Convolucional](./Projeto_CNN/README.md)
Este projeto é uma implementação de uma CNN (Rede Neural Convolucional) para reconhecimento de dígitos manuscritos utilizando o dataset MNIST. O foco é demonstrar a estrutura de camadas convolucionais, de pooling e densas.

**Principais técnicas:**

Pandas, Numpy, Matplotlib, Keras 

Pré-processamento: normalização e one-hot encoding 

Arquitetura da CNN: camadas 

Conv2D, MaxPooling2D, Flatten e Dense 

**Acurácia no conjunto de teste: ≈ 0.9894**

---

### 3. [Análise de Dados NBA](./Projeto_NBA/README.md)  
Análise exploratória e modelagem sobre estatísticas por jogo da temporada **NBA 2023–2024 (28-11-2023 a 03-01-2024)**. O objetivo principal foi explorar padrões de desempenho (pontos, assistências, rebotes, eFG%) e construir classificadores para identificar jogadores com **eFG% acima da média**.

**Resumo do fluxo:**  
- **Coleta & limpeza:** importação do CSV por-jogo; remoção de duplicados e observações inválidas; padronização de nomes de times e campos; filtragem para análises numéricas (resultado final: conjunto reduzido para análise).  
- **Feature engineering:** criação de categorias como `PTSCat` (níveis de pontuação), `ASTCat`, `TRBCat`, `GSCat` (Titular/Reserva) e `eFG%Cat` (acima/abaixo da média de eFG%).  
- **EDA & estatística descritiva:** distribuição por posição (PG, SG, SF, PF, C), médias e desvios das variáveis (ex.: média de `PTS` ≈ 11.33), boxplots e histogramas para `FG%`, `PTS`, `PF` etc.; análise de quartis e coeficiente de variação.

**Principais insights (resumido):**
- A maior parte dos jogadores apresenta baixo desempenho em pelo menos uma das categorias de boxscore (ex.: alta proporção em `PTSCat = Pontuador Ruim` e `ASTCat = Passador Ruim`).  
- `eFG%` média ≈ **0.535** — usada como limiar para classificar eficiência de arremesso.  
- Forte correlação entre `PTS` e `FG` (≈ 0.99). A inclusão de `3P` mostra relação positiva com `eFG%`, indicando que arremessos de 3 pontos impactam a eficiência ajustada.  
- Testes estatísticos (ANOVA, testes de variância) indicaram diferenças significativas em certas métricas entre posições; testes de independência (chi-square) foram aplicados em categorias binárias.

**Modelagem (classificação de `eFG% > média`):**
- **Features usadas:** `['PTS','FG','FG%','FGA','3P']`.  
- **Divisão de dados:** treino/validação/teste com estratificação.  
- **Modelos avaliados (cross-val 5-fold):**
  - **Regressão Logística (LR):** *accuracy* média ≈ **0.9485**.  
  - **Árvore de Decisão (DT):** *accuracy* média ≈ **0.8182**.  
  - **KNN:** *accuracy* média ≈ **0.7515**.  
- **Validação adicional:** LR obteve desempenho robusto na validação (precision/recall/f1 ≈ 0.97), enquanto a Árvore fornece regras interpretáveis úteis para análise tática. Matrizes de confusão e curvas ROC/AUC foram geradas para comparação entre modelos.

**Conclusão rápida:**  
Variáveis simples de box score (pontos e arremessos) são altamente informativas para explicar `eFG%`. Modelos lineares simples, como Regressão Logística, apresentam excelente performance classificatória neste conjunto, enquanto modelos interpretáveis (Árvore de Decisão) ajudam a extrair regras práticas para entendimento de padrões de arremesso.

**Principais técnicas & ferramentas:**  
- Python, Pandas, Numpy, Matplotlib, Seaborn, Plotly, Pingouin (testes estatísticos)  
- Scikit-learn (pré-processamento, cross-validation, LogisticRegression, DecisionTreeClassifier, KNN)  
- Análise exploratória, testes de hipótese (t, ANOVA, Bartlett/Levene), regressão linear e classificação supervisionada

**Arquivos relacionados:**  
- `datasetNBA` (CSV original: `NBA_2024_per_game(03-01-2024).csv`)  
- `Projeto Analise Nba.ipynb` — notebook com todo o pipeline, análises e visualizações.

---

## 🚀 Tecnologias Utilizadas
- Python 3.x
- Pandas, Numpy, Matplotlib, Seaborn
- Scikit-learn
- Jupyter/Google Colab
- Redes Neurais (MLP e CNN)

---

## 📌 Sobre
Este repositório é parte do meu portfólio de Ciência de Dados.  
Conecte-se comigo no [LinkedIn](https://www.linkedin.com/in/marcosarize/) para trocar ideias!
