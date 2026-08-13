const entrada = require('readline-sync');

console.log("=== SISTEMA DE CONTROLE DE QUALIDADE ===");
const pesos = [];
let somatotal= 0;

const qtdPecas = entrada.questionInt("Quantas pecas deseja avaliar?");
for (let i = 0; i <qtdPecas; i++){
    let peso = entrada.questionFloat(`Digite o peso da peça ${i + 1} (kg): `)
    pesos.push(peso);
    somatotal += peso;

}
const media = somatotal / qtdPecas;

console.log("\n--- Relátorio da auitora")
console.log(`pesos registrados:[ ${pesos.join("kg |")} kg ] `)
console.log(`Média do peso lote: ${media.toFixed(2)} kg`)

if (media >= 4.8 && media <= 5.2){
    console.log("STATUS FINAL: Lote aprovado !!")

}else {
    console.log("STATUS FINAL: Lote Reprovado (Fora do prdrão)")
}