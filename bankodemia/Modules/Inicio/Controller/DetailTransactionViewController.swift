//
//  DetailTransactionViewController.swift
//  bankodemia
//
//  Created by Adriana Limon on 4/4/22.
//

import UIKit

class DetailTransactionViewController: UIViewController {
    
    lazy var bankodemiaLogo: UIImageView = UIImageView()
    lazy var profileIcon: UIImageView = UIImageView()
    lazy var helpIcon: UIImageView = UIImageView()
    lazy var backButton: UIView.backArrowButton = UIView.backArrowButton()
    lazy var titleLabel: UIView.titleButtonLabel = UIView.titleButtonLabel()
    lazy var totalQuantityLabel: UILabel = UILabel()
    lazy var conceptLabel: UILabel = UILabel()
    lazy var dateHourTitleLabel: UILabel = UILabel()
    lazy var dateHourLabel: UILabel = UILabel()
    lazy var idTransactionTitleLabel: UILabel = UILabel()
    lazy var idTransactionLabel: UILabel = UILabel()
    lazy var conceptDetailTitleLabel: UILabel = UILabel()
    lazy var conceptDetailLabel: UILabel = UILabel()
    lazy var accountTypeTitleLabel: UILabel = UILabel()
    lazy var accountNumberTitleLabel: UILabel = UILabel()
    lazy var accountNumberLabel: UILabel = UILabel()
    
