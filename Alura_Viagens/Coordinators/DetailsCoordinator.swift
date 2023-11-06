//
//  DetailsCoordinator.swift
//  Alura_Viagens
//
//  Created by Wagner Duarte on 22/09/23.
//

import Foundation
import UIKit

class DetailsCoordinator: Coordinator {
    
    let viagem: Viagem
    var parentCoordinators: Coordinator?
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
        Task {
            var memes = [Memes]()
            do {
                memes = try await MemesAPI.getMemes()
            } catch MemesErrors.invalidData {
                print("Invalid Data")
            } catch MemesErrors.invalidResponse {
                print("Invalid Response")
            } catch MemesErrors.invalidURL {
                print(print("Invalid URL"))
            } catch {
                print("Unespected Error")
            }
            let vc = await DetalhesViewController.instanciar(viagem, memes: memes, delegate: self)
            await navigationController.pushViewController(vc, animated: true)
        }
        navigationController.isNavigationBarHidden = true
    }
    
    func end() {
        _ = parentCoordinators?.childCoordinators.popLast()
        navigationController.popViewController(animated: true)
    }
}

//MARK: DetalhesViewControllerDelegate
extension DetailsCoordinator: DetalhesViewControllerDelegate {
    func detalhesViewControllerBackButtonDidTap(_: DetalhesViewController) {
        self.end()
    }
}
