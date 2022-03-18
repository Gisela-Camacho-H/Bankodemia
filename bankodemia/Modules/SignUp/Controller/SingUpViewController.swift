
import UIKit

class SingUpViewController: UIViewController {
    
    // labels
    lazy var mainLabel: UILabel = UILabel()
    lazy var subtitlelabel: UILabel = UILabel()
    lazy var bottomLabel: UILabel = UILabel()
    lazy var linkLabel: UILabel = UILabel()
    
    // buttons
    private lazy var backButton: UIButton = UIButton()
    lazy var continuarButton: UIButton = UIButton()
    
    lazy var correoTextField: UITextField = UITextField()
    lazy var bankodemiaLogo: UIImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()
    }
    
    func initUI(){
        
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
        backButton.backgroundColor = .clear
        backButton.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        backButton.tintColor = UIColor.labelDarkGray
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(tapToGoBack), for: .touchUpInside)
        NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.buttonSize + 20),
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        
        self.view.addSubview(mainLabel)
        mainLabel.text = "Aquí recibirás comprobantes de tus movimientos e información sobre tu cuenta"
        self.mainLabel.adjustsFontSizeToFitWidth = true
        mainLabel.apply16Font()
        mainLabel.numberOfLines = 0
        mainLabel.textAlignment = .left
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([mainLabel.topAnchor.constraint(equalTo: backButton.topAnchor, constant: Constants.buttonSize),
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        mainLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90)
        ])
        
        self.view.addSubview(subtitlelabel)
        subtitlelabel.text = "Escribe tu correo"
        subtitlelabel.apply14Font()
        subtitlelabel.applyDrakGrayColor()
        subtitlelabel.textAlignment = .left
        subtitlelabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([subtitlelabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: Constants.padding),
        subtitlelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        subtitlelabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90)
        ])
        
        self.view.addSubview(correoTextField)
        correoTextField.layer.borderColor = UIColor.bankodemiaCyan.cgColor
        correoTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        correoTextField.layer.cornerRadius = 7
        correoTextField.layer.borderWidth = 1
        correoTextField.backgroundColor = .clear
        correoTextField.placeholder = "mels@gmail.com"
        correoTextField.textAlignment = NSTextAlignment.left
        correoTextField.keyboardType = UIKeyboardType.default
        correoTextField.autocorrectionType = UITextAutocorrectionType.no
        correoTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: correoTextField.frame.height))
        correoTextField.leftView = paddingView
        correoTextField.leftViewMode = UITextField.ViewMode.always
        correoTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([correoTextField.topAnchor.constraint(equalTo: subtitlelabel.bottomAnchor, constant: 5),
            correoTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            correoTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
        
        
        view.addSubview(continuarButton)
        continuarButton.setTitle("Continuar", for: .normal)
        continuarButton.backgroundColor = UIColor.bankodemiaCyan
        continuarButton.setTitleColor(.white, for: .normal)
        continuarButton.layer.cornerRadius = Constants.cornerRadius
        continuarButton.addTarget(self, action: #selector(onSignUpButtonTap), for: .touchUpInside)
        
        continuarButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([continuarButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -50),
        continuarButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        continuarButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
        self.view.addSubview(linkLabel)
        linkLabel.translatesAutoresizingMaskIntoConstraints = false
        linkLabel.text = "Aviso de privacidad"
        linkLabel.textAlignment = .center
        linkLabel.textColor = UIColor.bankodemiaBlue
        
        NSLayoutConstraint.activate([linkLabel.bottomAnchor.constraint(equalTo: continuarButton.topAnchor, constant: -20),
        linkLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        linkLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90)
        ])
        
        self.view.addSubview(bottomLabel)
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.text = "Al tocar continuar aceptas nuesto"
        bottomLabel.numberOfLines = 0
        bottomLabel.textAlignment = .center
        bottomLabel.textColor = UIColor.bankodemiaBlack
        
        NSLayoutConstraint.activate([bottomLabel.bottomAnchor.constraint(equalTo: linkLabel.topAnchor, constant: -5),
        bottomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        bottomLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90)
        ])
    }

    @objc func onSignUpButtonTap(){
        goToSignUp()
    }
    
    func goToSignUp() {
        let loginViewController = DatosViewController()
        loginViewController.modalPresentationStyle = .fullScreen
        self.present(loginViewController, animated: true, completion: nil)
    }
    
    @objc func tapToGoBack(){
        goBack()
    }
    
    func goBack() {
        dismiss(animated: true)
    }
}
