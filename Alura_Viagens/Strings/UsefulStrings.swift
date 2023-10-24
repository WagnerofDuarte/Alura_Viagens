//
//  Strings.swift
//  Alura_Viagens
//
//  Created by Wagner Duarte on 11/10/23.

import Foundation

class UsefulStrings {
    
    //MARK: Strings Files Names
    static let nameOfMock = "server-response.json"
    
    //MARK: Strings Errors
    static let errorToLoadTableViewCell = "Error to create/load the table(s) cell(s)"
    static let errorCouldntParse = "Couldn't parse"
    static let errorServerResponse = "Server Response Error!"
    static let errorToReadJsonDictionary = "Error to read json dictionary"
    static let errorToReadTravelList = "Error to read travel list"
    
    static func errorCouldntLoadFileFromMainBundle(_ fileName: String, _ error: String) -> String {
        return "Couldn't load \(fileName) from main bundle:\n\(error)"
    }
    static func errorCouldntFindFile(_ fileName: String) -> String {
        return "Couldn't find \(fileName) in main bundle."
    }
    
    //MARK: Strings IDs
    static let homeTableViewHeaderIdentifier = "HomeTableViewHeader"
    static let ofertasViagensCollectionViewCellIdentifier = "OfertasViagensCollectionViewCell"
    static let destaquesViagemTableViewCellIdentifier = "DestaquesViagemTableViewCell"
    static let ofertasViagensTableViewCellIdentifier = "OfertasViagensTableViewCell"
    
    //MARK: Strings Trip types
    static let destaques = "Destaques"
    static let ofertas = "Ofertas"
    static let internacionais = "Internacionais"
    
    
    //MARK: Strings Methods
    static func appendMoneySignToDouble(_ number: Double, startingAtText: Bool) -> String {
        if startingAtText {
            return "Á Partir de R$ \(number)"
        }
        return "R$ \(number)"
    }
    
    static func addStrikeThroughToDouble(_ number: Double) -> NSMutableAttributedString {
        
        let atributedString: NSMutableAttributedString = NSMutableAttributedString(string:appendMoneySignToDouble(number, startingAtText: false))
        atributedString.addAttribute(NSAttributedString.Key.strikethroughStyle,value: 1, range: NSMakeRange(0, atributedString.length))
        
        return atributedString
    }
    
    static func numberOfGuestsAndDaysString(days: Int, guests: Int) -> String {
        
        let tripDays = days == 1 ? "Diária" : "Diárias"
        let tripGuests = guests == 1 ? "Pessoa" : "Pessoas"
        
        return "\(days) \(tripDays) - \(guests) \(tripGuests)"
    }
    
}
