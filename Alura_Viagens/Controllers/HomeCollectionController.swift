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
    var viagens = [Viagem]()
    
    //MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: Initializer
    func configure(delegate: HomeCollectionControllerDelegate?, viagens: [Viagem]) {
        self.delegate = delegate
        self.viagens = viagens
        collectionView.register(OfertasViagensCollectionViewCell.nib(), forCellWithReuseIdentifier: OfertasViagensCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension HomeCollectionController: UICollectionViewDelegate {
    
}

extension HomeCollectionController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: OfertasViagensCollectionViewCell.identifier, for: indexPath) as! OfertasViagensCollectionViewCell
        collectionViewCell.configuraCelula(self.viagens[indexPath.row], delegate: self)
        return collectionViewCell
    }
}

extension HomeCollectionController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 175.0, height: 343.0)
    }
}

extension HomeCollectionController: OfertasViagensCollectionViewCellDelegate {
    func ofertasViagemCollectionViewCellDidTap(_: OfertasViagensCollectionViewCell, viagem: Viagem) {
        delegate?.homeCollectionControllerDidTap(self, viagem: viagem)
    }
}
