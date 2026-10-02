<<<<<<< HEAD
# Segundo Termo SENAI - Exercícios de Programação

## 📝 Descrição do Projeto

Repositório contendo exercícios, atividades e desafios desenvolvidos durante o segundo termo do curso de Desenvolvimento de Sistemas no SENAI. Este projeto abrange conceitos fundamentais de programação em JavaScript, incluindo lógica condicional, laços de repetição, manipulação de arrays e interação com usuário via terminal.

## 🛠️ Tecnologias Utilizadas

- **JavaScript (Node.js)** - Linguagem de programação principal
- **readline-sync** - Biblioteca para entrada de dados no terminal
- **Git** - Controle de versão
- **HTML** - Páginas web (projeto complementar LIMA)

## 📁 Estrutura de Pastas

```
2---Termo/
├── README.md                 # Este arquivo
├── BCD/                      # Pasta principal de exercícios JavaScript
│   ├── Aula2.js             # Exercício de tabuada com loops
│   ├── package.json         # Configuração do projeto Node.js
│   ├── package-lock.json    # Lock file das dependências
│   ├── node_modules/        # Dependências instaladas
│   ├── ATIVIDADES/          # Pasta com atividades práticas
│   │   └── atividades.js    # Exercício de contagem com while
│   ├── DESAFIOS/            # Pasta com 5 desafios de lógica
│   │   ├── desafio1.js      # Verificador de votação (condicionais)
│   │   ├── desafio2.js      # Cálculo com decisão (operadores)
│   │   ├── desafio3.js      # Matemática + Lógica (combustível)
│   │   ├── desafio4.js      # Sistema de análise de crédito
│   │   └── desafio5.js      # Controle de qualidade com arrays
│   └── LAÇO/                # Pasta com exercícios de laços
│       ├── aray.js          # Introdução a arrays
│       ├── aray2.js         # Processamento de arrays (sistema QA)
│       └── ex5.js           # Cálculo de total com looping
└── LIMA/                    # Projeto complementar HTML/CSS
    ├── index.html           # Página principal
    ├── clientes.html        # Página de clientes
    ├── produtos.html        # Página de produtos
    ├── equipe.html          # Página da equipe
    └── delivery.html        # Página de delivery
```

## 📚 Resumo dos Exercícios

### 📂 BCD - Exercícios de Programação JavaScript

#### **Aula 2: Tabuada**
- Arquivo: `Aula2.js`
- Conceito: Loops e entrada de usuário
- Descrição: Solicita um número ao usuário e exibe sua tabuada de 1 a 10

#### **📌 ATIVIDADES**
- **atividades.js**: Exercício de contagem progressiva com while loop

#### **🎯 DESAFIOS**

1. **desafio1.js - Verificador de Votação**
   - Verifica se o usuário é maior de 16 anos
   - Conceito: Condicionais (if/else)

2. **desafio2.js - Cálculo com Decisão**
   - Aplica desconto de 10% em contas acima de R$ 100
   - Conceito: Operadores lógicos e comparação

3. **desafio3.js - Matemática + Lógica**
   - Recomenda abastecimento com álcool ou gasolina
   - Compara preços e aplica lógica de decisão
   - Conceito: Operadores aritméticos e relacionais

4. **desafio4.js - Sistema de Análise de Crédito**
   - Verifica aprovação de crédito baseado em idade e renda
   - Conceito: Lógica combinada (AND/OR)

5. **desafio5.js - Controle de Qualidade**
   - Processa peso de peças e calcula média
   - Aprova ou reprova lote conforme padrão
   - Conceito: Arrays, loops e cálculos matemáticos

#### **🔁 LAÇO - Exercícios com Laços e Arrays**

- **aray.js**: Introdução básica a arrays com nomes
- **aray2.js**: Sistema de controle de qualidade com processamento de arrays
- **ex5.js**: Cálculo de total de compras com validação de entrada

### 📂 LIMA - Projeto Web

Páginas HTML para projeto web complementar:
- **index.html**: Página inicial
- **clientes.html**: Gestão de clientes
- **produtos.html**: Catálogo de produtos
- **equipe.html**: Informações da equipe
- **delivery.html**: Sistema de delivery

## 🚀 Como Executar os Arquivos

### Pré-requisitos
- **Node.js** instalado (versão 14 ou superior)
- **npm** para instalar dependências

### Instalação de Dependências

1. Abra o terminal na pasta `BCD/`:
```bash
cd BCD
npm install
```

Isso instalará a dependência `readline-sync`, necessária para entrada de dados.

### Executar um Arquivo JavaScript

Para executar qualquer arquivo `.js`, use o comando:

```bash
node nome_do_arquivo.js
```

**Exemplos:**

```bash
# Executar tabuada
node Aula2.js

# Executar atividade
node ATIVIDADES/atividades.js

# Executar desafio de votação
node DESAFIOS/desafio1.js

# Executar exercício de laço
node LAÇO/ex5.js
```

### Execução Interativa

Alguns arquivos solicitam entrada do usuário. Siga as instruções exibidas no terminal:

```bash
$ node DESAFIOS/desafio1.js
Verificado de Votação
Qual seu nome? João
Qual sua idade? 20
João você é de maior e pode votar!
```

## 📟 Instruções de Git

### Clonar o Repositório

```bash
git clone <URL_DO_REPOSITORIO>
cd "Segundo temo/2---Termo"
```

### Ver o Histórico de Commits

```bash
git log
```

### Ver Status dos Arquivos

```bash
git status
```

### Fazer Commit de Alterações

```bash
git add .
git commit -m "Descrição das alterações"
```

### Enviar para o Repositório Remoto

```bash
git push origin main
```

### Atualizar Repositório Local

```bash
git pull origin main
```

### Criar uma Nova Branch

```bash
git checkout -b nome-da-branch
```

### Mesclar Branches

```bash
git checkout main
git merge nome-da-branch
```

## 👨‍🏫 Autor

**Aluno: Davi Ferreira da Silva**

---

## 📝 Notas Importantes

- Todos os exercícios utilizam **Node.js** como ambiente de execução
- A biblioteca **readline-sync** permite interação com o usuário via terminal
- Os exercícios progressivamente aumentam de complexidade
- Recomenda-se seguir a ordem: Aula2 → ATIVIDADES → DESAFIOS → LAÇO
- Alguns arquivos contêm código comentado para referência e estudo

## 🎓 Temas Abordados

✅ Variáveis e tipos de dados
✅ Condicionais (if/else)
✅ Operadores lógicos (AND/OR)
✅ Laços de repetição (while, for)
✅ Arrays e manipulação de dados
✅ Funções e modularização
✅ Entrada e saída de dados
✅ Lógica de programação

---

*Último atualizado: Agosto/2026*
=======
# 2-Termo
Segundo termo SENAI
>>>>>>> d53c91e754dbf4f5ec1d71f6fe613e3dbf621a6a
