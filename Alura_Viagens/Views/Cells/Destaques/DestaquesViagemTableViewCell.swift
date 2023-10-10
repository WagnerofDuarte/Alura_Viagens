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

class DestaquesViagemTableViewCell: UITableViewCell {
    
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
    func configuraCelula(_ viagem: Viagem?, delegate: DestaquesViagemTableViewCellDelegate?) {
        
        self.delegate = delegate
        self.viagem = viagem
        
        viagemImage.image = UIImage(named: viagem?.asset ?? "")
        tituloViagemLabel.text = viagem?.titulo ?? ""
        subtituloViagemLabel.text = viagem?.subtitulo ?? ""
        precoViagemLabel.text = "R$ \(viagem?.preco ?? 0)"
        
        let atributoString: NSMutableAttributedString = NSMutableAttributedString(string: "R$ \(viagem?.precoSemDesconto ?? 0)")
        atributoString.addAttribute(NSAttributedString.Key.strikethroughStyle,value: 1, range: NSMakeRange(0, atributoString.length))
        precoSemDescontoLabel.attributedText = atributoString
        
        if let numeroDeDias = viagem?.diaria, let numeroDeHospedes = viagem?.hospedes {
            let diarias = numeroDeDias == 1 ? "Diária" : "Diárias"
            let hospedes = numeroDeHospedes == 1 ? "Pessoa" : "Pessoas"
            diariaViagemLabel.text = "\(numeroDeDias) \(diarias) - \(numeroDeHospedes) \(hospedes) "
        }
        
        backgroundViewCell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viagemDestaqueCellTapped(_:))))
            
        DispatchQueue.main.async {
            self.backgroundViewCell.addSombra()
        }
        
    }
    
    @objc func viagemDestaqueCellTapped(_ sender: UITapGestureRecognizer) {
        guard let viagem = viagem else { return }
        delegate?.destaquesViagemTableViewCellDidTap(self, viagem: viagem)
    }
}
