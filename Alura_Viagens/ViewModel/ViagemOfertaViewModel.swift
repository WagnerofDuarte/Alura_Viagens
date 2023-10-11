//
//  ViagemOfertaViewModel.swift
//  Alura_Viagens
//
//  Created by Wagner Duarte on 05/09/23.
//

import Foundation

class ViagemOfertaViewModel: ViagemViewModel {
    
    //MARK: - Atributes
    
    var tituloSessao: String {
        return UsefulStrings.ofertas
    }
    
    var tipo: ViagemViewModelType {
        return .ofertas
    }
    
    var viagens: [Viagem]
    
    var numeroDeLinhas: Int {
        return 1
    }
    
    //MARK: - Inicializer
    
    init(_ viagens: [Viagem]) {
        self.viagens = viagens
    }
}
