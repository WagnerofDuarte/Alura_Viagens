//
//  MainCoordinator.swift
//  CoordinatorPattern
//
//  Created by Wagner Duarte on 19/09/23.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    
    func eventOccurred(with type: Event) {
        
    }
    
    func start() {
        let vc = ViewController()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)
    }
}
