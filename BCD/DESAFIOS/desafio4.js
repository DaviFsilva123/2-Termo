const entrada = require('readline-sync');

console.log("Classificação de Atleta");

const idade_atleta = entrada.questionInt("Insira a idade do atleta?")

if (idade_atleta >= 5 && idade_atleta < 11){
    console.log("infantil")
}else if(idade_atleta >= 11 && idade_atleta <18){
    console.log("Juvenil")

}else if(idade_atleta >= 18 && idade_atleta <=60){
    console.log("Adulto")

}else if(idade_atleta > 60){
    console.log("Sênior")
}else{
    console.log("Você não tem idade suficiente")
}


