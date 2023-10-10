//
//  HomeCollectionController.swift
//  Alura_Viagens
//
//  Created by dtiDigital on 10/10/23.
//

import UIKit

//MARK: HomeCollectionControllerDelegate
protocol HomeCollectionControllerDelegate: AnyObject {
    func homeCollectionControllerDidTap(_: HomeCollectionController, viagem: Viagem)
}

class HomeCollectionController: UITableViewCell {
    
    //MARK: Atributes
    weak var delegate: HomeCollectionControllerDelegate?
    var viagens: [Viagem]?
    
    //MARK: Initializer
    func configure(delegate: HomeCollectionControllerDelegate? = nil, viagens: [Viagem]?) {
        self.delegate = delegate
        self.viagens = viagens
    }
}

extension HomeCollectionController: UICollectionViewDelegate {
    
}

extension HomeCollectionController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viagens = self.viagens else { fatalError() }
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: OfertasViagensCollectionViewCell.identifier, for: indexPath) as! OfertasViagensCollectionViewCell
        collectionViewCell.configuraCelula(viagens[indexPath.row], delegate: self)
        return collectionViewCell
    }
}

extension HomeCollectionController: UICollectionViewDelegateFlowLayout {
    
}

extension HomeCollectionController: OfertasViagensCollectionViewCellDelegate {
    func ofertasViagemCollectionViewCellDidTap(_: OfertasViagensCollectionViewCell, viagem: Viagem) {
        delegate?.homeCollectionControllerDidTap(self, viagem: viagem)
    }
}
