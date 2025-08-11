Reconhecimento de Dígitos com Rede Neural Convolucional (CNN)
Este projeto demonstra a construção e o treinamento de uma Rede Neural Convolucional (CNN) para classificar imagens de dígitos manuscritos do famoso dataset MNIST.  Utilizando Keras e TensorFlow, o modelo aprende a identificar dígitos de 0 a 9 com alta precisão.

🚀 O que foi feito:
Preparação dos Dados:

O dataset MNIST foi carregado. 

As imagens foram normalizadas para valores entre 0 e 1 para otimizar o treinamento. 


Os dados foram remodelados para o formato exigido pela CNN. 

Os rótulos foram convertidos para o formato 

one-hot encoding. 


Arquitetura do Modelo:

Foi criada uma CNN sequencial simples, composta por:

Duas camadas de convolução (

Conv2D) com ativação ReLU. 


Duas camadas de 

MaxPooling2D para reduzir a dimensionalidade. 


Uma camada 

Flatten para preparar os dados para a classificação. 

Duas camadas densas (

Dense), sendo a última uma camada de saída com ativação softmax para as 10 classes de dígitos. 

Treinamento e Avaliação:

O modelo foi compilado com o otimizador "adam" e a função de perda "categorical_crossentropy". 

O treinamento foi realizado por 5 épocas. 

A acurácia do modelo foi acompanhada tanto no conjunto de treino quanto no de validação. 

🏆 Resultados
O modelo alcançou uma excelente acurácia de 

98,94% no conjunto de testes, demonstrando sua eficácia na tarefa de classificação de imagens. O gráfico de treinamento visualiza a convergência da acurácia ao longo das épocas. 
