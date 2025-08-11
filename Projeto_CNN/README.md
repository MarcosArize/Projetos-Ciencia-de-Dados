# Reconhecimento de Dígitos Manuscritos com CNN

Projeto de Deep Learning que implementa uma Rede Neural Convolucional (CNN) para classificar imagens de dígitos manuscritos do dataset **MNIST**.

---

## 🔎 Visão geral
Uma CNN leve construída com TensorFlow/Keras que aprende padrões visuais em imagens 28×28 do MNIST e alcança alta acurácia no conjunto de teste.

---

## 🧭 Etapas do projeto

1. **Carregamento e preparação dos dados**
   - Importação do MNIST (treino/teste).
   - Normalização dos pixels para a escala \[0, 1\].
   - Remodelagem para o formato `[amostras, altura, largura, canais]`.
   - One-hot encoding dos rótulos.

2. **Análise e visualização**
   - Visualização das primeiras imagens do conjunto de treino para inspeção.

3. **Modelagem**
   - Arquitetura `Sequential` dividida em:
     - **Extração de características**: blocos convolucionais (Conv2D + ReLU → MaxPooling).
       - Bloco 1: `Conv2D(32)` + `MaxPooling2D`
       - Bloco 2: `Conv2D(64)` + `MaxPooling2D`
     - **Classificação**:
       - `Flatten`
       - `Dense(64, activation='relu')`
       - `Dense(10, activation='softmax')`

4. **Treinamento e avaliação**
   - Compilação: otimizador **Adam**, perda `categorical_crossentropy`.
   - Treinamento: **5 épocas**, `batch_size=128`.
   - Métrica principal: **acurácia**.

---

## 📈 Resultados
- Acurácia no conjunto de teste: **98,94%**.  
- As curvas de treino e validação mostram boa convergência, indicando ajuste adequado sem overfitting significativo.

---

## 🛠 Tecnologias utilizadas
- Python  
- TensorFlow / Keras  
- NumPy  
- Matplotlib
