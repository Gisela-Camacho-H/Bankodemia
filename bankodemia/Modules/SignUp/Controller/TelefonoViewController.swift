//
//  TelefonoViewController.swift
//  bankodemia
//
//  Created by GiselaCamacho on 14/03/22.
//

import UIKit

class TelefonoViewController: UIViewController {

    private lazy var backButton: UIButton = UIButton()
    private lazy var continuarButton: UIButton = UIButton()
    
    // labels
    lazy var escribelosLabel: UILabel = UILabel()
    lazy var estaLabel: UILabel = UILabel()
    lazy var celularLabel: UILabel = UILabel()
    
    lazy var telefonoTextField: UITextField = UITextField()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()
        //create the UITextfield to present the Date Picker
        initializeHideKeyboard()

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
        escribelosLabel.text = "Lo usarás para iniciar sesión"
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
        celularLabel.text = "Tu número de celular"
        celularLabel.apply14Font()
        celularLabel.textAlignment = .left
    
        celularLabel.translatesAutoresizingMaskIntoConstraints = false
        celularLabel.textColor = UIColor.labelDarkGray
        NSLayoutConstraint.activate([celularLabel.topAnchor.constraint(equalTo: escribelosLabel.topAnchor, constant: Constants.buttonSize + 20),
       celularLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        celularLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.80)
        ])
        
        self.view.addSubview(telefonoTextField)
        telefonoTextField.layer.borderColor = UIColor.bankodemiaCyan.cgColor
        telefonoTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        telefonoTextField.layer.cornerRadius = 7
        telefonoTextField.layer.borderWidth = 1
        telefonoTextField.backgroundColor = .clear
        telefonoTextField.placeholder = "+52  |    5540160405"
        telefonoTextField.textAlignment = NSTextAlignment.left
        telefonoTextField.keyboardType = UIKeyboardType.default
        telefonoTextField.autocorrectionType = UITextAutocorrectionType.no
        telefonoTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: telefonoTextField.frame.height))
        telefonoTextField.leftView = paddingView
        telefonoTextField.leftViewMode = UITextField.ViewMode.always
        telefonoTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([telefonoTextField.topAnchor.constraint(equalTo: celularLabel.topAnchor, constant: Constants.padding + 10),
            telefonoTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            telefonoTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
        
        
        view.addSubview(continuarButton)
        continuarButton.setTitle("Continuar", for: .normal)
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
        
        self.view.addSubview(estaLabel)
        estaLabel.translatesAutoresizingMaskIntoConstraints = false
        estaLabel.text = "Para proteger tu cuenta, te envíaremos un código vía SMS."
        estaLabel.numberOfLines = 0
        estaLabel.textAlignment = .center
        estaLabel.textColor = UIColor.bankodemiaBlack
        
        NSLayoutConstraint.activate([estaLabel.bottomAnchor.constraint(equalTo: continuarButton.topAnchor, constant: -20),
                                     estaLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor), estaLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90)
        ])
        
    }
    
    @objc func onSignUpButtonTap(){
        goToSignUp()
    }
    
    func goToSignUp() {
        let loginViewController = TelefonoViewController()
        loginViewController.modalPresentationStyle = .fullScreen
        self.present(loginViewController, animated: true, completion: nil)
    }
    
    
    func initializeHideKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))

        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissMyKeyboard(){

        view.endEditing(true)
    }

    
    

    @objc func tapToGoBack(){
        goBack()
    }
    
    func goBack() {
        dismiss(animated: true)
    }
}

    
