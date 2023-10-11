//
//  OfertasViagensCollectionViewCell.swift
//  Alura_Viagens
//
//  Created by dtiDigital on 10/10/23.
//

import UIKit

//MARK: OfertasViagensCollectionViewCellDelegate
protocol OfertasViagensCollectionViewCellDelegate: AnyObject{
    func ofertasViagemCollectionViewCellDidTap(_: OfertasViagensCollectionViewCell, viagem: Viagem)
}

//MARK: Class Definition
class OfertasViagensCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IDs
    static let identifier = UsefulStrings.ofertasViagensCollectionViewCellIdentifier
    static func nib() -> UINib {
        return UINib(nibName: UsefulStrings.ofertasViagensCollectionViewCellIdentifier,
                     bundle: nil)
    }
    
    //MARK: - Atributes
    private var viagem: Viagem?
    weak var delegate: OfertasViagensCollectionViewCellDelegate?
    
    //MARK: - IBOutlets
    @IBOutlet weak var viagemImage: UIImageView!
    @IBOutlet weak var tituloViagemLabel: UILabel!
    @IBOutlet weak var subtituloViagemLabel: UILabel!
    @IBOutlet weak var precoSemDescontoLabel: UILabel!
    @IBOutlet weak var precoLabel: UILabel!
    @IBOutlet weak var fundoView: UIView!
    
    // MARK: - Layout Methods
    func configuraCelula(_ viagem: Viagem?, delegate: OfertasViagensCollectionViewCellDelegate?){
        
        self.viagem = viagem
        self.delegate = delegate
        
        guard let viagem = viagem else { return }
        
        viagemImage.image = UIImage(named: viagem.asset)
        tituloViagemLabel.text = viagem.titulo
        subtituloViagemLabel.text = viagem.subtitulo
        precoSemDescontoLabel.text = UsefulStrings.appendMoneySignToDouble(viagem.precoSemDesconto, startingAtText: true)
        precoLabel.text = UsefulStrings.appendMoneySignToDouble(viagem.preco, startingAtText: false)
    
        fundoView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viagemOfertaCellTapped(_:))))
        DispatchQueue.main.async {
            self.fundoView.addSombra()
        }
    }
    
    //MARK: Action Button
    @objc func viagemOfertaCellTapped(_ sender: UITapGestureRecognizer) {
        guard let viagem = viagem else { return }
        delegate?.ofertasViagemCollectionViewCellDidTap(self, viagem: viagem)
    }
}
