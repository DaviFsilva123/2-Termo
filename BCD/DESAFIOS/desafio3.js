const entrada = require('readline-sync');

console.log("Matemática + Lógica");

const precoAlcool = entrada.questionFloat("Insira o valor do litro da Álcool:")
const precoGasolina = entrada.questionFloat("Insira o valor do litro da gasolina:")

const total_desconto = precoAlcool / precoGasolina

if(total_desconto < 0.7){
    console.log("Abasteça com ÁLCOOL.");
}else {
    console.log("Abasteça com GASOLINA.");
}
