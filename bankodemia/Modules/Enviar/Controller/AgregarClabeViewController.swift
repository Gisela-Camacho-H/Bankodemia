//
//  AgregarClabeViewController.swift
//  bankodemia
//
//  Created by Adriana Limon on 3/24/22.
//

import UIKit

class AgregarClabeViewController: UIViewController {
    
    lazy var bankodemiaLogo: UIImageView = UIImageView()
    lazy var backButton: UIView.backArrowButton = UIView.backArrowButton()
    lazy var titleLabel: UIView.titleButtonLabel = UIView.titleButtonLabel()
    lazy var addContactButton: UIView.cyanButton = UIView.cyanButton()
    lazy var cardDigitsLabel: UILabel = UILabel()
    lazy var cardDigitsTextField: UIView.signUpTextField = UIView.signUpTextField()
    lazy var bankInstitutionLabel: UILabel = UILabel()
    lazy var bankInstitutionTextField: UIView.signUpTextField = UIView.signUpTextField()
    lazy var nameLabel: UILabel = UILabel()
    lazy var nameTextField: UIView.signUpTextField = UIView.signUpTextField()
    lazy var emailLabel: UILabel = UILabel()
    lazy var emailTextField: UIView.signUpTextField = UIView.signUpTextField()
    lazy var clabeButtonLabel: UILabel = UILabel()
    lazy var cardButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        
        initUI()
    }
    
    func initUI(){
        
        view.applyWhiteBackgroundColor()
        
        self.view.addSubview(bankodemiaLogo)
        bankodemiaLogo.translatesAutoresizingMaskIntoConstraints = false
        bankodemiaLogo.image = UIImage(named: "bigLogo")
        NSLayoutConstraint.activate([bankodemiaLogo.topAnchor.constraint(equalTo:
                view.topAnchor, constant: Constants.height / 14),
        bankodemiaLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        bankodemiaLogo.widthAnchor.constraint(equalToConstant: 70),
        bankodemiaLogo.heightAnchor.constraint(equalToConstant: 42.5),
        ])
        
        self.view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(tapToGoBack), for: .touchUpInside)
        NSLayoutConstraint.activate([
        backButton.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height/10),
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        
        self.view.addSubview(titleLabel)
        titleLabel.text = "AGREGAR CONTACTO"
        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height/10),
        titleLabel.leftAnchor.constraint(equalTo: backButton.leftAnchor, constant: Constants.padding)
        ])
        
        self.view.addSubview(clabeButtonLabel)
        clabeButtonLabel.textColor = UIColor.bankodemiaCyan
        clabeButtonLabel.backgroundColor = .clear
        clabeButtonLabel.font = UIFont(name: "Poppins-SemiBold", size: 18)
        clabeButtonLabel.textAlignment = .left
        clabeButtonLabel.attributedText = NSMutableAttributedString(string: "CLABE", attributes: [NSAttributedString.Key.kern: 0.7])
        
        view.addSubview(clabeButtonLabel)
        clabeButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        clabeButtonLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        clabeButtonLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        clabeButtonLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        clabeButtonLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 45).isActive = true
        
        self.view.addSubview(cardButton)
        cardButton.setTitleColor(UIColor.bankodemiaBlack, for: .normal)
        cardButton.backgroundColor = .clear
        cardButton.setTitle("Tarjeta", for: .normal)
        cardButton.titleLabel.self?.font = UIFont(name: "Poppins-SemiBold", size: 18)
        cardButton.contentHorizontalAlignment = .center
        cardButton.addTarget(self, action: #selector(tapToGoToCard), for: .touchUpInside)
        
        view.addSubview(cardButton)
        cardButton.translatesAutoresizingMaskIntoConstraints = false
        cardButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        cardButton.heightAnchor.constraint(equalToConstant: 21).isActive = true
        cardButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cardButton.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 45).isActive = true
        
        self.view.addSubview(cardDigitsLabel)
        cardDigitsLabel.textColor = UIColor(red: 0.384, green: 0.384, blue: 0.384, alpha: 1)
        cardDigitsLabel.font = UIFont(name: "Poppins-Medium", size: 14)
        cardDigitsLabel.textAlignment = .left
        cardDigitsLabel.attributedText = NSMutableAttributedString(string: "18 dígitos", attributes: [NSAttributedString.Key.kern: 0.7])
        
        view.addSubview(cardDigitsLabel)
        cardDigitsLabel.translatesAutoresizingMaskIntoConstraints = false
        cardDigitsLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        cardDigitsLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        cardDigitsLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        cardDigitsLabel.topAnchor.constraint(equalTo: cardButton.topAnchor, constant: 45).isActive = true
        
        self.view.addSubview(cardDigitsTextField)
        cardDigitsTextField.layer.borderColor = UIColor.labelGray.cgColor
        NSLayoutConstraint.activate([cardDigitsTextField.topAnchor.constraint(equalTo: cardDigitsLabel.bottomAnchor, constant: 0.2),
        cardDigitsTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        cardDigitsTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
        self.view.addSubview(bankInstitutionLabel)
        bankInstitutionLabel.textColor = UIColor(red: 0.384, green: 0.384, blue: 0.384, alpha: 1)
        bankInstitutionLabel.font = UIFont(name: "Poppins-Medium", size: 14)
        bankInstitutionLabel.textAlignment = .left
        bankInstitutionLabel.attributedText = NSMutableAttributedString(string: "Institución", attributes: [NSAttributedString.Key.kern: 0.7])
        NSLayoutConstraint.activate([
        bankInstitutionLabel.topAnchor.constraint(equalTo: cardDigitsTextField.topAnchor, constant: Constants.height/15),
        bankInstitutionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        
        view.addSubview(bankInstitutionLabel)
        bankInstitutionLabel.translatesAutoresizingMaskIntoConstraints = false
        bankInstitutionLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        bankInstitutionLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        self.view.addSubview(bankInstitutionTextField)
        bankInstitutionTextField.layer.borderColor = UIColor.labelGray.cgColor
        NSLayoutConstraint.activate([bankInstitutionTextField.topAnchor.constraint(equalTo: bankInstitutionLabel.bottomAnchor, constant: 0.0),
        bankInstitutionTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        bankInstitutionTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
        self.view.addSubview(nameLabel)
        nameLabel.textColor = UIColor(red: 0.384, green: 0.384, blue: 0.384, alpha: 1)
        nameLabel.font = UIFont(name: "Poppins-Medium", size: 14)
        nameLabel.textAlignment = .left
        nameLabel.attributedText = NSMutableAttributedString(string: "Nombre", attributes: [NSAttributedString.Key.kern: 0.7])
        NSLayoutConstraint.activate([
        nameLabel.topAnchor.constraint(equalTo: bankInstitutionTextField.topAnchor, constant: Constants.height/15),
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        self.view.addSubview(nameTextField)
        nameTextField.layer.borderColor = UIColor.labelGray.cgColor
        NSLayoutConstraint.activate([nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0.0),
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
        self.view.addSubview(emailLabel)
        emailLabel.textColor = UIColor(red: 0.384, green: 0.384, blue: 0.384, alpha: 1)
        emailLabel.font = UIFont(name: "Poppins-Medium", size: 14)
        emailLabel.textAlignment = .left
        emailLabel.attributedText = NSMutableAttributedString(string: "Correo de notificación", attributes: [NSAttributedString.Key.kern: 0.7])
        NSLayoutConstraint.activate([
        emailLabel.topAnchor.constraint(equalTo: nameTextField.topAnchor, constant: Constants.height/15),
        emailLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        
        view.addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        self.view.addSubview(emailTextField)
        emailTextField.layer.borderColor = UIColor.labelGray.cgColor
        NSLayoutConstraint.activate([emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 0.0),
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
        view.addSubview(addContactButton)
        addContactButton.addTarget(self, action: #selector(tapToAddAccount), for: .touchUpInside)
        addContactButton.setTitle("Agregar Contacto", for: .normal)
        addContactButton.backgroundColor = UIColor.bankodemiaCyan
        addContactButton.setTitleColor(.white, for: .normal)
        addContactButton.layer.cornerRadius = 5
        addContactButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([addContactButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -50),
        addContactButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        addContactButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
    }
    
    //MARK: Funcionalidad Botones
    
    @objc func tapToGoBack(){
        toGoBack()
    }
    
    func toGoBack() {
        let enviarViewController = EnviarViewController()
        enviarViewController.modalPresentationStyle = .fullScreen
        self.present(enviarViewController, animated: true, completion: nil)
    }
    
    @objc func tapToAddAccount(){
        toAddAccount()
    }
    
    func toAddAccount() {
        let confirmarAgregadoViewController = ConfirmarAgregadoViewController()
        confirmarAgregadoViewController.modalPresentationStyle = .fullScreen
        self.present(confirmarAgregadoViewController, animated: true, completion: nil)
    }
    
    @objc func tapToGoToCard(){
        goToCard()
    }
    
    func goToCard() {
        let agregarTarjetaViewController = AgregarTarjetaViewController()
        agregarTarjetaViewController.modalPresentationStyle = .fullScreen
        self.present(agregarTarjetaViewController, animated: false, completion: nil)
    }
}
