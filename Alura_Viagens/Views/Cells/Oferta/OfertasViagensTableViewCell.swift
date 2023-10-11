//
//  OfertasViagensTableViewCell.swift
//  Alura_Viagens
//
//  Created by Wagner Duarte on 11/10/23.
//

import UIKit

//MARK: OfertasViagensTableViewCellDelegate
protocol OfertasViagensTableViewCellDelegate: AnyObject {
    func ofertasViagensTableViewCellDidTap(_: OfertasViagensTableViewCell, viagem: Viagem)
}

//MARK: Class Definition
class OfertasViagensTableViewCell: UITableViewCell {
    
    //MARK: - IDs
    static let identifier = UsefulStrings.ofertasViagensTableViewCellIdentifier
    static func nib() -> UINib {
        return UINib(nibName: UsefulStrings.ofertasViagensTableViewCellIdentifier,
                     bundle: nil)
    }
    
    //MARK: - Atributes
    var collectionViewController: HomeCollectionController?
    var delegate: OfertasViagensTableViewCellDelegate?

    //MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: Layou Config
    func configureOfertasViagensTableViewCell(_ delegate: OfertasViagensTableViewCellDelegate, viagens: [Viagem]) {
        self.delegate = delegate
        self.collectionViewController = HomeCollectionController(viagens: viagens, delegate: self)
        self.collectionViewController?.setUpViagensCollectionView(collectionView: self.collectionView)
    }
}

//MARK: Extension - HomeCollectionControllerDelegate
extension OfertasViagensTableViewCell: HomeCollectionControllerDelegate {
    func homeCollectionControllerDidTap(_: HomeCollectionController, viagem: Viagem) {
        delegate?.ofertasViagensTableViewCellDidTap(self, viagem: viagem)
    }
}
