//
//  Coordinator.swift
//  CoordinatorPattern
//
//  Created by Wagner Duarte on 19/09/23.
//

import Foundation
import UIKit

enum Event {
    case goToTripDetailsScreen
}

protocol Coordinator {
    
    var navigationController: UINavigationController { get set }
    var parentCoordinators: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
    
    func eventOccurred(with type: Event, of nextCoordinator: Coordinator)
    func start()
    func end()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
