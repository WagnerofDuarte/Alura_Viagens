//
//  ObjectDataSource.swift
//  Alura_Viagens
//
//  Created by dtiDigital on 05/10/23.
//

//Remover os coordninators deste arquivo

import UIKit

//MARK: HomeTableControllerDelegate
protocol HomeTableControllerDelegate: AnyObject {
    func homeTableControllerDidTap(_: HomeTableController, viagem: Viagem)
}

//MARK: Class Definition
class HomeTableController: NSObject{
    
    //MARK: Atributes
    weak var delegate: HomeTableControllerDelegate?
    let viagens: [ViagemViewModel]
    
    //MARK: Inicializer
    init(viagens: [ViagemViewModel], delegate: HomeTableControllerDelegate?) {
        self.delegate = delegate
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
extension HomeTableController: UITableViewDataSource {
    
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
            celulaDestaques.configuraCelula(viagens.viagens[indexPath.row], delegate: self)
            
            return celulaDestaques
            
        case .ofertas: // Criar uma collection view para armazenar cada celula de ofertas
            
            /*guard let celulaOfertas = tableView.dequeueReusableCell(withIdentifier: "OfertaViagemTableViewCell") as? OfertaViagemTableViewCell else {
                fatalError("error to create oferta cell")
            }
            celulaOfertas.configuraCelula(viagens.viagens, coordinator: self.coordinator)*/
            
            return UITableViewCell()
            
        case .internacionais:
            
            return UITableViewCell()

        }
    }
}

//MARK: UITableViewDelegate
extension HomeTableController: UITableViewDelegate {
    
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
        
        switch indexPath.section {
        case 0: //Destaques
            print(viagens)
        case 1: //Ofertas
            print("Ofertas")
        default:
            print("Nada")
        }
    }
}

//MARK: DestaquesViagemTableViewCellDelegate
extension HomeTableController: DestaquesViagemTableViewCellDelegate {

    func destaquesViagemTableViewCellDidTap(_: DestaquesViagemTableViewCell, viagem: Viagem) {
        delegate?.homeTableControllerDidTap(self, viagem: viagem)
    }
}
