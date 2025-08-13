# Análise de Dados NBA — Projeto 

> Notebook principal: `Projeto Analise Nba.ipynb`.  
> (Conteúdo completo do notebook usado como referência para este README). 

---

## 1. Visão geral
Este projeto realiza uma **análise exploratória completa** e experimentos de **modelagem supervisionada** sobre estatísticas por-jogo da temporada **NBA 2023–2024 (28-11-2023 a 03-01-2024)**. O objetivo principal foi investigar determinantes de eficiência de arremesso (medida por **eFG%**) e construir classificadores que identifiquem jogadores com **eFG% acima da média**.

---

## 2. Dados
- **Origem:** arquivo CSV por-jogo (`NBA_2024_per_game(03-01-2024).csv`).  
- **Dimensão original:** ~538 linhas × 29 colunas (cada linha = jogador/jogo ou agregação por jogador, conforme o arquivo).  
- **Filtragem:** o notebook aplica limpeza e filtros (remoção/ajuste de duplicados, remoção de observações inválidas), resultando em um subconjunto para a análise numérica (aprox. 330 jogadores/observações para as etapas estatísticas). 

Colunas de destaque usadas no projeto: `PTS`, `FG`, `FG%`, `FGA`, `3P`, `AST`, `TRB`, `PF`, `Pos`, entre outras.

---

## 3. Pré-processamento e limpeza
Principais passos realizados no notebook:

1. **Leitura do CSV** com `pandas` e inspeção inicial (`head()`, `info()`, `describe()`).
2. **Tratamento de valores faltantes** e padronização de tipos de dados quando necessário.
3. **Remoção de duplicados** e normalização de nomes (times, posições).
4. **Filtragem de observações** para manter apenas entradas válidas para análise quantitativa (por exemplo, jogadores com número mínimo de jogos ou com campos essenciais preenchidos).
5. **Criação de variáveis categóricas** a partir de contagens/valores contínuos (ex.: transformar `PTS`, `AST`, `TRB` em categorias `PTSCat`, `ASTCat`, `TRBCat`).
6. **Definição do rótulo alvo**: `eFG%Cat` — binário indicando se `eFG%` de um jogador está **acima** da média do conjunto (threshold = média de eFG% ≈ 0.535). 

---

## 4. Análise exploratória (EDA)
O notebook contém várias visualizações e estatísticas descritivas, entre elas:

- **Distribuições e histogramas** para `PTS`, `FG%`, `3P`, `FGA` e outras métricas.  
- **Boxplots** por posição (`Pos`) para comparar dispersões de `PTS`, `PF`, etc.  
- **Matriz de correlação** e mapa de calor para identificar relações entre variáveis. Resultado notável: **forte correlação entre `PTS` e `FG` (≈ 0.99)**.  
- **Cálculo de quartis, média e coeficiente de variação** para variáveis-chave.  
- **Testes estatísticos**: ANOVA e testes de variância (Bartlett/Levene) para comparar métricas entre posições; testes de independência (chi-square) para categorias criadas. Estes testes identificaram diferenças significativas em algumas métricas entre posições. 

---

## 5. Feature engineering
- Seleção de features para modelagem: `['PTS', 'FG', 'FG%', 'FGA', '3P']` (e outras variações testadas no notebook).  
- Normalização/escala quando necessária (dependendo do modelo).  
- Criação de variáveis categóricas (ex.: `GSCat` para titular/reserva) para análises adicionais e possíveis experimentos com métodos não-lineares.

---

## 6. Modelagem (classificação)
**Problema:** classificar se um jogador tem `eFG%` acima da média (binário).

**Pipeline de modelagem:**
- Divisão em conjuntos de treino/validação/teste com stratificação do rótulo.
- Avaliação via **cross-validation 5-fold** e métricas como *accuracy*, *precision*, *recall*, *f1*, além de matrizes de confusão e ROC/AUC.

**Modelos testados (principais resultados):**
- **Regressão Logística (Logistic Regression)**  
  - *Accuracy* média (CV 5-fold): **≈ 0.9485** (± 0.0182).  
  - Na validação, apresentou *precision/recall/f1* altos (≈ 0.97), indicando ótima capacidade preditiva nesse conjunto.
- **Árvore de Decisão (Decision Tree)**  
  - *Accuracy* média (CV 5-fold): **≈ 0.8182** (± 0.0166).  
  - Fornece regras interpretáveis e visualização da árvore para insights táticos.
- **K-Nearest Neighbors (KNN)**  
  - *Accuracy* média (CV 5-fold): **≈ 0.7515** (± 0.0227).

> Observação: os valores acima são os resultados registrados no notebook para as configurações escolhidas e podem variar se você alterar features, hiperparâmetros ou critérios de amostragem. 

---

## 7. Avaliação e visualizações de desempenho
- **Matrizes de confusão** para cada modelo, permitindo inspeção de falsos positivos/negativos.  
- **Curvas ROC/AUC** e comparação entre modelos.  
- **Visualização da árvore de decisão** (DT) para interpretar regras que levam a classificação `eFG% > média`.  
- **Análise qualitativa** dos resultados: modelos lineares simples (LR) performaram muito bem, sugerindo que as features selecionadas capturam bem o sinal informativo para `eFG%`.

---

## 8. Principais conclusões
- Métricas simples de boxscore (principalmente `PTS`, `FG` e `3P`) explicam grande parte da variação em `eFG%`.  
- Modelos lineares (Logistic Regression) mostraram desempenho excelente para a tarefa de classificação binária proposta, enquanto modelos interpretáveis (Decision Tree) ajudam a extrair regras prática/taticamente relevantes.  
- Testes estatísticos confirmam diferenças de comportamento entre posições em algumas métricas (ex.: faltas, minutos), o que pode guiar análises mais direcionadas por posição.

---

## 9. Como reproduzir (passo a passo)
1. Clone o repositório e entre na pasta do projeto:
   ```bash
   git clone https://github.com/SEU_USUARIO/Projetos-Ciencia-de-Dados.git
   cd Projetos-Ciencia-de-Dados/Projeto_NBA
