//
//  Main2.swift
//  Alura_Viagens
//
//  Created by Wagner Duarte on 21/09/23.
//

//Oq é melhor? Manter as viagens aqui ou na TableViewController?

import UIKit

//MARK: HomeViewControllerDelegate
protocol HomeViewControllerDelegate: AnyObject {
    func homeViewControllerDidTap(_: HomeViewController, viagem: Viagem)
}

//MARK: Class Definition
class HomeViewController: UIViewController {
   
    //MARK: Atributtes
    var delegate: HomeViewControllerDelegate?
    var tableController: HomeTableController?
    let viagens: [ViagemViewModel] = getSessaoDeViagens()
    
    //MARK: IBOutlets
    @IBOutlet weak var viagensTableView: UITableView!
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableController?.setUpViagensTableView(tableView: viagensTableView)
    }
    
    func configureHomeViewController(delegate: HomeViewControllerDelegate?){
        self.delegate = delegate
        self.tableController = HomeTableController(viagens: viagens, delegate: self)
    }
}

//MARK: HomeTableControllerDelegate
extension HomeViewController: HomeTableControllerDelegate {
    func homeTableControllerDidTap(_: HomeTableController, viagem: Viagem) {
        delegate?.homeViewControllerDidTap(self, viagem: viagem)
    }
}
