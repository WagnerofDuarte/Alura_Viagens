//
//  ViewController.swift
//  Alura_Viagens
//
//  Created by Wagner Duarte on 04/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var viagensTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraTableView()
        view.backgroundColor = UIColor(red: 30.0/255.0, green: 59.0/255.0, blue: 119.0/255.0, alpha: 1)
    }
}

//MARK: - Extension - Layout Configuration methods
extension ViewController {
    
    func configuraTableView(){
        viagensTableView.register(UINib(nibName: "ViagemTableViewCell", bundle: nil), forCellReuseIdentifier: "ViagemTableViewCell")
        viagensTableView.register(UINib(nibName: "OfertaTableViewCell", bundle: nil), forCellReuseIdentifier: "OfertaTableViewCell")
        viagensTableView.dataSource = self
        viagensTableView.delegate = self
    }
    
}

//MARK: - Extension - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sessaoDeViagens?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sessaoDeViagens?[section].numeroDeLinhas ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let viewModel = sessaoDeViagens?[indexPath.section]
        
        switch viewModel?.tipo {
        case .destaques:
            
            guard let celulaDestaques = tableView.dequeueReusableCell(withIdentifier: "ViagemTableViewCell") as? ViagemTableViewCell else {
                fatalError("error to create cell")
            }
            celulaDestaques.configuraCelula(viewModel?.viagens[indexPath.row])
            
            return celulaDestaques
            
        case .ofertas:
            guard let celulaOferta = tableView.dequeueReusableCell(withIdentifier: "OfertaTableViewCell") as? OfertaTableViewCell else {
                fatalError("error to create cell")
            }
            celulaOferta.configuraCelula(viewModel?.viagens)
            return celulaOferta
            
        default:
            return UITableViewCell()
        }
    }
}

//MARK: - Extension - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detalheController = DetalheViewController(nibName: "DetalheViewController", bundle: nil)
        navigationController?.pushViewController(detalheController, animated: true)
    }
    
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
    
}
