//
//  ObjectDataSource.swift
//  Alura_Viagens
//
//  Created by dtiDigital on 05/10/23.
//

//Remover os coordninators deste arquivo

import UIKit

//MARK: Class Definition
class HomeTableViewController: NSObject, Coordinating {
    
    //MARK: Atributes
    var coordinator: Coordinator?
    let viagens: [ViagemViewModel]
    
    //MARK: Inicializer
    init(coordinator: Coordinator? = nil, viagens: [ViagemViewModel]) {
        self.coordinator = coordinator
        self.viagens = viagens
    }
    
    //MARK: TableView setUp
    func setUpViagensTableView(tableView: UITableView){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DestaquesViagemTableViewCell", bundle: nil),
                                  forCellReuseIdentifier: "DestaquesViagemTableViewCell")
        tableView.register(UINib(nibName: "OfertaViagemTableViewCell", bundle: nil),
                                  forCellReuseIdentifier: "OfertaViagemTableViewCell")
    }
    
}

//MARK: UITableViewDataSource
extension HomeTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viagens.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viagens[section].numeroDeLinhas
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let viagens = self.viagens[indexPath.section]
        
        switch viagens.tipo {
        case .destaques:
            
            guard let celulaDestaques = tableView.dequeueReusableCell(withIdentifier: "DestaquesViagemTableViewCell") as? DestaquesViagemTableViewCell else {
                fatalError("error to create destaques cell")
            }
            celulaDestaques.configuraCelula(viagens.viagens[indexPath.row], coordinator: self.coordinator)
            
            return celulaDestaques
            
        case .ofertas:
            
            guard let celulaOfertas = tableView.dequeueReusableCell(withIdentifier: "OfertaViagemTableViewCell") as? OfertaViagemTableViewCell else {
                fatalError("error to create oferta cell")
            }
            celulaOfertas.configuraCelula(viagens.viagens, coordinator: self.coordinator)
            
            return celulaOfertas
        
        default:
            return UITableViewCell()
            
        }
    }
}

//MARK: UITableViewDelegate
extension HomeTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            
            let headerView = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: self, options: nil)?.first as? HomeTableViewHeader
            headerView?.configuraHeader()
            
            return headerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 300
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 400 : 475
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
    
}
