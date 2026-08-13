const entrada = require('readline-sync');

console.log("Verificado de Votação");

const nome = entrada.question("Qual seu nome? ");
const idade = entrada.questionInt("Qual sua idade? ");

if (idade >=16){
    console.log(`${nome} você é de maior e pode votar!`)
}else {
    console.log(`Você é de menor, ${nome}. e não yem permissão para votar. `)
}
