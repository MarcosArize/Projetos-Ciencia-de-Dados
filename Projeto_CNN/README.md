# Reconhecimento de Dígitos Manuscritos com CNN
Projeto de Deep Learning que implementa uma Rede Neural Convolucional (CNN) para classificar imagens de dígitos manuscritos do dataset MNIST.

## 📊 Etapas do Projeto

1.**Carregamento e Preparação dos Dados**

Importação do dataset MNIST, já dividido em conjuntos de treino e teste.


Normalização dos valores dos pixels das imagens para a escala de 0 a 1.

Remodelagem das imagens para o formato 

[amostras, altura, largura, canais] adequado para a CNN.

Aplicação de One-Hot Encoding nos rótulos de classificação.


2.**Análise e Visualização**

Exibição das 10 primeiras imagens do conjunto de treinamento para inspeção visual dos dados.


3.**Modelagem da CNN**

A arquitetura do modelo 

Sequential  foi dividida em duas partes principais:

**Extração de Características**: Composta por dois blocos convolucionais para aprender os padrões das imagens.

O primeiro bloco contém uma camada 

Conv2D (32 filtros, ativação ReLU) seguida por 

MaxPooling2D.

O segundo bloco contém uma camada 

Conv2D (64 filtros, ativação ReLU) seguida por 

MaxPooling2D.

**Classificação**: Composta por camadas densas para realizar a previsão final.

Uma camada 

Flatten transforma os dados para a entrada das camadas densas.

Uma camada 

Dense com 64 neurônios e ativação ReLU atua como uma camada oculta.

A camada final 

Dense com 10 neurônios e ativação softmax classifica a imagem em um dos 10 dígitos.

4.**Treinamento e Avaliação**

Compilação do modelo utilizando o otimizador 

Adam e a função de perda categorical_crossentropy.

Treinamento do modelo por 5 épocas com um 

batch_size de 128.

Métrica de avaliação: 

Acurácia ≈ 0,9894 no conjunto de teste.

Análise de Performance

Visualização da curva de acurácia de treino e validação ao longo das épocas para monitorar o aprendizado e evitar overfitting.


# 📈 Resultados
O modelo demonstrou alta performance, alcançando **98,94% de acurácia**  ao classificar os dígitos no conjunto de dados de teste. O gráfico de treinamento mostra uma excelente convergência entre as curvas de treino e validação, indicando um bom ajuste do modelo.


# 🛠 Tecnologias Utilizadas
Python
TensorFlow / Keras 
Numpy 
Matplotlib
Numpy 

Matplotlib 
