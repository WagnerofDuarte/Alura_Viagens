//
//  DetailsCoordinator.swift
//  Alura_Viagens
//
//  Created by Wagner Duarte on 22/09/23.
//

import Foundation
import UIKit

class DetailsCoordinator: Coordinator {
    
    var parentCoordinators: Coordinator?
    let viagem: Viagem
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator]
    
    init(childCoordinators: [Coordinator], navigationController: UINavigationController, viagem: Viagem, parentCoordinators: Coordinator?) {
        
        self.childCoordinators = childCoordinators
        self.navigationController = navigationController
        self.viagem = viagem
        self.parentCoordinators = parentCoordinators
    }
    
    func eventOccurred(with type: Event, of coordinator: Coordinator) {}
    
    func start() {
        let vc = DetalhesViewController.instanciar(viagem)
        vc.coordinator = self
        navigationController.isNavigationBarHidden = true
        navigationController.pushViewController(vc, animated: true)
    }
    
    func end() {
        parentCoordinators?.childCoordinators.popLast()
        navigationController.popViewController(animated: true)
    }
}
