//
//  ViagemTableViewCell.swift
//  Alura_Viagens
//
//  Created by Wagner Duarte on 04/09/23.
//

import UIKit

class DestaquesViagemTableViewCell: UITableViewCell, Coordinating {
    
    //MARK: - Atributes
    var coordinator: Coordinator?
    var viagem: Viagem?
    
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
    func configuraCelula(_ viagem: Viagem?, coordinator: Coordinator?) {
        
        self.coordinator = coordinator
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
        
        backgroundViewCell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didSelectedView(_:))))
        
        DispatchQueue.main.async {
            self.backgroundViewCell.addSombra()
        }
        
    }
    
    //MARK: - Actions
    @objc func didSelectedView(_ gesture: UIGestureRecognizer){
        
        guard let viagemSelecionada = viagem else { return }
        
        let detailsCoordinator = DetailsCoordinator(childCoordinators: [], navigationController: coordinator?.navigationController ?? UINavigationController(), viagem: viagemSelecionada, parentCoordinators: self.coordinator)
        
        coordinator?.eventOccurred(with: .goToTripDetailsScreen, of: detailsCoordinator)
        
    }
    
}
