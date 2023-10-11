//
//  HomeTableViewHeader.swift
//  Alura_Viagens
//
//  Created by Wagner Duarte on 04/09/23.
//

import UIKit

//MARK: Class Definition
class HomeTableViewHeader: UIView {
    
    //MARK: - IDs
    static let identifier = UsefulStrings.homeTableViewHeaderIdentifier
    static func nib() -> UINib {
        return UINib(nibName: UsefulStrings.homeTableViewHeaderIdentifier,
                     bundle: nil)
    }

    // MARK: - IBOutlets
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var bannerView: UIView!
    
    //MARK: - Layout Configuration
    func configuraHeader() {
        
        headerView.backgroundColor = UIColor(red: 30/255, green: 59/255, blue: 119/255, alpha: 1)
        headerView.layer.cornerRadius = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 500 : 200
        headerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        bannerView.layer.cornerRadius = 10
        bannerView.layer.masksToBounds = true
        
    }
}
