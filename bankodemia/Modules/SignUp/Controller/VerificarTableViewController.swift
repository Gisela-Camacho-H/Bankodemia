//
//  VerificarTableViewController.swift
//  bankodemia
//
//  Created by GiselaCamacho on 16/03/22.
//

import UIKit

class VerificarTableViewController: UIViewController {
    
    // labels
    lazy var bottomLabel: UILabel = UILabel()
    lazy var mainLabel: UIView.mainTextLabel = UIView.mainTextLabel()
    lazy var titleLable: UIView.titleButtonLabel = UIView.titleButtonLabel()
    
    private lazy var backButton: UIView.backArrowButton = UIView.backArrowButton()
    
    lazy var tableView : UITableView = UITableView()
    lazy var bankodemiaLogo: UIImageView = UIImageView()
    
    var documentArray = ["INE", "Documento Migratorio", "Pasaporte"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI(){
        
        view.applyWhiteBackgroundColor()
        
        self.view.addSubview(bankodemiaLogo)
        bankodemiaLogo.translatesAutoresizingMaskIntoConstraints = false
        bankodemiaLogo.image = UIImage(named: "smallLogo")
        NSLayoutConstraint.activate([bankodemiaLogo.topAnchor.constraint(equalTo:
                view.topAnchor, constant: Constants.height / 14),
        bankodemiaLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        bankodemiaLogo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
        bankodemiaLogo.heightAnchor.constraint(equalToConstant: Constants.height / 20),
        ])
        
        self.view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(tapToGoBack), for: .touchUpInside)
        NSLayoutConstraint.activate([
        backButton.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height/10),
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        
        self.view.addSubview(titleLable)
        titleLable.text = "IDENTIDAD"
        NSLayoutConstraint.activate([titleLable.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height/10),
        titleLable.leftAnchor.constraint(equalTo: backButton.leftAnchor, constant: Constants.padding)
        ])
        
        self.view.addSubview(mainLabel)
        mainLabel.text = "Seleccionando el tipo de documento que deseas fotografiar"
        NSLayoutConstraint.activate([mainLabel.topAnchor.constraint(equalTo: backButton.topAnchor, constant: Constants.buttonSize),
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        mainLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
        self.view.addSubview(bottomLabel)
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.text = "Conoce cómo protegemos tus documentos"
        bottomLabel.numberOfLines = 0
        bottomLabel.textAlignment = .center
        bottomLabel.textColor = UIColor.labelDarkGray
        
        NSLayoutConstraint.activate([bottomLabel.bottomAnchor.constraint(equalTo:view.bottomAnchor, constant: -Constants.buttonSize - 30),
        bottomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        bottomLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
        
        tableView = UITableView(frame: CGRect(x: 10, y: Constants.height/4 + 30 , width: Constants.width - 20, height: 200))
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self //en donde se va a definir (en si mismo)
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    @objc func tapToGoBack(){
        goBack()
    }
    
    func goBack() {
        dismiss(animated: true)
    }
}


extension VerificarTableViewController : UITableViewDelegate{
    // numero de secciones que vamos a usar
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = DetailDocumentViewController()
        //vc.product = producto
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
    
}

// MARK: - UITableDataSource

    extension VerificarTableViewController : UITableViewDataSource{
    // numero de celdas por cada secciones que tiene cada categoria
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documentArray.count
  }
    //tipo de celda que se mostrara
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = documentArray[indexPath.row]
        cell.textLabel?.textColor = UIColor.bankodemiaBlack
        cell.textLabel?.backgroundColor = .white
        
        return cell
    }
    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 40
        }
    }
