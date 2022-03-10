//
//  DatosViewController.swift
//  bankodemia
//
//  Created by GiselaCamacho on 10/03/22.
//

import UIKit

class DatosViewController: UIViewController {
    
    private lazy var backButton: UIButton = UIButton()
    
    // labels
    lazy var escribelosLabel: UILabel = UILabel()
    lazy var nombreLabel: UILabel = UILabel()
    lazy var apellidosLabel: UILabel = UILabel()
    lazy var ocupacionLabel: UILabel = UILabel()
    lazy var fechaLabel: UILabel = UILabel()
    
    
    // Text Fields
    lazy var nombreTextField : UITextField = UITextField()
    lazy var apellidosTextField : UITextField = UITextField()
    lazy var ocupacionTextField : UITextField = UITextField()
    
    // Stacks
    lazy var textFieldStackView : UIStackView = UIStackView()
    lazy var labelStackView : UIStackView = UIStackView()


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
        escribelosLabel.text = "Escribelos tal como aparecen en tu identificación oficial sin abreviaturas"
        self.escribelosLabel.adjustsFontSizeToFitWidth = true
        escribelosLabel.apply16Font()
        escribelosLabel.numberOfLines = 0
        escribelosLabel.textAlignment = .left
        escribelosLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([escribelosLabel.topAnchor.constraint(equalTo: backButton.topAnchor, constant: Constants.buttonSize),
        escribelosLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        escribelosLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.80)
        ])
        
       
        // label stack
        self.view.addSubview(nombreLabel)
        self.view.addSubview(apellidosLabel)
        self.view.addSubview(ocupacionLabel)
        self.view.addSubview(fechaLabel)
        nombreLabel.text = "Nombre(s)"
        apellidosLabel.text = "Apellido(s)"
        ocupacionLabel.text = "Ocupación"
        fechaLabel.text = "Fecha de nacimiento"
        
        let labelArray: [UILabel] = [nombreLabel, apellidosLabel, ocupacionLabel, fechaLabel]
        
        labelStackView.axis = .vertical
        labelStackView.spacing = 65
        labelStackView.alignment = .fill
        labelStackView.distribution = .fillEqually
        labelArray.forEach {label in
            labelStackView.addArrangedSubview(label)
        }
        view.addSubview(labelStackView)
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([labelStackView.topAnchor.constraint(equalTo: escribelosLabel.bottomAnchor, constant: Constants.padding),
        labelStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        labelStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
        labelArray.forEach {label in
            label.heightAnchor.constraint(equalToConstant: 20).isActive = true
            label.backgroundColor = .white
            label.apply14Font()
            label.textColor = UIColor.labelDarkGray
            label.textAlignment = .left
        }
        
        // TextField stack
        self.view.addSubview(nombreTextField)
        nombreTextField.layer.borderColor = UIColor.bankodemiaCyan.cgColor
        self.view.addSubview(apellidosTextField)
        apellidosTextField.layer.borderColor = UIColor.labelDarkGray.cgColor
        self.view.addSubview(ocupacionTextField)
        ocupacionTextField.layer.borderColor = UIColor.labelDarkGray.cgColor
        
        let textFieldArray: [UITextField] = [nombreTextField, apellidosTextField, ocupacionTextField]
        
        textFieldStackView.axis = .vertical
        textFieldStackView.spacing = 46
        textFieldStackView.alignment = .fill
        textFieldStackView.distribution = .fillEqually
        textFieldArray.forEach {textFieldElement in
            textFieldStackView.addArrangedSubview(textFieldElement)
        }
        view.addSubview(textFieldStackView)
        textFieldStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([textFieldStackView.topAnchor.constraint(equalTo: labelStackView.topAnchor, constant: Constants.padding + 3),
            textFieldStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
        textFieldArray.forEach {textFieldElement in
            textFieldElement.heightAnchor.constraint(equalToConstant: 40).isActive = true
            textFieldElement.layer.cornerRadius = 15
            textFieldElement.layer.cornerRadius = 7
            textFieldElement.layer.borderWidth = 2
            textFieldElement.backgroundColor = .clear
            textFieldElement.textAlignment = NSTextAlignment.left
            textFieldElement.keyboardType = UIKeyboardType.default
            textFieldElement.autocorrectionType = UITextAutocorrectionType.no
            textFieldElement.clearButtonMode = UITextField.ViewMode.whileEditing
        }
        
    }

    @objc func tapToGoBack(){
        goBack()
    }
    
    func goBack() {
        dismiss(animated: true)
    }
}
