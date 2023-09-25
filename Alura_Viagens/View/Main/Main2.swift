//
//  Main2.swift
//  Alura_Viagens
//
//  Created by Wagner Duarte on 21/09/23.
//

import UIKit

class Main2: UIViewController, Coordinating {
   
    //MARK: Atributtes
    var coordinator: Coordinator?
    
    @IBOutlet weak var viagensTableView: UITableView!
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 30.0/255.0, green: 59.0/255.0, blue: 119.0/255.0, alpha: 1)
        setUpViagensTableView()
    }
}

//MARK: Layout Config
extension Main2 {
    
    func setUpViagensTableView(){
        viagensTableView.delegate = self
        viagensTableView.dataSource = self
        viagensTableView.register(UINib(nibName: "DestaquesViagemTableViewCell", bundle: nil),forCellReuseIdentifier: "DestaquesViagemTableViewCell")
        viagensTableView.register(UINib(nibName: "OfertaViagemTableViewCell", bundle: nil), forCellReuseIdentifier: "OfertaViagemTableViewCell")
    }
}

//MARK: UITableViewDataSource
extension Main2: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sessaoDeViagens?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessaoDeViagens?[section].numeroDeLinhas ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let viewModel = sessaoDeViagens?[indexPath.section] as? ViagemViewModel else {
            fatalError("error to create cell")
        }
        
        switch viewModel.tipo {
        case .destaques:
            
            guard let celulaDestaques = tableView.dequeueReusableCell(withIdentifier: "DestaquesViagemTableViewCell") as? DestaquesViagemTableViewCell else {
                fatalError("error to create cell")
            }
            
            celulaDestaques.configuraCelula(viewModel.viagens[indexPath.row], coordinator: self.coordinator)
            
            return celulaDestaques
            
        case .ofertas:
            
            guard let celulaOfertas = tableView.dequeueReusableCell(withIdentifier: "OfertaViagemTableViewCell") as? OfertaViagemTableViewCell else {
                fatalError("error to create oferta cell")
            }
            
            celulaOfertas.configuraCelula(viewModel.viagens, coordinator: self.coordinator)
            
            return celulaOfertas
        
        default:
            return UITableViewCell()
            
        }
    }
}

//MARK: UITableViewDelegate
extension Main2: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            
            let headerView = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: self, options: nil)?.first as? HomeTableViewHeader
            headerView?.configuraView()
            
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        /*guard let viewModel = sessaoDeViagens?[indexPath.section] as? ViagemViewModel else {
            fatalError("error to create cell")
        }
        
        switch viewModel.tipo {
        case .destaques, .internacionais:
            
            let viagemSelecionada = viewModel.viagens[indexPath.row]
            let detailsCoordinator = DetailsCoordinator(childCoordinators: [], navigationController: coordinator?.navigationController ?? UINavigationController(), viagem: viagemSelecionada, parentCoordinators: self.coordinator)
            coordinator?.eventOccurred(with: .goToTripDetailsScreen, of: detailsCoordinator)
        default:
            break
        }*/
    }
}
