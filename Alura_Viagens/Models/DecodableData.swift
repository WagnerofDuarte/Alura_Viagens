//
//  DecodableData.swift
//  AluraViagens
//
//  Created by Ândriu Felipe Coelho on 28/01/21.
//

import Foundation

func getSessaoDeViagens() -> [ViagemViewModel] {
    let teste: [ViagemViewModel]? = load(UsefulStrings.nameOfMock)
    guard let viagens = teste else {
        fatalError(UsefulStrings.errorServerResponse)
    }
    return viagens
}

func load(_ filename: String) -> [ViagemViewModel]? {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
        fatalError(UsefulStrings.errorCouldntFindFile(filename))
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError(UsefulStrings.errorCouldntLoadFileFromMainBundle(filename, error.localizedDescription))
    }
    
    do {
        
        guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            fatalError(UsefulStrings.errorToReadJsonDictionary)
        }
        
        guard let listaDeViagens = json["viagens"] as? [String: Any] else {
            fatalError(UsefulStrings.errorToReadTravelList)
        }
        
        guard let jsonData = TiposDeViagens.jsonToData(listaDeViagens) else { return nil }
        
        let tiposDeViagens = TiposDeViagens.decodeJson(jsonData)
        
        var listaViagemViewModel: [ViagemViewModel] = []
        
        for sessao in listaDeViagens.keys {
            switch ViagemViewModelType(rawValue: sessao)  {
            case .destaques:
                if let destaques = tiposDeViagens?.destaques {
                    let destaqueViewModel = ViagemDestaqueViewModel(destaques)
                    listaViagemViewModel.insert(destaqueViewModel, at: 0)
                }
            case .ofertas:
                if let ofertas = tiposDeViagens?.ofertas {
                    let ofertaViewModel = ViagemOfertaViewModel(ofertas)
                    listaViagemViewModel.append(ofertaViewModel)
                }
            default:
                break
            }
        }
        
        return listaViagemViewModel
    } catch {
        fatalError(UsefulStrings.errorCouldntParse)
    }
}
