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

//MARK: HomeViewControllerDelegate
extension MainCoordinator: HomeViewControllerDelegate {
    
    func homeViewControllerDidTap(_: HomeViewController, viagem: Viagem) {
        let detailsCoordinator = DetailsCoordinator(childCoordinators: [],
                                                    navigationController: self.navigationController,
                                                    viagem: viagem,
                                                    parentCoordinators: self)
        Task {
            do {
                var memes = [Memes]()
                memes = try await getMemes().data.memes
                print(memes)
            } catch MemesErrors.invalidData {
                print("Invalid Data")
            } catch MemesErrors.invalidResponse {
                print("Invalid Response")
            } catch MemesErrors.invalidURL {
                print(print("Invalid URL"))
            } catch {
                print("Unespected Error")
            }
        }
        self.eventOccurred(with: .goToTripDetailsScreen, of: detailsCoordinator)
    }
}

func getMemes() async throws -> ResponseData {
    
    let endpoint = "https://api.imgflip.com/get_memes"
    
    guard let url = URL(string: endpoint) else {
        throw MemesErrors.invalidURL
    }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        throw MemesErrors.invalidResponse
    }
    
    do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(ResponseData.self, from: data)
    } catch {
        throw MemesErrors.invalidData
    }
    
}