    let concepto = "Croquetas para perrito"
    let fecha = "05 de marzo de 2022"
    let hora = "7:00 p.m."
    let idTransaccion = "79908BANKODER93959093122188998"
    let cuentaNumero = "1890 1879 8"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        initUI()
    }
    
    func initUI() {
        
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
        
        
        self.view.addSubview(helpIcon)
        helpIcon.translatesAutoresizingMaskIntoConstraints = false
        helpIcon.image = UIImage(named: "helpIcon")
        NSLayoutConstraint.activate([helpIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.height/11), helpIcon.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
        helpIcon.translatesAutoresizingMaskIntoConstraints = false
        helpIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        helpIcon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        self.view.addSubview(profileIcon)
        profileIcon.translatesAutoresizingMaskIntoConstraints = false
        profileIcon.image = UIImage(named: "profileIcon")
        NSLayoutConstraint.activate([profileIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.height/11), profileIcon.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        profileIcon.translatesAutoresizingMaskIntoConstraints = false
        profileIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        profileIcon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        self.view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(tapToGoBack), for: .touchUpInside)
        NSLayoutConstraint.activate([
        backButton.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height/10),
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        
        self.view.addSubview(titleLabel)
        titleLabel.text = "DETALLE DE TRANSACCIÓN"
        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height/10),
        titleLabel.leftAnchor.constraint(equalTo: backButton.leftAnchor, constant: Constants.padding)
        ])
        
        view.addSubview(totalQuantityLabel)
        totalQuantityLabel.frame = CGRect(x: 0, y: 0, width: 85, height: 30)
        totalQuantityLabel.backgroundColor = .clear
        totalQuantityLabel.textColor = UIColor(red: 0.087, green: 0.087, blue: 0.087, alpha: 1)
        totalQuantityLabel.font = UIFont(name: "Poppins-SemiBold", size: 20)
        totalQuantityLabel.text = "$160.00"
        totalQuantityLabel.textAlignment = .center
        totalQuantityLabel.translatesAutoresizingMaskIntoConstraints = false
        totalQuantityLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        totalQuantityLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        totalQuantityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        totalQuantityLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 152).isActive = true
        
        view.addSubview(conceptLabel)
        conceptLabel.backgroundColor = .clear
        conceptLabel.text = concepto
        conceptLabel.font = UIFont(name: "Poppins-Medium", size: 14)
        conceptLabel.textAlignment = .center
        NSLayoutConstraint.activate([conceptLabel.topAnchor.constraint(equalTo: totalQuantityLabel.bottomAnchor, constant: 0),
        conceptLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        conceptLabel.translatesAutoresizingMaskIntoConstraints = false
        conceptLabel.widthAnchor.constraint(equalToConstant: 180).isActive = true
        conceptLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        view.addSubview(dateHourTitleLabel)
        dateHourTitleLabel.backgroundColor = .clear
        dateHourTitleLabel.text = "FECHA Y HORA"
        dateHourTitleLabel.font = UIFont(name: "Poppins-SemiBold", size: 14)
        dateHourTitleLabel.textAlignment = .left
        NSLayoutConstraint.activate([dateHourTitleLabel.topAnchor.constraint(equalTo: conceptLabel.bottomAnchor, constant: 40),
        dateHourTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        dateHourTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        dateHourTitleLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        dateHourTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        view.addSubview(dateHourLabel)
        dateHourLabel.backgroundColor = .clear
        dateHourLabel.text = (fecha) + " " + (hora)
        dateHourLabel.font = UIFont(name: "Poppins-Medium", size: 14)
        dateHourLabel.textAlignment = .left
        NSLayoutConstraint.activate([dateHourLabel.topAnchor.constraint(equalTo: dateHourTitleLabel.bottomAnchor, constant: 0),
        dateHourLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        dateHourLabel.translatesAutoresizingMaskIntoConstraints = false
        dateHourLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        dateHourLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        view.addSubview(idTransactionTitleLabel)
        idTransactionTitleLabel.backgroundColor = .clear
        idTransactionTitleLabel.text = "ID DE TRANSACCIÓN"
        idTransactionTitleLabel.font = UIFont(name: "Poppins-SemiBold", size: 14)
        idTransactionTitleLabel.textAlignment = .left
        NSLayoutConstraint.activate([idTransactionTitleLabel.topAnchor.constraint(equalTo: dateHourLabel.bottomAnchor, constant: 14),
        idTransactionTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        idTransactionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        idTransactionTitleLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        idTransactionTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        view.addSubview(idTransactionLabel)
        idTransactionLabel.backgroundColor = .clear
        idTransactionLabel.text = idTransaccion
        idTransactionLabel.font = UIFont(name: "Poppins-Medium", size: 14)
        idTransactionLabel.textAlignment = .left
        NSLayoutConstraint.activate([idTransactionLabel.topAnchor.constraint(equalTo: idTransactionTitleLabel.bottomAnchor, constant: 0),
        idTransactionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        idTransactionLabel.translatesAutoresizingMaskIntoConstraints = false
        idTransactionLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        idTransactionLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        view.addSubview(conceptDetailTitleLabel)
        conceptDetailTitleLabel.backgroundColor = .clear
        conceptDetailTitleLabel.text = "CONCEPTO"
        conceptDetailTitleLabel.font = UIFont(name: "Poppins-SemiBold", size: 14)
        conceptDetailTitleLabel.textAlignment = .left
        NSLayoutConstraint.activate([conceptDetailTitleLabel.topAnchor.constraint(equalTo: idTransactionLabel.bottomAnchor, constant: 14),
        conceptDetailTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        conceptDetailTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        conceptDetailTitleLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        conceptDetailTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        view.addSubview(conceptDetailLabel)
        conceptDetailLabel.backgroundColor = .clear
        conceptDetailLabel.text = concepto
        conceptDetailLabel.font = UIFont(name: "Poppins-Medium", size: 14)
        conceptDetailLabel.textAlignment = .left
        NSLayoutConstraint.activate([conceptDetailLabel.topAnchor.constraint(equalTo: conceptDetailTitleLabel.bottomAnchor, constant: 0),
        conceptDetailLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        conceptDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        conceptDetailLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        conceptDetailLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        view.addSubview(accountTypeTitleLabel)
        accountTypeTitleLabel.backgroundColor = .clear
        accountTypeTitleLabel.text = "CUENTA EMISORA"
        accountTypeTitleLabel.font = UIFont(name: "Poppins-SemiBold", size: 14)
        accountTypeTitleLabel.textAlignment = .left
        NSLayoutConstraint.activate([accountTypeTitleLabel.topAnchor.constraint(equalTo: conceptDetailLabel.bottomAnchor, constant: 14),
        accountTypeTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        accountTypeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        accountTypeTitleLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        accountTypeTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        view.addSubview(accountNumberTitleLabel)
        accountNumberTitleLabel.backgroundColor = .clear
        accountNumberTitleLabel.text = "Número de Cuenta"
        accountNumberTitleLabel.font = UIFont(name: "Poppins-Medium", size: 14)
        accountNumberTitleLabel.textAlignment = .left
        NSLayoutConstraint.activate([accountNumberTitleLabel.topAnchor.constraint(equalTo: accountTypeTitleLabel.bottomAnchor, constant: 0),
        accountNumberTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        accountNumberTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        accountNumberTitleLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        accountNumberTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        view.addSubview(accountNumberLabel)
        accountNumberLabel.backgroundColor = .clear
        accountNumberLabel.text = cuentaNumero
        accountNumberLabel.font = UIFont(name: "Poppins-Medium", size: 14)
        accountNumberLabel.textAlignment = .left
        NSLayoutConstraint.activate([accountNumberLabel.topAnchor.constraint(equalTo: accountNumberTitleLabel.bottomAnchor, constant: 0),
        accountNumberLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        accountNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        accountNumberLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        accountNumberLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
    //MARK: Funcionalidad Botones
    
    @objc func tapToGoBack(){
        self.dismiss(animated: true, completion: nil)
    }
    
}
