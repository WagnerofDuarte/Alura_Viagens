//
//  OfertasViagensCollectionViewCell.swift
//  Alura_Viagens
//
//  Created by dtiDigital on 10/10/23.
//

import UIKit

protocol OfertasViagensCollectionViewCellDelegate: AnyObject{
    func ofertasViagemCollectionViewCellDidTap(_: OfertasViagensCollectionViewCell, viagem: Viagem)
}

class OfertasViagensCollectionViewCell: UICollectionViewCell {
    
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
    
    //MARK: Initializer
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Layout Methods
    func configuraCelula(_ viagem: Viagem?, delegate: OfertasViagensCollectionViewCellDelegate?){
        
        self.viagem = viagem
        self.delegate = delegate
        
        guard let viagem = viagem else { return }
        
        viagemImage.image = UIImage(named: viagem.asset)
        tituloViagemLabel.text = viagem.titulo
        subtituloViagemLabel.text = viagem.subtitulo
        precoSemDescontoLabel.text = "Á Partir de R$ \(viagem.precoSemDesconto)"
        precoLabel.text = "R$ \(viagem.preco)"
        
        fundoView.addSombra()
        fundoView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viagemOfertaCellTapped(_:))))
        
    }
    
    @objc func viagemOfertaCellTapped(_ sender: UITapGestureRecognizer) {
        guard let viagem = viagem else { return }
        delegate?.ofertasViagemCollectionViewCellDidTap(self, viagem: viagem)
    }
}
