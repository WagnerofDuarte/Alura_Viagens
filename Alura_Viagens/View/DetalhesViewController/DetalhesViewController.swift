//
//  DetalhesViewController.swift
//  Alura_Viagens
//
//  Created by Wagner Duarte on 06/09/23.
//

import UIKit

class DetalhesViewController: UIViewController, Coordinating {
    
    var coordinator: Coordinator?
    
    //MARK: - IBOutlets
    @IBOutlet weak var tituloViagemLabel: UILabel!
    @IBOutlet weak var subtituloViagemLabel: UILabel!
    @IBOutlet weak var viagemImage: UIImageView!
    @IBOutlet weak var diariaViagemLabl: UILabel!
    @IBOutlet weak var precoSemDescontoViagemLabel: UILabel!
    @IBOutlet weak var precoViagemLabel: UILabel!
    
    //MARK: - Atributos
    var viagem: Viagem?
    
    //MARK: - View Life cycle
    class func instanciar(_ viagem: Viagem?) -> DetalhesViewController {
        let detalhesViewController = DetalhesViewController(nibName: String(describing: self), bundle: nil)
        detalhesViewController.viagem = viagem
        return detalhesViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraView()
    }
    
    //MARK: - Layout Configuration
    func configuraView(){
        viagemImage.image = UIImage(named: viagem?.asset ?? "")
        tituloViagemLabel.text = viagem?.titulo ?? ""
        subtituloViagemLabel.text = viagem?.subtitulo ?? ""
        precoViagemLabel.text = "R$ \(viagem?.preco ?? 0)"
        
        let atributoString: NSMutableAttributedString = NSMutableAttributedString(string: "R$ \(viagem?.precoSemDesconto ?? 0)")
        atributoString.addAttribute(NSAttributedString.Key.strikethroughStyle,value: 1, range: NSMakeRange(0, atributoString.length))
        precoSemDescontoViagemLabel.attributedText = atributoString
        
        if let numeroDeDias = viagem?.diaria, let numeroDeHospedes = viagem? .hospedes {
            let diarias = numeroDeDias == 1 ? "Diária" : "Diárias"
            let hospedes = numeroDeHospedes == 1 ? "Pessoa" : "Pessoas"
            diariaViagemLabl.text = "\(numeroDeDias) \(diarias) - \(numeroDeHospedes) \(hospedes) "
        }
    }
    
    //MARK: - Actions
    @IBAction func backButton(_ sender: UIButton) {
        coordinator?.end()
    }
    
}
