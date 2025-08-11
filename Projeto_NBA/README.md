# Análise Preditiva da Eficiência de Arremessos na NBA (eFG%)

Este repositório contém o código e a análise de um projeto de ciência de dados focado em prever a eficiência de arremessos de jogadores da NBA, utilizando a métrica **Effective Field Goal Percentage (eFG%)**. O projeto abrange desde a análise descritiva e pré-processamento dos dados até a implementação e interpretação de um modelo de aprendizado de máquina.

## 📜 Descrição do Projeto

O objetivo principal deste projeto é desenvolver um modelo de classificação que possa determinar se um jogador da NBA tem um `eFG%` acima ou abaixo da média, com base em suas estatísticas de jogo. [cite_start]A análise utiliza um conjunto de dados da temporada 2023-2024, especificamente do período entre 28 de novembro de 2023 e 3 de janeiro de 2024[cite: 14].

[cite_start]A métrica central, **eFG%**, é crucial para uma análise moderna do basquete, pois, ao contrário do tradicional percentual de arremessos de campo (FG%), ela atribui um peso maior às cestas de três pontos[cite: 15, 16]. Isso oferece uma medida mais precisa da eficiência de um jogador. A fórmula para o cálculo é:

$$ eFG\% = \frac{(FG + 0.5 \times 3P)}{FGA} $$

O projeto está estruturado nas seguintes etapas:
1.  **Análise Descritiva e Exploratória:** Investigação inicial dos dados para extrair insights sobre as estatísticas dos jogadores.
2.  **Pré-processamento de Dados:** Etapa de limpeza e organização, incluindo o tratamento de dados duplicados, valores ausentes e outliers.
3.  **Implementação do Modelo:** Utilização de um modelo de Árvore de Decisão para a tarefa de classificação.
4.  **Análise de Resultados:** Interpretação do modelo treinado para entender quais fatores mais influenciam a eficiência dos arremessos.

## 🗃️ Dataset

[cite_start]O conjunto de dados utilizado é `NBA_2824_per_game(03-01-2024).csv` [cite: 9][cite_start], que contém estatísticas por jogo de 538 jogadores[cite: 13]. As colunas mais relevantes para esta análise incluem:
* `Player`: Nome do jogador.
* `Pos`: Posição do jogador.
* `PTS`: Pontos por jogo.
* `FG`: Arremessos de campo convertidos por jogo.
* `FGA`: Arremessos de campo tentados por jogo.
* `FG%`: Percentual de arremessos de campo convertidos.
* `3P`: Arremessos de três pontos convertidos por jogo.
* `eFG%`: Effective Field Goal Percentage.

## 🛠️ Ferramentas e Bibliotecas

O projeto foi desenvolvido em ambiente Python, utilizando as seguintes bibliotecas:
* [cite_start]**Pandas:** Para carregamento, manipulação e análise dos dados[cite: 2].
* [cite_start]**Matplotlib e Seaborn:** Para a criação de visualizações gráficas, como boxplots, histogramas e gráficos de dispersão[cite: 3, 4].
* [cite_start]**Scikit-learn:** Para a implementação do modelo de aprendizado de máquina (Árvore de Decisão), divisão dos dados e avaliação do modelo[cite: 6, 7, 8].

## 📊 Análise Exploratória de Dados (EDA)

A análise inicial focou em entender a distribuição e a relação entre as principais variáveis:

* [cite_start]**Distribuição de Posições:** Um gráfico de barras mostrou a frequência de jogadores em cada posição, com `SG` (Shooting Guard), `PF` (Power Forward), `C` (Center), `PG` (Point Guard) e `SF` (Small Forward) sendo as mais comuns[cite: 17, 23, 32, 33, 34, 35].
* [cite_start]**Visualização com Boxplots:** Foram criados boxplots para analisar a distribuição de `Pontos`, `Arremessos Convertidos (FG)`, `Arremessos Tentados (FGA)`, `% de Arremessos (FG%)`, `eFG%` e `Cestas de 3 Pontos (3P)`[cite: 38, 41, 45, 48, 50, 52]. Essa análise foi fundamental para identificar a presença de outliers em diversas estatísticas.
* [cite_start]**Correlação entre Pontos e Arremessos:** Um gráfico de dispersão revelou uma forte e clara relação linear positiva entre o número de `Pontos` e o de `Arremessos Convertidos`, como esperado[cite: 96, 100].
* [cite_start]**Histogramas de Frequência:** Histogramas para `Arremessos Convertidos` e `Pontos` mostraram que a maioria dos jogadores se concentra na faixa mais baixa dessas estatísticas, com uma cauda longa à direita representando os jogadores de elite com médias altas[cite: 133, 143].

## ⚙️ Pré-processamento e Preparação dos Dados

Para garantir a qualidade dos dados e a robustez do modelo, foram realizadas as seguintes etapas de pré-processamento:

