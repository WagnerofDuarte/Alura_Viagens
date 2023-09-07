//
//  OfertaTableViewCell.swift
//  Alura_Viagens
//
//  Created by Wagner Duarte on 05/09/23.
//

import UIKit

protocol OfertaTableViewCellDelegate: AnyObject{
    func didSelectedView(_ viagem: Viagem?)
}

class OfertaTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet var viagemImages: [UIImageView]!
    @IBOutlet var tituloViagensLabels: [UILabel]!
    @IBOutlet var subtituloViagemLabels: [UILabel]!
    @IBOutlet var precoSemDescontoLabels: [UILabel]!
    @IBOutlet var precoLabels: [UILabel]!
    @IBOutlet var fundoViews: [UIView]!
    
    //MARK: - Atributes
    private var viagens: [Viagem]?
    weak var delegate: OfertaTableViewCellDelegate?
    
    // MARK: - Layout Methods
    func configuraCelula(_ viagens: [Viagem]?){
        self.viagens = viagens
        guard let listaDeViagem = viagens else { return }
        for i in 0..<listaDeViagem.count  {
            setOutlets(i, viagem: listaDeViagem[i])
        }
        fundoViews.forEach{ viewAtual in
            viewAtual.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didSelectedView(_:))))
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
    
    @objc func didSelectedView(_ gesture: UIGestureRecognizer){
        
        if let selectedView = gesture.view  {
            let viagemSelecionada = viagens?[selectedView.tag]
            delegate?.didSelectedView(viagemSelecionada)
        }
        
        
    }
    
}
