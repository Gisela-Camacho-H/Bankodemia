//
//  ModalViewController.swift
//  bankodemia
//
//  Created by Adriana Limon on 4/3/22.
//

import UIKit

class ModalViewController: UIViewController {
    
    lazy var modalView: UIView = UIView()
    lazy var titleLabel: UILabel = UILabel()
    lazy var contentLabel: UILabel = UILabel()
    lazy var confirmationButton: UIButton = UIButton()
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 98/255, green: 98/255, blue: 98/255, alpha: 0.5)
        view.isOpaque = false
        
        createModalView()
    }

func createModalView(){
    modalView = UIView(frame: CGRect(x: 0, y: 0, width: 280, height: 230))
    modalView.center = self.view.center
    modalView.backgroundColor = .white
    modalView.layer.cornerRadius = 12
    view.addSubview(modalView)
    
    titleLabel = UILabel(frame: CGRect(x: 15, y: 17, width: 250, height: 20))
    titleLabel.backgroundColor = .clear
    titleLabel.text = "CONFIRMACIÓN DE TRANSFERENCIA"
    titleLabel.font = UIFont(name: "Poppins-Medium", size: 14)
    titleLabel.textColor = .bankodemiaBlack
    titleLabel.textAlignment = .center
    modalView.addSubview(titleLabel)
    
    contentLabel = UILabel(frame: CGRect(x: 15, y: 84, width: 250, height: 48))
    contentLabel.backgroundColor = .clear
    contentLabel.numberOfLines = 2
    contentLabel.text = "¿Estás segura(o) que quieres realizar esta transacción?"
    contentLabel.font = UIFont(name: "Poppins-Medium", size: 16)
    contentLabel.textColor = .bankodemiaBlack
    contentLabel.textAlignment = .center
    modalView.addSubview(contentLabel)
    
    confirmationButton = UIButton(frame: CGRect(x: 15, y: 173, width: 250, height: 42))
    confirmationButton.addTarget(self, action: #selector(tapToProcess), for: .touchUpInside)
    confirmationButton.setTitle("Aceptar", for: .normal)
    confirmationButton.backgroundColor = UIColor.bankodemiaCyan
    confirmationButton.setTitleColor(.white, for: .normal)
    confirmationButton.layer.cornerRadius = 5
    confirmationButton.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 18)
    modalView.addSubview(confirmationButton)
    
    }
    
    @objc func tapToProcess(){
        toProcessing()
    }
    
    func toProcessing() {
        let esperaViewController = EsperaViewController()
        esperaViewController.modalPresentationStyle = .fullScreen
        self.present(esperaViewController, animated: true, completion: nil)
    }
}
