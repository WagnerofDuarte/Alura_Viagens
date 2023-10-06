//
//  OfertaTableViewCell.swift
//  Alura_Viagens
//
//  Created by Wagner Duarte on 05/09/23.
//

import UIKit

class OfertaViagemTableViewCell: UITableViewCell{
    
    //MARK: - Atributes
    private var viagens: [Viagem]?
    
    // MARK: - IBOutlets
    @IBOutlet var viagemImages: [UIImageView]!
    @IBOutlet var tituloViagensLabels: [UILabel]!
    @IBOutlet var subtituloViagemLabels: [UILabel]!
    @IBOutlet var precoSemDescontoLabels: [UILabel]!
    @IBOutlet var precoLabels: [UILabel]!
    @IBOutlet var fundoViews: [UIView]!
    
    // MARK: - Layout Methods
    func configuraCelula(_ viagens: [Viagem]?, coordinator: Coordinator?){
        
        self.viagens = viagens
        
        guard let listaDeViagem = viagens else { return }
        
        print(listaDeViagem.count)
        
        for i in 0..<listaDeViagem.count  {
            setOutlets(i, viagem: listaDeViagem[i])
        }
        
        fundoViews.forEach{ viewAtual in
            //viewAtual.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didSelectedView(_:))))
            viewAtual.addSombra()
        }
    }
    
    func setOutlets(_ index: Int, viagem: Viagem) {
        
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
    }
    
    //MARK: Actions
    /*@objc func didSelectedView(_ gesture: UIGestureRecognizer){
        
        if let selectedView = gesture.view  {
            
            guard let viagemSelecionada = viagens?[selectedView.tag] else { return }
            
            let detailsCoordinator = DetailsCoordinator(childCoordinators: [], navigationController: coordinator?.navigationController ?? UINavigationController(), viagem: viagemSelecionada, parentCoordinators: self.coordinator)
            
            coordinator?.eventOccurred(with: .goToTripDetailsScreen, of: detailsCoordinator)
        }
    }*/
}
