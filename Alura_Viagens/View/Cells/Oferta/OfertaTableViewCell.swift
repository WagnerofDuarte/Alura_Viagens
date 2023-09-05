//
//  OfertaTableViewCell.swift
//  Alura_Viagens
//
//  Created by Wagner Duarte on 05/09/23.
//

import UIKit

class OfertaTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet var viagemImages: [UIImageView]!
    @IBOutlet var tituloViagensLabels: [UILabel]!
    @IBOutlet var subtituloViagemLabels: [UILabel]!
    @IBOutlet var precoSemDescontoLabels: [UILabel]!
    @IBOutlet var precoLabels: [UILabel]!
    @IBOutlet var fundoViews: [UIView]!
    
    //weak var delegate: OfertaTableViewCellDelegate?
    private var viagens: [Viagem]?
    
    // MARK: - Layout Methods
    func configuraCelula(_ viagens: [Viagem]?){
        guard let listaDeViagem = viagens else { return }
        for i in 0..<listaDeViagem.count  {
            setOutlets(i, viagem: listaDeViagem[i])
        }
        fundoViews.forEach{ viewAtual in
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
    
}
