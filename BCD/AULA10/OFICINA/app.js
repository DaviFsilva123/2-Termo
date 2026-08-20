const entrada = readlineSync = require('readline-sync');

const oficina = require('./funcoesoficina');

console.log("=== SISTEMA DE GESTÃO DE OFICINA ===");

const peca = entrada.questionFloat("preco da peca: R$");
const horas = entrada.questionInt("Horas de servico:");
const tempoUso = entrada.questionInt("Meses desde o ultimo conserto: ");

const totalBruto = oficina.caucularOrcamento(peca, horas);
const statusGarantia = oficina.VerificarGarantia(tempoUso);
const totalComDesconto = oficina.AplicadarDesconto(totalBruto);

console.log("\n--- RELATÓRIO FINAL ---");
console.log(`Orcamento sem desconto: R$ ${totalBruto.toFixed(2)}`);
console.log(`Orcamento com desconto (5%): R$ ${totalComDesconto.toFixed(2)}`);
console.log(`Status do veiculo: ${statusGarantia}`);





























