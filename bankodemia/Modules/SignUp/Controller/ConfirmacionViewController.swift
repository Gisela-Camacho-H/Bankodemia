//
//  ConfirmaciónViewController.swift
//  bankodemia
//
//  Created by GiselaCamacho on 17/03/22.
//

import UIKit

class Confirmacio_nViewController: UIViewController {
    
    private lazy var continuarButton: UIView.cyanButton = UIView.cyanButton()
    lazy var mainImageView: UIImageView = UIImageView()
    
    lazy var mainLabel: UIView.mainTextLabel = UIView.mainTextLabel()
    lazy var subtitleLabel: UILabel = UILabel()
    
    lazy var bankodemiaLogo: UIImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()

    }
    
    func initUI(){
        self.view.addSubview(bankodemiaLogo)
        bankodemiaLogo.translatesAutoresizingMaskIntoConstraints = false
        bankodemiaLogo.image = UIImage(named: "smallLogo")
        NSLayoutConstraint.activate([bankodemiaLogo.topAnchor.constraint(equalTo:
                view.topAnchor, constant: Constants.height / 14),
        bankodemiaLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        bankodemiaLogo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
        bankodemiaLogo.heightAnchor.constraint(equalToConstant: Constants.height / 20),
        ])
        
        self.view.addSubview(mainImageView)
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.image = UIImage(named: "plane")
        NSLayoutConstraint.activate([mainImageView.topAnchor.constraint(equalTo:
                bankodemiaLogo.topAnchor, constant: Constants.height / 7),
        mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        mainImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
        mainImageView.heightAnchor.constraint(equalToConstant: Constants.height / 5),
        ])
        
        self.view.addSubview(mainLabel)
        mainLabel.text = "¡Listo! Recibimos tu información. Usualmente tardamos unos minutos en verificar, pero en caso de tener algún problema, nos comunicaremos contigo."
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
        
        NSLayoutConstraint.activate([subtitleLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: Constants.height/10),
        subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        subtitleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.80)
        ])
        
        view.addSubview(continuarButton)
        continuarButton.setTitle("Volver al Inicio", for: .normal)
        continuarButton.addTarget(self, action: #selector(onSignUpButtonTap), for: .touchUpInside)
        
        continuarButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([continuarButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -50),
        continuarButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        continuarButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
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
