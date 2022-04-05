//
//  HomeViewController.swift
//  bankodemia
//
//  Created by GiselaCamacho on 26/02/22.
//

import UIKit

class InicioViewController: UIViewController ,  UserDetailViewControllerProtocol{
    
    
    var viewModel: UserDetailViewModelProtocol?
    // UILabel
    lazy var bankodemiaLogo: UIImageView = UIImageView()
    lazy var profileIcon: UIImageView = UIImageView()
    lazy var helpIcon: UIImageView = UIImageView()
    var dineroLabel: UILabel = UILabel()
    var cantidadLabel: UILabel = UILabel()
    var sendButton: UIButton = UIButton ()
    var getButton: UIButton = UIButton ()
    lazy var tableView = UITableView()
    public var dataSource: [TransactionObject]? = [TransactionObject(transactionConcept: "Croquetas para el perrito", transactionHour: "7:00 p.m.", transactionQuantity: "+ $ 50.00"),TransactionObject(transactionConcept: "Croquetas para el gatito", transactionHour: "8:18 p.m.", transactionQuantity: "+ $ 88.00"),TransactionObject(transactionConcept: "Renta del mes", transactionHour: "9:22 p.m.", transactionQuantity: "+ $ 1999.00")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()
        viewModel?.fetchUserData()
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

        view.addSubview(dineroLabel)
        dineroLabel.frame = CGRect(x: 0, y: 0, width: 144, height: 21)
        dineroLabel.backgroundColor = .white
        dineroLabel.textColor = UIColor(red: 0.384, green: 0.384, blue: 0.384, alpha: 1)
        dineroLabel.font = UIFont(name: "Poppins-Medium", size: 14)
        dineroLabel.textAlignment = .center
        dineroLabel.attributedText = NSMutableAttributedString(string: "DINERO DISPONIBLE", attributes: [NSAttributedString.Key.kern: 0.7])
        dineroLabel.translatesAutoresizingMaskIntoConstraints = false
        dineroLabel.widthAnchor.constraint(equalToConstant: 144).isActive = true
        dineroLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        dineroLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22).isActive = true
        dineroLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 109).isActive = true
        
        view.addSubview(cantidadLabel)
        cantidadLabel.frame = CGRect(x: 0, y: 0, width: 85, height: 30)
        cantidadLabel.backgroundColor = .clear
        cantidadLabel.textColor = UIColor(red: 0.087, green: 0.087, blue: 0.087, alpha: 1)
        cantidadLabel.font = UIFont(name: "Poppins-SemiBold", size: 20)
        cantidadLabel.textAlignment = .center
        cantidadLabel.translatesAutoresizingMaskIntoConstraints = false
        cantidadLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        cantidadLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        cantidadLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cantidadLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 152).isActive = true
        
        view.addSubview(sendButton)
        sendButton.setTitle("Enviar", for: .normal)
        sendButton.layer.borderColor = UIColor.bankodemiaCyan.cgColor
        sendButton.setTitleColor(UIColor.bankodemiaCyan, for: .normal)
        sendButton.layer.borderWidth = 2
        sendButton.backgroundColor = .white
        sendButton.titleLabel!.font = UIFont(name: "Poppins-Medium", size: 18)
        sendButton.addTarget(self, action: #selector(onSendButtonTap), for: .touchUpInside)
        sendButton.setTitleColor(.bankodemiaCyan, for: .normal)
        sendButton.layer.cornerRadius = 5
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([sendButton.topAnchor.constraint(equalTo: cantidadLabel.bottomAnchor, constant: 35),
        sendButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
        sendButton.widthAnchor.constraint(equalToConstant: 130)
        ])

        view.addSubview(getButton)
        getButton.setTitle("Recibir", for: .normal)
        getButton.layer.borderColor = UIColor.bankodemiaCyan.cgColor
        getButton.setTitleColor(UIColor.bankodemiaCyan, for: .normal)
        getButton.layer.borderWidth = 2
        getButton.backgroundColor = .bankodemiaCyan
        getButton.titleLabel!.font = UIFont(name: "Poppins-Medium", size: 18)
        //getButton.addTarget(self, action: #selector(onSendButtonTap), for: .touchUpInside)
        getButton.setTitleColor(.white, for: .normal)
        getButton.layer.cornerRadius = 5
        getButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([getButton.topAnchor.constraint(equalTo: cantidadLabel.bottomAnchor, constant: 35),
        getButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        getButton.widthAnchor.constraint(equalToConstant: 130)
        ])
        
        tableView = UITableView(frame: CGRect(x: 0, y: Constants.height/2, width: Constants.width, height: Constants.height))
        tableView.backgroundColor = .clear
        tableView.center.x = self.view.center.x
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

    }
    
    // MARK: Funcionalidades Botones
    
    @objc func onRecibirButtonTap(){
        goToDetalle()
    }
    
    func goToDetalle() {
        let detalleViewController = DetalleViewController()
        detalleViewController.modalPresentationStyle = .fullScreen
        self.present(detalleViewController, animated: true, completion: nil)
    }
    
    
    @objc func onSendButtonTap(){
        goToSend()
    }
    
    func goToSend() {
        let enviarViewController = EnviarViewController()
        enviarViewController.modalPresentationStyle = .fullScreen
        self.present(enviarViewController, animated: true, completion: nil)
    }
    
    func setViewModelConnection(_ viewModel: UserDetailViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    func updateUIWithInfo(balance: Double) {
        cantidadLabel.text = String(balance)
        print(balance)
    }
    
    func dismissToLogin() {
        self.dismiss(animated: true, completion: nil)
    }
}


extension InicioViewController : UITableViewDelegate{
    // numero de secciones que vamos a usar
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = DetailTransactionViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        
    }
    
}

// MARK: - UITableDataSource

extension InicioViewController : UITableViewDataSource{
    // numero de celdas por cada secciones que tiene cada categoria
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    //tipo de celda que se mostrara
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let transaccion = dataSource?[indexPath.row] else { return UITableViewCell()}
        let cell = TransactionTableViewCell(transaccion: transaccion)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height * 0.1
    }
}

