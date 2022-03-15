
import UIKit

class SingUpViewController: UIViewController {
    
    lazy var aquiLabel: UILabel = UILabel()
    lazy var escribelabel: UILabel = UILabel()
    
    private lazy var backButton: UIButton = UIButton()
    lazy var continuarButton: UIButton = UIButton()
    
    lazy var correoTextField: UITextField = UITextField()

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
        
        self.view.addSubview(aquiLabel)
        aquiLabel.text = "Aquí recibirás comprobantes de tus movimientos e información sobre tu cuenta"
        self.aquiLabel.adjustsFontSizeToFitWidth = true
        aquiLabel.apply16Font()
        aquiLabel.numberOfLines = 0
        aquiLabel.textAlignment = .left
        aquiLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([aquiLabel.topAnchor.constraint(equalTo: backButton.topAnchor, constant: Constants.buttonSize),
                                     aquiLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     aquiLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.80)
        ])
        
        self.view.addSubview(escribelabel)
        escribelabel.text = "Escribe tu correo"
        escribelabel.apply14Font()
        escribelabel.applyDrakGrayColor()
        escribelabel.textAlignment = .left
        escribelabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([escribelabel.topAnchor.constraint(equalTo: aquiLabel.bottomAnchor, constant: Constants.buttonSize),
                                     escribelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     escribelabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.80)
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
        
        NSLayoutConstraint.activate([correoTextField.topAnchor.constraint(equalTo: escribelabel.topAnchor, constant: Constants.padding + 10),
            correoTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            correoTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
        
        
        view.addSubview(continuarButton)
        continuarButton.setTitle("Continuar", for: .normal)
        continuarButton.backgroundColor = UIColor.bankodemiaCyan
        continuarButton.setTitleColor(.white, for: .normal)
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
