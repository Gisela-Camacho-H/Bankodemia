

import UIKit

class WelcomeViewController: UIViewController {

    var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        label = UILabel(frame: CGRect(x: 30, y: 50, width: 1000, height: 599))
        label?.text = "!Adios a las complicaciones!"
        label?.font = UIFont(name: "Poppins-SemiBold", size: 20)
        view.addSubview(label!)
    }
    


}
