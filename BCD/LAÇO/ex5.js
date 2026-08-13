const entrada = require("readline-sync");

let total = 0;
let preco = -1;

while (preco !==0){
    preco = entrada.questionFloat("Preço; R$ ");

    if (preco !==0){
        total +=preco;
        console.log (`Sub total: R${total.toFixed(2)}`);
    }else
        console.log(`O valor total da compra ficou ${total} R$`)
}