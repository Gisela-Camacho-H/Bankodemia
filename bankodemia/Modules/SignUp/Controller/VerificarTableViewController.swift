//
//  VerificarTableViewController.swift
//  bankodemia
//
//  Created by GiselaCamacho on 16/03/22.
//

import UIKit

class VerificarTableViewController: UIViewController {
    
    private lazy var backButton: UIButton = UIButton()
    
    // labels
    lazy var escribelosLabel: UILabel = UILabel()
    lazy var estaLabel: UILabel = UILabel()
    
    var tableView : UITableView = UITableView()
    
    var documentArray = ["INE", "Documento Migratorio", "Pasaporte"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()

        // Do any additional setup after loading the view.
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
        escribelosLabel.text = "Seleccionando el tipo de documento que deseas fotografiar"
        self.escribelosLabel.adjustsFontSizeToFitWidth = true
        escribelosLabel.apply16Font()
        escribelosLabel.numberOfLines = 0
        escribelosLabel.textAlignment = .left
        escribelosLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([escribelosLabel.topAnchor.constraint(equalTo: backButton.topAnchor, constant: Constants.buttonSize),
        escribelosLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        escribelosLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.80)
        ])
        
        self.view.addSubview(estaLabel)
        estaLabel.translatesAutoresizingMaskIntoConstraints = false
        estaLabel.text = "Conoce cómo protegemos tus documentos"
        estaLabel.numberOfLines = 0
        estaLabel.textAlignment = .center
        estaLabel.textColor = UIColor.labelDarkGray
        
        NSLayoutConstraint.activate([estaLabel.bottomAnchor.constraint(equalTo:view.bottomAnchor, constant: -Constants.buttonSize - 30),
                                     estaLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor), estaLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90)
        ])
        
        
        tableView = UITableView(frame: CGRect(x: 10, y: Constants.height/3 , width: Constants.width - 20, height: 200))
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
        
        return cell
    }
    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 40
        }
    }