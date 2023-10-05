//
//  Main2.swift
//  Alura_Viagens
//
//  Created by Wagner Duarte on 21/09/23.
//

//Oq é melhor? Manter as viagens aqui ou na TableViewController?

import UIKit

class HomeViewController: UIViewController, Coordinating {
   
    //MARK: Atributtes
    var coordinator: Coordinator?
    var tableViewController: HomeTableViewController?
    
    let viagens: [ViagemViewModel] = getSessaoDeViagens()
    
    //MARK: IBOutlets
    @IBOutlet weak var viagensTableView: UITableView!
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewController = HomeTableViewController(viagens: viagens)
        tableViewController!.coordinator = self.coordinator // !
        tableViewController?.setUpViagensTableView(tableView: viagensTableView)
    }
}
