//
//  Coordinator.swift
//  CoordinatorPattern
//
//  Created by Wagner Duarte on 19/09/23.
//

import Foundation
import UIKit

enum Event {
    case buttonTapped
}

protocol Coordinator {
    
    var navigationController: UINavigationController? { get set }
    
    func eventOccurred(with type: Event)
    func start()
}


protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
