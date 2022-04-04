//
//  EnviarViewController.swift
//  bankodemia
//
//  Created by Itzel Ibanez on 17/03/22.
//

import UIKit

class EnviarViewController: UIViewController {
    
    lazy var bankodemiaLogo: UIImageView = UIImageView()
    lazy var backButton: UIView.backArrowButton = UIView.backArrowButton()
    lazy var titleLabel: UIView.titleButtonLabel = UIView.titleButtonLabel()
    lazy var addAccountButton: UIView.addAccountButton = UIView.addAccountButton()
    lazy var tableView = UITableView()
    public var dataSource: [Account]? = [Account(clientName: "Daniel De San Pedro", accountNumber: "1234567", bankEntity: "BANKODEMIA"),Account(clientName: "Daniel De San Pedro", accountNumber: "1234567", bankEntity: "BANKODEMIA"),Account(clientName: "Daniel De San Pedro", accountNumber: "1234567", bankEntity: "BANKODEMIA")]

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
        titleLabel.text = "ENVIAR DINERO"
        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height/10),
        titleLabel.leftAnchor.constraint(equalTo: backButton.leftAnchor, constant: Constants.padding)
        ])
        
        self.view.addSubview(addAccountButton)
        addAccountButton.addTarget(self, action: #selector(tapToAddAccount), for: .touchUpInside)
        NSLayoutConstraint.activate([addAccountButton.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height/11.5), addAccountButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
        addAccountButton.translatesAutoresizingMaskIntoConstraints = false
        addAccountButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        addAccountButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        tableView = UITableView(frame: CGRect(x: 0, y: Constants.height/4, width: Constants.width, height: Constants.height))
        tableView.backgroundColor = .clear
        tableView.center.x = self.view.center.x
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    //MARK: Funcionalidad Botones
    
    @objc func tapToGoBack(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func tapToAddAccount(){
        toAddAccount()
    }
    
    func toAddAccount() {
        let agregarTarjetaViewController = AgregarTarjetaViewController()
        agregarTarjetaViewController.modalPresentationStyle = .fullScreen
        self.present(agregarTarjetaViewController, animated: true, completion: nil)
    }

}

extension EnviarViewController : UITableViewDelegate{
    // numero de secciones que vamos a usar
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = DetailAccountViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        
    }
    
}

// MARK: - UITableDataSource

extension EnviarViewController : UITableViewDataSource{
    // numero de celdas por cada secciones que tiene cada categoria
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    //tipo de celda que se mostrara
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cuenta = dataSource?[indexPath.row] else { return UITableViewCell()}
        let cell = AccountTableViewCell(cuenta: cuenta)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height * 0.1
    }
}
