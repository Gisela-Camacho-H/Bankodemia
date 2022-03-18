//
//  ConfirmaciónViewController.swift
//  bankodemia
//
//  Created by GiselaCamacho on 17/03/22.
//

import UIKit

class Confirmacio_nViewController: UIViewController {
    
    private lazy var continuarButton: UIButton = UIButton()
    lazy var mainImageView: UIImageView = UIImageView()
    
    lazy var mainLabel: UILabel = UILabel()
    lazy var subtitleLabel: UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()

    }
    
    func initUI(){
        view.addSubview(continuarButton)
        continuarButton.setTitle("Volver al Inicio", for: .normal)
        continuarButton.backgroundColor = UIColor.bankodemiaCyan
        continuarButton.setTitleColor(.white, for: .normal)
        continuarButton.layer.cornerRadius = Constants.cornerRadius
        continuarButton.heightAnchor.constraint(equalToConstant: Constants.buttonSize).isActive = true
        continuarButton.addTarget(self, action: #selector(onSignUpButtonTap), for: .touchUpInside)
        
        continuarButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([continuarButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -50),
        continuarButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        continuarButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
        self.view.addSubview(mainImageView)
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.image = UIImage(named: "plane")
        NSLayoutConstraint.activate([mainImageView.topAnchor.constraint(equalTo:
                view.topAnchor, constant: Constants.height / 7),
        mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        mainImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
        mainImageView.heightAnchor.constraint(equalToConstant: Constants.height / 5),
                ])
        
        self.view.addSubview(mainLabel)
        mainLabel.text = "¡Listo! Recibimos tu información. Usualmente tardamos unos minutos en verificar, pero en caso de tener algún problema, nos comunicaremos contigo."
        mainLabel.apply16Font()
        mainLabel.numberOfLines = 0
        mainLabel.textAlignment = .left
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([mainLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: Constants.buttonSize),
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        mainLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90)
        ])
        
        self.view.addSubview(subtitleLabel)
        subtitleLabel.text = "¡GRACIAS POR USAR BANKODEMIA!"
        subtitleLabel.apply16Font()
        subtitleLabel.textColor = UIColor.bankodemiaBlue
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textAlignment = .center
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([subtitleLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: Constants.buttonSize),
        subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        subtitleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.80)
        ])
    }

    
    @objc func onSignUpButtonTap(){
        goToSignUp()
    }
    
    func goToSignUp() {
        let loginViewController = LoginViewController()
        loginViewController.modalPresentationStyle = .fullScreen
        self.present(loginViewController, animated: true, completion: nil)
    }
    
    
}
