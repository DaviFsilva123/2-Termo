const entrada = require('readline-sync');

console.log("O Simulador de Empréstimo");

const renda = entrada.questionFloat("Qual sua renda mensal? ");
const nomeLimpo = entrada.keyInYNStrict("Seu nome está limpo? ");   

if (renda > 2000 && nomeLimpo === true) {
    console.log("Empréstimo Aprovado");
} else {
    console.log("Empréstimo Negado");
}