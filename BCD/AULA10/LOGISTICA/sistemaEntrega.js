const entrada = require("readline-sync")
const calculadora = require("./calculadoraFrete")

console.log("---- CALCULADORA DE FRETE ----")

const nomeProduto = entrada.question("Insira o nome do produto: ")
const distanciaEmKM = entrada.questionFloat("Insira a distancia de entrega em Km: ")
const valorTotalCarga = entrada.questionFloat("Qual o valor total da carga em R$: R$");

const Frete = calculadora.calcularBase(distanciaEmKM)
const seguro = calculadora.calcularSeguro(valorTotalCarga)
const prazo = calculadora.verificarPrazo(distanciaEmKM)

console.log("---- RELATORIO FINAL ----")
console.log(`Prazo de entrega: ${prazo} `)
console.log(`Produto: ${nomeProduto}`)
console.log(`Valor final: R$ ${Frete + seguro}`)
