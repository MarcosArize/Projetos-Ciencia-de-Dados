# Análise Preditiva da Eficiência de Arremessos na NBA (eFG%)

> Projeto para prever se um jogador da NBA possui **eFG% (Effective Field Goal Percentage)** acima ou abaixo da média, através de análise exploratória, pré-processamento e um modelo de **Árvore de Decisão**.  
> Fonte / notebook: `datasetnba2.pdf`. :contentReference[oaicite:0]{index=0}

---

## 🔎 Visão geral
O objetivo é construir um classificador interpretável que, a partir de estatísticas por jogo, identifique jogadores com `eFG%` superior à média. A análise usa dados da temporada **2023–2024** (período analisado: **28/11/2023 – 03/01/2024**).

---

## 🗃 Dataset
- Arquivo principal: `NBA_2824_per_game(03-01-2024).csv` (ex.: `nba_2023_2024_per_game_28-11-2023_03-01-2024.csv`). :contentReference[oaicite:1]{index=1}  
- Tamanho amostral: **538 × 29** (linhas × colunas).  
- Colunas-chave usadas: `Player`, `Pos`, `PTS`, `FG`, `FGA`, `FG%`, `3P`, `eFG%`.

---

## 🧭 Pipeline resumido

1. **Análise exploratória (EDA)**  
   - Distribuições, boxplots e histogramas para `PTS`, `FG`, `FGA`, `FG%`, `3P` e `eFG%`.  
   - Verificação de correlações (ex.: `PTS` vs `FG`).

2. **Pré-processamento**  
   - Remoção de duplicatas (manter primeira ocorrência).  
   - Recalculo / preenchimento de percentuais faltantes (ex.: `FG% = FG / FGA`).  
   - Tratamento de outliers via IQR (substituição por limites Q1/Q3 ± 1.5·IQR).  
   - Criação da variável alvo binária: `eFG% > média → 1`, caso contrário `0`.

3. **Seleção de features**  
   - Features utilizadas: `PTS`, `FG`, `FG%`, `FGA`, `3P`.

4. **Modelagem**  
   - Algoritmo: `DecisionTreeClassifier` (scikit-learn).  
   - Divisão: treino/validação/teste (ex.: 60/20/20, estratificada).  
   - Hiperparâmetros utilizados (exemplo):  
     ```py
     criterion='entropy'
     max_depth=5
     min_samples_leaf=10
     random_state=42
     ```

5. **Avaliação e interpretação**  
   - Métricas: `classification_report`, `accuracy_score`.  
   - Visualização da árvore para extrair regras/thresholds interpretáveis.

---

## 📈 Principais insights
- **FG%** emergiu como o preditor mais relevante — nó raiz com threshold em ~`0.449` separa muitos grupos.  
- A árvore combina `FG%`, `PTS`, `FGA` e `3P` para definir perfis com maior probabilidade de `eFG%` acima da média (ex.: altos `FG%` com poucas tentativas de 3P podem indicar pivôs eficientes perto da cesta).  
- A interpretabilidade da árvore facilita gerar recomendações táticas e perfis de scouting para os times.
- Conseguimos prever, com aproximadamente 85,6% de precisão, se os jogadores estão abaixo ou acima da média de eFG% da liga com base nos parâmetros selecionados.

---

## 🛠 Tecnologias
- Python, Pandas, NumPy  
- Matplotlib / Seaborn  
- Scikit-learn (DecisionTreeClassifier)  
- Jupyter / Google Colab

---


# abrir notebook
jupyter notebook

