//
//  MainCoordinator.swift
//  CoordinatorPattern
//
//  Created by Wagner Duarte on 19/09/23.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var parentCoordinators: Coordinator?
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    
    
    init(childCoordinators: [Coordinator], navigationController: UINavigationController, parentCoordinators: Coordinator?) {
        self.childCoordinators = childCoordinators
        self.navigationController = navigationController
        self.parentCoordinators = parentCoordinators
    }
    
    func eventOccurred(with type: Event, of nextCoordinator: Coordinator) {
        switch type {
        case .goToTripDetailsScreen:
            childCoordinators.append(nextCoordinator)
            nextCoordinator.start()
        }
    }
    
    func start() {
        let vc = HomeViewController()
        vc.configureHomeViewController(delegate: self)
        navigationController.isNavigationBarHidden = true
        navigationController.setViewControllers([vc], animated: false)
    }
    
    func end() {}
}

extension MainCoordinator: HomeViewControllerDelegate {
    
    func homeViewControllerDidTap(_: HomeViewController, viagem: Viagem) {
        let detailsCoordinator = DetailsCoordinator(childCoordinators: [],
                                                    navigationController: self.navigationController,
                                                    viagem: viagem,
                                                    parentCoordinators: self)
        self.eventOccurred(with: .goToTripDetailsScreen, of: detailsCoordinator)
    }
}
