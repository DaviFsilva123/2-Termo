function caucularOrcamento(precoPeca, horas_trabalho){
    const valorHora = 85.00;
    const totalMaoDeObra = horas_trabalho * valorHora
    return precoPeca + totalMaoDeObra

}

function VerificarGarantia(meses) {
    if (meses <= 12){
        return "dentro da garantia"
    }else{
        return "garantia expirada";
    
    }
}

function AplicadarDesconto (valorTotal) {
    return valorTotal * 0.95;

}
module.exports = {
    caucularOrcamento,
    VerificarGarantia,
    AplicadarDesconto
}