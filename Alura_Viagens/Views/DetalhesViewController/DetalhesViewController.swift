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
    var memes: [Memes]?
    var delegate: DetalhesViewControllerDelegate?
    
    //MARK: - IBOutlets
    @IBOutlet weak var tituloViagemLabel: UILabel!
    @IBOutlet weak var subtituloViagemLabel: UILabel!
    @IBOutlet weak var viagemImage: UIImageView!
    @IBOutlet weak var diariaViagemLabl: UILabel!
    @IBOutlet weak var precoSemDescontoViagemLabel: UILabel!
    @IBOutlet weak var precoViagemLabel: UILabel!
    @IBOutlet var commentsImages: [UIImageView]!
    @IBOutlet var commentsLabel: [UILabel]!
    
    //MARK: - Initializer
    class func instanciar(_ viagem: Viagem?, memes: [Memes]?, delegate: DetalhesViewControllerDelegate?) -> DetalhesViewController {
        let detalhesViewController = DetalhesViewController(nibName: String(describing: self), bundle: nil)
        detalhesViewController.viagem = viagem
        detalhesViewController.delegate = delegate
        detalhesViewController.memes = memes
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
        fetchCommentsData()
        
    }
    
    func fetchCommentsData(){
        for i in 0...2 {
            let randomMeme = memes?.randomElement()
            if let memeURL = randomMeme?.url, let memeName = randomMeme?.name {
                if let url = URL(string: memeURL) {
                    DispatchQueue.global().async {
                        if let data = try? Data(contentsOf: url) {
                            DispatchQueue.main.async {
                                self.commentsImages[i].image = UIImage(data: data)
                            }
                        }
                    }
                } else {
                    // Se o url falhar
                }
                self.commentsLabel[i].text = memeName
            } else {
                //Se o url do meme estiver vazio
            }
        }
    }
    
    //MARK: - Actions
    @IBAction func backButton(_ sender: UIButton) {
        delegate?.detalhesViewControllerBackButtonDidTap(self)
    }
    
    @IBAction func continueButton(_ sender: UIButton) {
        // Vai pra tela de comprar
    }
}
