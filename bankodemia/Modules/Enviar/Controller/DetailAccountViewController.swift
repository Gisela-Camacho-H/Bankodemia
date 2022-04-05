//
//  DetailAccountViewController.swift
//  bankodemia
//
//  Created by Adriana Limon on 4/3/22.
//

import UIKit

class DetailAccountViewController: UIViewController, UITextFieldDelegate {

    var cuenta: Account?
    
    lazy var bankodemiaLogo: UIImageView = UIImageView()
    lazy var backButton: UIView.backArrowButton = UIView.backArrowButton()
    lazy var titleLabel: UIView.titleButtonLabel = UIView.titleButtonLabel()
    lazy var sendLabel: UIView.titleButtonLabel = UIView.titleButtonLabel()
    lazy var quantityLabel: UIView.titleButtonLabel = UIView.titleButtonLabel()
    lazy var quantityTextField: UITextField = UITextField()
    lazy var speiLabel: UILabel = UILabel()
    lazy var paymentConcept: UIView.titleButtonLabel = UIView.titleButtonLabel()
    lazy var paymentConceptTextField: UITextField = UITextField()
    lazy var transferButton: UIView.cyanButton = UIView.cyanButton()
    
    lazy var accountName: UILabel = UILabel()
    lazy var accountNumber: UILabel = UILabel()
    
    lazy var amt: Int = 0
    
