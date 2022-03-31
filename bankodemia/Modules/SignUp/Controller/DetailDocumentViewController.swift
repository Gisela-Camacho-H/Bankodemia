//
//  DetailDocumentViewController.swift
//  bankodemia
//
//  Created by GiselaCamacho on 16/03/22.
//

import UIKit

class DetailDocumentViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // labels
    lazy var mainLabel: UIView.mainTextLabel = UIView.mainTextLabel()
    lazy var titleLable: UIView.titleButtonLabel = UIView.titleButtonLabel()
    
    // buttons
    lazy var backButton: UIView.backArrowButton = UIView.backArrowButton()
    lazy var continuarButton: UIView.cyanButton = UIView.cyanButton()
    lazy var documentoImageButton: UIButton = UIButton()
    
    let imagePicker: UIImagePickerController = UIImagePickerController()
    
    lazy var documentoImage: UIImageView = UIImageView()
    lazy var bankodemiaLogo: UIImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        imagePicker.delegate = self
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
        backButton.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height/15),
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        
        self.view.addSubview(titleLable)
        titleLable.text = ""
        NSLayoutConstraint.activate([titleLable.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height/10),
        titleLable.leftAnchor.constraint(equalTo: backButton.leftAnchor, constant: Constants.padding)
        ])
        
        
        self.view.addSubview(mainLabel)
        mainLabel.text = "Dale permiso a Bankodemia para utilizar la cámara. Asegurate de tener buena luz y enfocar bien tu documento de frente"
        NSLayoutConstraint.activate([mainLabel.topAnchor.constraint(equalTo: backButton.topAnchor, constant: Constants.buttonSize),
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        mainLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
        self.view.addSubview(documentoImage)
        documentoImage.backgroundColor = UIColor.lightGrayColor
        documentoImage.layer.borderColor = UIColor.labelDarkGray.cgColor
        documentoImage.layer.borderWidth = 1
        documentoImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([documentoImage.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: Constants.buttonSize),
        documentoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        documentoImage.heightAnchor.constraint(equalToConstant: Constants.height/4),
        documentoImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.80)
        ])
        
        view.addSubview(documentoImageButton)
        documentoImageButton.setTitle("Arrastra tu archivo aquí o subelo desde tu ORDENADOR", for: .normal)
        documentoImageButton.setTitleColor(UIColor.bankodemiaBlack, for: .normal)
        documentoImageButton.titleLabel?.apply14Font()
        documentoImageButton.titleLabel?.numberOfLines = 0
        documentoImageButton.titleLabel?.textAlignment = .center
        documentoImageButton.translatesAutoresizingMaskIntoConstraints = false
        documentoImageButton.addTarget(self, action: #selector(seleccionaFoto), for: .touchUpInside)
        NSLayoutConstraint.activate([documentoImageButton.topAnchor.constraint(equalTo: documentoImage.topAnchor, constant: Constants.buttonSize + 50),
        documentoImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        documentoImageButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.60)
        ])
        
        
        view.addSubview(continuarButton)
        continuarButton.setTitle("Subir Información", for: .normal)
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
        let loginViewController = ContrasenaViewController()
        loginViewController.modalPresentationStyle = .fullScreen
        self.present(loginViewController, animated: true, completion: nil)
    }
    
    @objc func tapToGoBack(){
        goBack()
    }
    
    func goBack() {
        dismiss(animated: true)
    }
    
    @objc func seleccionaFoto(_ sender: AnyObject){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
            
            present(imagePicker, animated: true, completion: nil)
            documentoImageButton.setTitleColor(.clear, for: .normal)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imagenSeleccionada: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            documentoImage.image = imagenSeleccionada
            
            if imagePicker.sourceType == .camera {
                UIImageWriteToSavedPhotosAlbum(imagenSeleccionada, nil, nil, nil)
            }
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
}

