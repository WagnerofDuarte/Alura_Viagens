//
//  DetalhesViewController.swift
//  Alura_Viagens
//
//  Created by Wagner Duarte on 06/09/23.
//

import UIKit

//MARK: DetalhesViewControllerDelegate
protocol DetalhesViewControllerDelegate {
    func detalhesViewControllerBackButtonDidTap(_: DetalhesViewController)
}

//MARK: Class Definition
class DetalhesViewController: UIViewController {
    
    //MARK: - Atributos
    var viagem: Viagem?
    var delegate: DetalhesViewControllerDelegate?
    
    //MARK: - IBOutlets
    @IBOutlet weak var tituloViagemLabel: UILabel!
    @IBOutlet weak var subtituloViagemLabel: UILabel!
    @IBOutlet weak var viagemImage: UIImageView!
    @IBOutlet weak var diariaViagemLabl: UILabel!
    @IBOutlet weak var precoSemDescontoViagemLabel: UILabel!
    @IBOutlet weak var precoViagemLabel: UILabel!
    
    //MARK: - Initializer
    class func instanciar(_ viagem: Viagem?, delegate: DetalhesViewControllerDelegate?) -> DetalhesViewController {
        let detalhesViewController = DetalhesViewController(nibName: String(describing: self), bundle: nil)
        detalhesViewController.viagem = viagem
        detalhesViewController.delegate = delegate
        return detalhesViewController
    }
    
    //MARK: - View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraView()
    }
    
    //MARK: - Layout Configuration
    func configuraView(){
        
        guard let viagem = self.viagem else { return }
        
        viagemImage.image = UIImage(named: viagem.asset)
        tituloViagemLabel.text = viagem.titulo
        subtituloViagemLabel.text = viagem.subtitulo
        precoViagemLabel.text = UsefulStrings.appendMoneySignToDouble(viagem.preco, startingAtText: false)
        precoSemDescontoViagemLabel.attributedText = UsefulStrings.addStrikeThroughToDouble(viagem.precoSemDesconto)
        diariaViagemLabl.text = UsefulStrings.numberOfGuestsAndDaysString(days: viagem.diaria, guests: viagem.hospedes)
        
    }
    
    //MARK: - Actions
    @IBAction func backButton(_ sender: UIButton) {
        delegate?.detalhesViewControllerBackButtonDidTap(self)
    }
    
    @IBAction func continueButton(_ sender: UIButton) {
        // Vai pra tela de comprar
    }
}
