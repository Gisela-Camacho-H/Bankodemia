//
//  VerificarViewController.swift
//  bankodemia
//
//  Created by GiselaCamacho on 16/03/22.
//

import UIKit

class VerificarViewController: UIViewController {

    private lazy var backButton: UIButton = UIButton()
    private lazy var continuarButton: UIButton = UIButton()
    
    // labels
    lazy var escribelosLabel: UILabel = UILabel()
    lazy var celularLabel: UILabel = UILabel()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()

    }
    
    
    func initUI(){
        self.view.addSubview(backButton)
        backButton.backgroundColor = .clear
        backButton.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        backButton.tintColor = UIColor.labelDarkGray
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(tapToGoBack), for: .touchUpInside)
        NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.height / 6),
                                     backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.padding)
        ])
        
        self.view.addSubview(escribelosLabel)
        escribelosLabel.text = "Ahora, vamos a verificar tu identidad para proteger tu cuenta."
        self.escribelosLabel.adjustsFontSizeToFitWidth = true
        escribelosLabel.apply16Font()
        escribelosLabel.numberOfLines = 0
        escribelosLabel.textAlignment = .left
        escribelosLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([escribelosLabel.topAnchor.constraint(equalTo: backButton.topAnchor, constant: Constants.buttonSize),
        escribelosLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        escribelosLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.80)
        ])
       
        self.view.addSubview(celularLabel)
        celularLabel.text = "Deberás subir una fotografía de tu INE o pasaporte vigente y tormarte una selfie. Si eres extranjero necesitarás una fotografía de tu documentos migratorio (FM3)"
        self.celularLabel.adjustsFontSizeToFitWidth = true
        celularLabel.apply14Font()
        celularLabel.numberOfLines = 0
        celularLabel.textAlignment = .left
    
        celularLabel.translatesAutoresizingMaskIntoConstraints = false
        celularLabel.textColor = UIColor.labelDarkGray
        NSLayoutConstraint.activate([celularLabel.topAnchor.constraint(equalTo: escribelosLabel.topAnchor, constant: Constants.buttonSize + 30),
       celularLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        celularLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.80)
        ])
        
        
        view.addSubview(continuarButton)
        continuarButton.setTitle("Entendido", for: .normal)
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
        
    }
    
    @objc func onSignUpButtonTap(){
        goToSignUp()
    }
    
    func goToSignUp() {
        let loginViewController = VerificarTableViewController()
        loginViewController.modalPresentationStyle = .fullScreen
        self.present(loginViewController, animated: true, completion: nil)
    }
    
    @objc func tapToGoBack(){
        goBack()
    }
    
    func goBack() {
        dismiss(animated: true)
    }
}
