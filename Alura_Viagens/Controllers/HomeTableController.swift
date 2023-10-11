//
//  ObjectDataSource.swift
//  Alura_Viagens
//
//  Created by dtiDigital on 05/10/23.
//

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
    
    //MARK: Initializer
    init(viagens: [ViagemViewModel], delegate: HomeTableControllerDelegate?) {
        self.delegate = delegate
        self.viagens = viagens
    }
    
    //MARK: TableView setUp
    func setUpViagensTableView(tableView: UITableView){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: DestaquesViagemTableViewCell.identifier, bundle: nil),
                                  forCellReuseIdentifier: DestaquesViagemTableViewCell.identifier)
        tableView.register(UINib(nibName: OfertasViagensTableViewCell.identifier, bundle: nil),
                                  forCellReuseIdentifier: OfertasViagensTableViewCell.identifier)
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
            
            guard let celulaDestaques = tableView.dequeueReusableCell(withIdentifier: DestaquesViagemTableViewCell.identifier) as? DestaquesViagemTableViewCell else {
                fatalError(UsefulStrings.errorToLoadTableViewCell)
            }
            celulaDestaques.configureDestaquesViagensTableViewCell(viagens.viagens[indexPath.row], delegate: self)
            
            return celulaDestaques
            
        case .ofertas:
            
            guard let celulaOfertas = tableView.dequeueReusableCell(withIdentifier: OfertasViagensTableViewCell.identifier) as? OfertasViagensTableViewCell else {
                fatalError(UsefulStrings.errorToLoadTableViewCell)
            }
            celulaOfertas.configureOfertasViagensTableViewCell(self, viagens: viagens.viagens)
    
            return celulaOfertas
            
        case .internacionais:
            
            return UITableViewCell()

        }
    }
}

//MARK: UITableViewDelegate
extension HomeTableController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            
            let headerView = Bundle.main.loadNibNamed(HomeTableViewHeader.identifier, owner: self, options: nil)?.first as? HomeTableViewHeader
            headerView?.configuraHeader()
            
            return headerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 300
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 400 : 475
    }
}

//MARK: DestaquesViagemTableViewCellDelegate
extension HomeTableController: DestaquesViagemTableViewCellDelegate {
    func destaquesViagemTableViewCellDidTap(_: DestaquesViagemTableViewCell, viagem: Viagem) {
        delegate?.homeTableControllerDidTap(self, viagem: viagem)
    }
}

//MARK: HomeCollectionControllerDelegate
extension HomeTableController: OfertasViagensTableViewCellDelegate {
    func ofertasViagensTableViewCellDidTap(_: OfertasViagensTableViewCell, viagem: Viagem) {
        delegate?.homeTableControllerDidTap(self, viagem: viagem)
    }
}
