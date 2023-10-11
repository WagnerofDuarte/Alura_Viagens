//
//  ViagemTableViewCell.swift
//  Alura_Viagens
//
//  Created by Wagner Duarte on 04/09/23.
//

import UIKit

//MARK: DestaquesViagemTableViewCellDelegate
protocol DestaquesViagemTableViewCellDelegate: AnyObject {
    func destaquesViagemTableViewCellDidTap(_: DestaquesViagemTableViewCell, viagem: Viagem)
}

//MARK: Class Definition
class DestaquesViagemTableViewCell: UITableViewCell {
    
    //MARK: - IDs
    static let identifier = UsefulStrings.destaquesViagemTableViewCellIdentifier
    static func nib() -> UINib {
        return UINib(nibName: UsefulStrings.destaquesViagemTableViewCellIdentifier,
                     bundle: nil)
    }
    
    //MARK: - Atributes
    var viagem: Viagem?
    weak var delegate: DestaquesViagemTableViewCellDelegate?
    
    // MARK: - IBOutlets
    @IBOutlet weak var backgroundViewCell: UIView!
    @IBOutlet weak var viagemImage: UIImageView!
    @IBOutlet weak var tituloViagemLabel: UILabel!
    @IBOutlet weak var subtituloViagemLabel: UILabel!
    @IBOutlet weak var diariaViagemLabel: UILabel!
    @IBOutlet weak var precoSemDescontoLabel: UILabel!
    @IBOutlet weak var precoViagemLabel: UILabel!
    @IBOutlet weak var statusCancelamentoViagemLabel: UILabel!
    
    //MARK: - Layout Configuration
    func configureDestaquesViagensTableViewCell(_ viagem: Viagem?, delegate: DestaquesViagemTableViewCellDelegate?) {
        
        self.delegate = delegate
        self.viagem = viagem
        
        guard let viagem = self.viagem else { return }
        
        viagemImage.image = UIImage(named: viagem.asset)
        tituloViagemLabel.text = viagem.titulo
        subtituloViagemLabel.text = viagem.subtitulo
        precoViagemLabel.text = UsefulStrings.appendMoneySignToDouble(viagem.preco, startingAtText: false)
        precoSemDescontoLabel.attributedText = UsefulStrings.addStrikeThroughToDouble(viagem.precoSemDesconto)
        diariaViagemLabel.text = UsefulStrings.numberOfGuestsAndDaysString(days: viagem.diaria, guests: viagem.hospedes)
                
        backgroundViewCell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viagemDestaqueCellTapped(_:))))
            
        DispatchQueue.main.async {
            self.backgroundViewCell.addSombra()
        }
        
    }
    
    //MARK: Action Button
    @objc func viagemDestaqueCellTapped(_ sender: UITapGestureRecognizer) {
        guard let viagem = viagem else { return }
        delegate?.destaquesViagemTableViewCellDidTap(self, viagem: viagem)
    }
}
