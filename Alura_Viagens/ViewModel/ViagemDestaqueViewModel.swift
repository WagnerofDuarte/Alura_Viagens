//
//  ViagemDestaqueViewModel.swift
//  Alura_Viagens
//
//  Created by Wagner Duarte on 04/09/23.
//

import Foundation

class ViagemDestaqueViewModel: ViagemViewModel {
    
    //MARK: - Atributes
    
    var tituloSessao: String {
        return UsefulStrings.destaques
    }
    
    var tipo: ViagemViewModelType {
        return .destaques
    }
    
    var viagens: [Viagem]
    
    var numeroDeLinhas: Int {
        return viagens.count
    }
    
    //MARK: - Inicializer
    
    init(_ viagens: [Viagem]){
        self.viagens = viagens
    }

    
}
