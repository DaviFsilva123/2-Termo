
// const entrada = require('readline-sync');

// console.log("--- SISTEMA DE ANALISE DE CREDITO ---");

// //COLETA DE DADOS
// const nome = entrada.question("Nome cliente: ");
// const idade = entrada.questionInt("idade: ");
// const renda = entrada.questionFloat("Renda Mensal: ");
// const temImovel = entrada.keyInYNStrict("Possui imovel próprio? ")

// // Á lógica combinada
// // (Idade >= 18) é obrigatório
// //renda >= 2500 || temImovel === true) um dos dois tem que ser verdade
// if ((idade >= 18 && (renda >= 2500 || temImovel === true))) {
//     console.log(`\nPARABENS, ${nome}! Seu crédito foi APROVADO!`)
// } else {
//     console.log(`Sinto muito,${nome}. Seu crédito foi NEGADO.`)
// }

// let contador = 0;

// while (contador <=100){
//     console.log(`Contagem: ${contador}!`);
//     contador +=5; //Isso aumenta 1 no contador (IMPORTANTE!)
// //-------------------------------------------
//     contador ++;
//     contador ++;
//     contador ++;
//     contador ++;
//     contador ++;
// }
// console.log("Fim da contagem!");


const entrada = require('readline-sync');
const num = entrada .questionInt("Tabuada de qual numero? ");

for (let i = 1 ; i <=10; i++) {
    console.log(`${num} x %{i} = ${num * i }`);
}

