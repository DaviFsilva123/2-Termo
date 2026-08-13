const entrada = require('readline-sync');

console.log("Cálculo com Decisão");

const valor_da_conta = entrada.questionFloat("Valor da conta final: ");

if (valor_da_conta >100 ){
    const total_desconto = entrada.questionInt(valor_da_conta * 0.9);
    console.log(`O valor da sua conta com desconto ficou o total de: ${total_desconto}`);
    
} else{
    console.log(`Você gastou menos que 100R$, o valor total ficou: ${valor_da_conta}R$`);
}