//
//  Main2.swift
//  Alura_Viagens
//
//  Created by Wagner Duarte on 21/09/23.
//

import UIKit

class HomeViewController: UIViewController, Coordinating {
   
    //MARK: Atributtes
    var coordinator: Coordinator?
    let viagens = getSessaoDeViagens()
    
    //MARK: IBOutlets
    @IBOutlet weak var viagensTableView: UITableView!
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViagensTableView()
    }
    
    //MARK: Layout Configuration
    func setUpViagensTableView(){
        
        viagensTableView.delegate = self
        viagensTableView.dataSource = self
        viagensTableView.register(UINib(nibName: "DestaquesViagemTableViewCell", bundle: nil),
                                  forCellReuseIdentifier: "DestaquesViagemTableViewCell")
        viagensTableView.register(UINib(nibName: "OfertaViagemTableViewCell", bundle: nil),
                                  forCellReuseIdentifier: "OfertaViagemTableViewCell")
    }
}

//MARK: UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
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
extension HomeViewController: UITableViewDelegate {
    
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
    
}
