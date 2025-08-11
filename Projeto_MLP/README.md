# Previsão de Custos de Planos de Saúde com MLP

Projeto de **Machine Learning** utilizando **Rede Neural MLP** para prever custos de planos de saúde com base em características de clientes.  

## 📊 Etapas do Projeto

1. **Importação e Análise Exploratória**
   - Carregamento do dataset `insurance_modified.csv`
   - Inspeção de tipos de dados, valores ausentes e duplicados
   - Estatísticas descritivas e boxplots para variáveis numéricas e categóricas

2. **Pré-processamento de Dados**
   - Imputação de valores nulos com a média (`SimpleImputer`)
   - Codificação de variáveis categóricas (`sex`, `smoker`, `region`)
   - Tratamento de outliers (`age > 110`, `children > 10`)
   - Remoção de registros duplicados
   - Padronização com `StandardScaler`

3. **Análise Estatística e Visualizações**
   - Matriz de correlação e heatmap
   - Distribuição do IMC (`bmi`)
   - Boxplots por variável

4. **Modelagem**
   - Divisão em treino e teste (80/20)
   - Modelo `MLPRegressor` com:
     - 3 camadas ocultas (10 neurônios cada)
     - Ativação `ReLU`
     - Otimizador `Adam`
     - Taxa de aprendizado adaptativa
     - Máx. 1000 iterações
   - Métrica de avaliação: **R² ≈ 0,674**

5. **Predições**
   - Teste com novos dados para prever custos
   - Curva de perda durante o treinamento
   - Gráfico de valores reais vs. previstos

## 📈 Resultados
O modelo apresentou bom desempenho na previsão, capturando relações entre variáveis como IMC, tabagismo e custo do plano de saúde.  
A maior correlação foi observada entre a variável `smoker` e `charges` (0,76).

## 🛠 Tecnologias Utilizadas
- Python 3.x
- Pandas, Numpy
- Matplotlib, Seaborn
- Scikit-learn (MLPRegressor, StandardScaler)

## 📎 Arquivos
- `Previsão_de_Custos_de_Planos_de_Saúde_com_MLP.ipynb` → Notebook principal
- `insurance_modified.csv` → Dataset usado no projeto

---