    let name = "Dany De San Pedro"
    let account = "12345678"
    let bank = "BAKODEMIA"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        initializeHideKeyboard()
        quantityTextField.delegate = self
        quantityTextField.placeholder = updateAmount()
        
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
        titleLabel.text = "TRANSFERENCIA"
        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height/10),
        titleLabel.leftAnchor.constraint(equalTo: backButton.leftAnchor, constant: Constants.padding)
        ])
        
        self.view.addSubview(sendLabel)
        sendLabel.backgroundColor = .clear
        sendLabel.text = "ENVIAR A"
        NSLayoutConstraint.activate([sendLabel.topAnchor.constraint(equalTo: backButton.topAnchor, constant: Constants.height/10),
        sendLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        
        self.view.addSubview(accountName)
        accountName.text = name
        accountName.backgroundColor = .clear
        accountName.font = UIFont(name: "Poppins-SemiBold", size: 14)
        accountName.textColor = .bankodemiaBlack
        accountName.textAlignment = .left
        NSLayoutConstraint.activate([accountName.topAnchor.constraint(equalTo: sendLabel.bottomAnchor, constant: 8),
        accountName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        accountName.translatesAutoresizingMaskIntoConstraints = false
        accountName.widthAnchor.constraint(equalToConstant: 306).isActive = true
        accountName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.view.addSubview(accountNumber)
        accountNumber.text = (account) + " / " + (bank)
        accountNumber.backgroundColor = .clear
        accountNumber.font = UIFont(name: "Poppins-Medium", size: 14)
        accountNumber.textColor = .bankodemiaBlack
        accountNumber.textAlignment = .left
        NSLayoutConstraint.activate([accountNumber.topAnchor.constraint(equalTo: accountName.bottomAnchor, constant: 0),
        accountNumber.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        accountNumber.translatesAutoresizingMaskIntoConstraints = false
        accountNumber.widthAnchor.constraint(equalToConstant: 306).isActive = true
        accountNumber.heightAnchor.constraint(equalToConstant: 20).isActive = true

        self.view.addSubview(quantityLabel)
        quantityLabel.backgroundColor = .clear
        quantityLabel.text = "CANTIDAD"
        NSLayoutConstraint.activate([quantityLabel.topAnchor.constraint(equalTo: accountNumber.bottomAnchor, constant: 18),
        quantityLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        
        self.view.addSubview(quantityTextField)
        quantityTextField.backgroundColor = .clear
        quantityTextField.keyboardType = .numberPad
        quantityTextField.textAlignment = .center
        quantityTextField.font = UIFont(name: "Poppins-SemiBold", size: 20)
        NSLayoutConstraint.activate([quantityTextField.topAnchor.constraint(equalTo: quantityLabel.bottomAnchor, constant: 10),
        quantityTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        quantityTextField.translatesAutoresizingMaskIntoConstraints = false
        quantityTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        quantityTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.view.addSubview(speiLabel)
        speiLabel.backgroundColor = .clear
        speiLabel.text = "SPEI sin costo"
        speiLabel.font = UIFont(name: "Poppins-Medium", size: 14)
        speiLabel.textColor = .bankodemiaCyan
        speiLabel.textAlignment = .center
        NSLayoutConstraint.activate([speiLabel.topAnchor.constraint(equalTo: quantityTextField.bottomAnchor, constant: 0),
        speiLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        speiLabel.translatesAutoresizingMaskIntoConstraints = false
        speiLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        speiLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.view.addSubview(paymentConcept)
        paymentConcept.backgroundColor = .clear
        paymentConcept.text = "CONCEPTO DE PAGO"
        NSLayoutConstraint.activate([paymentConcept.topAnchor.constraint(equalTo: speiLabel.bottomAnchor, constant: 14),
        paymentConcept.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        
        self.view.addSubview(paymentConceptTextField)
        paymentConceptTextField.backgroundColor = .clear
        paymentConceptTextField.placeholder = "Ingrese aquí el concepto del pago."
        paymentConceptTextField.textContentType = .name
        paymentConceptTextField.font = UIFont(name: "Poppins-Medium", size: 14)
        NSLayoutConstraint.activate([paymentConceptTextField.topAnchor.constraint(equalTo: paymentConcept.bottomAnchor, constant: 0),
        paymentConceptTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        paymentConceptTextField.translatesAutoresizingMaskIntoConstraints = false
        paymentConceptTextField.widthAnchor.constraint(equalToConstant: 306).isActive = true
        paymentConceptTextField.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.view.addSubview(transferButton)
        //transferButton.addTarget(self, action: #selector(tapToAddAccount), for: .touchUpInside)
        transferButton.setTitle("Hacer Transferencia", for: .normal)
        transferButton.backgroundColor = UIColor.bankodemiaCyan
        transferButton.setTitleColor(.white, for: .normal)
        transferButton.addTarget(self, action: #selector(tapToModal), for: .touchUpInside)
        transferButton.layer.cornerRadius = 5
        transferButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([transferButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -50),
        transferButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        transferButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
    
    }
    
    //MARK: Funcionalidad Botones
    
    @objc func tapToGoBack(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func tapToModal(){
        showModal()
    }
    
    func showModal() {
        let modalViewController = ModalViewController()
        modalViewController.modalPresentationStyle = .overCurrentContext
        present(modalViewController, animated: false, completion: nil)
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
    
    
    //MARK - UITextField Delegates
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let digit = Int(string){
            
            amt = amt * 10 + digit
            
            if amt > 1_000_000_000_00 {
                
                let alert = UIAlertController(title: "Por favor, ingrese un monto menor a un billón", message: nil, preferredStyle: UIAlertController.Style.alert)
                
                alert.addAction(UIAlertAction(title: "Entendido", style: UIAlertAction.Style.default, handler: nil))
                
                present(alert, animated: true, completion: nil)
                
                quantityTextField.text = ""
                
                amt = 0
                
            } else {
            
            quantityTextField.text = updateAmount()
                
            }
        }
        
        if string == "" {
            amt = amt/10
            quantityTextField.text = amt == 0 ? "" : updateAmount()
        }
        
        return false
    }
    
    func updateAmount() -> String? {
    
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currency
        let amount = Double(amt/100) + Double(amt%100)/100
        
        return formatter.string(from: NSNumber(value: amount))
        
    }
}

/* extension DetailAccountViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // dismiss keyboard
        return true
    }
} */
