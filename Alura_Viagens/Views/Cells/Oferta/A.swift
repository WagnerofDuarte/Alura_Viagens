//
//  OfertaTableViewCell.swift
//  Alura_Viagens
//
//  Created by Wagner Duarte on 05/09/23.
//

import UIKit

class OfertaViagemCollectionViewCell: UITableViewCell{
    
    //MARK: - Atributes
    private var viagem: Viagem?
    
    //MARK: - IBOutlets
    @IBOutlet weak var viagemImage: UIImageView!
    @IBOutlet weak var tituloViagemLabel: UILabel!
    @IBOutlet weak var subtituloViagemLabel: UILabel!
    @IBOutlet weak var precoSemDescontoLabel: UILabel!
    @IBOutlet weak var precoLabel: UILabel!
    @IBOutlet weak var fundoView: UIView!
    
    // MARK: - Layout Methods
    func configuraCelula(_ viagem: Viagem?){
        
        self.viagem = viagem
        guard let viagem = viagem else { return }
        
        viagemImage.image = UIImage(named: viagem.asset)
        tituloViagemLabel.text = viagem.titulo
        subtituloViagemLabel.text = viagem.subtitulo
        precoSemDescontoLabel.text = "Á Partir de R$ \(viagem.precoSemDesconto)"
        precoLabel.text = "R$ \(viagem.preco)"
        
        fundoView.addSombra()
        //fundoView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(<#T##@objc method#>)))
        
    }
    
    /*func setOutlets(_ index: Int, viagem: Viagem) {
        
        let imageOutlet = viagemImages[index]
        imageOutlet.image = UIImage(named: viagem.asset)
        
        let tituloOutlet = tituloViagensLabels[index]
        tituloOutlet.text = viagem.titulo
        
        let subtituloOutlet = subtituloViagemLabels[index]
        subtituloOutlet.text = viagem.subtitulo
        
        let precoSemDescontoOutlet = precoSemDescontoLabels[index]
        precoSemDescontoOutlet.text = "A partir de R$ \(viagem.precoSemDesconto)"
        
        let precoOutlet = precoLabels[index]
        precoOutlet.text = "R$ \(viagem.preco)"
    }*/
    
    //MARK: Actions
    /*@objc func didSelectedView(_ gesture: UIGestureRecognizer){
        
        if let selectedView = gesture.view  {
            
            guard let viagemSelecionada = viagens?[selectedView.tag] else { return }
            
            let detailsCoordinator = DetailsCoordinator(childCoordinators: [], navigationController: coordinator?.navigationController ?? UINavigationController(), viagem: viagemSelecionada, parentCoordinators: self.coordinator)
            
            coordinator?.eventOccurred(with: .goToTripDetailsScreen, of: detailsCoordinator)
        }
    }*/
    
    /*@objc func viagemDestaqueCellTapped(_ sender: UITapGestureRecognizer) {
        guard let viagem = viagem else { return }
        //delegate?.destaquesViagemTableViewCellDidTap(self, viagem: viagem)
    }*/
}
