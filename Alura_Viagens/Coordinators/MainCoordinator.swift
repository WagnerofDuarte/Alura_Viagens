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
            childCoordinators.last?.start()
        }
    }
    
    func start() {
        let vc = Main2()
        vc.coordinator = self
        navigationController.isNavigationBarHidden = true
        navigationController.setViewControllers([vc], animated: false)
    }
    
    func end() {}
}