1.  [cite_start]**Remoção de Duplicatas:** Jogadores que apareciam em múltiplas linhas (por exemplo, devido a trocas de time) tiveram suas entradas duplicadas removidas, mantendo-se apenas a primeira ocorrência[cite: 169].
2.  [cite_start]**Tratamento de Valores Nulos:** O dataset apresentava valores nulos nas colunas de percentual (`FG%`, `3P%`, `2P%`, `FT%`) e no `eFG%`[cite: 171, 193, 199, 204, 206, 212]. [cite_start]Esses valores foram recalculados e preenchidos utilizando as colunas de dados brutos correspondentes (ex: `FG%` foi preenchido com `FG` / `FGA`)[cite: 226, 228].
3.  [cite_start]**Tratamento de Outliers:** Utilizando o método do Intervalo Interquartil (IQR), foram identificados e tratados os outliers nas variáveis `PTS`, `3P`, `FG`, `FGA`, `FG%` e `eFG%`[cite: 229]. [cite_start]Os valores que estavam acima do limite superior (`Q3 + 1.5 * IQR`) ou abaixo do limite inferior (`Q1 - 1.5 * IQR`) foram substituídos pelo valor máximo ou mínimo dentro desses limites, respectivamente[cite: 233, 241, 250, 255, 260, 268, 274, 277].

## 🌳 Modelo de Machine Learning: Árvore de Decisão

### Seleção do Modelo

A **Árvore de Decisão** foi o algoritmo de aprendizado supervisionado escolhido para este projeto. [cite_start]A escolha se justifica por várias razões[cite: 295]:
* [cite_start]**Interpretabilidade:** As regras de decisão geradas pela árvore são fáceis de visualizar e entender, o que permite compreender exatamente como as diferentes estatísticas levam a um `eFG%` acima ou abaixo da média[cite: 297].
* [cite_start]**Não exige padronização:** O modelo não requer que as variáveis de entrada (`PTS`, `FG`, etc.) sejam padronizadas, simplificando o pré-processamento[cite: 296].
* [cite_start]**Eficácia:** É um método eficaz para analisar as relações entre as características de um grande número de jogadores[cite: 296].

### Implementação

1.  **Definição das Variáveis:**
    * [cite_start]**Variáveis Preditivas (X):** `PTS`, `FG`, `FG%`, `FGA`, `3P`[cite: 279].
    * [cite_start]**Variável Alvo (y):** Uma coluna binária foi criada para representar se o `eFG%` de um jogador é maior que a média do dataset (`1`) ou não (`0`)[cite: 280, 281, 284].
2.  **Divisão dos Dados:** O dataset foi dividido em três conjuntos:
    * **Treino (60%):** Para treinar o modelo.
    * **Validação (20%):** Para ajustar os hiperparâmetros do modelo.
    * [cite_start]**Teste (20%):** Para avaliar a performance final do modelo em dados não vistos[cite: 285, 287, 290, 292].
    [cite_start]A divisão foi estratificada para manter a proporção da variável alvo em todos os conjuntos[cite: 289].
3.  **Configuração do Modelo:** O classificador de Árvore de Decisão foi instanciado com os seguintes hiperparâmetros para evitar overfitting e melhorar a generalização:
    * [cite_start]`criterion='entropy'` [cite: 300]
    * [cite_start]`max_depth=5` [cite: 300]
    * [cite_start]`min_samples_leaf=10` [cite: 301]
    * [cite_start]`random_state=42` [cite: 302]

## 📈 Resultados e Interpretação

[cite_start]O modelo treinado foi visualizado para facilitar a interpretação das regras de decisão[cite: 312, 323]. A árvore gerada mostra como o modelo utiliza as variáveis para classificar o `eFG%`.

* **Nó Raiz:** A primeira e mais importante divisão é baseada no `FG%`. [cite_start]Jogadores com `FG% <= 0.449` são direcionados para um ramo, enquanto aqueles com `FG% > 0.449` vão para outro[cite: 324, 357]. Isso indica que o percentual de acerto geral é o preditor mais forte da eficiência.
* **Folhas (Decisões Finais):** As folhas da árvore mostram a classificação final. [cite_start]Por exemplo, no ramo direito, jogadores com `FG% > 0.546` e que não fazem muitas cestas de três (`3P <= 0.15`) são, em sua grande maioria, classificados como tendo um `eFG% > média` (provavelmente pivôs eficientes perto da cesta)[cite: 357, 359, 362, 363]. [cite_start]Em outro ramo, mesmo com um bom `FG%`, jogadores com muitas tentativas de três pontos (`3P`) são submetidos a mais testes para determinar sua eficiência[cite: 366].

Essa estrutura de regras fornece insights acionáveis para analistas e técnicos sobre os perfis de jogadores e os principais fatores que contribuem para uma pontuação eficiente no basquete moderno.
