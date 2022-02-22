

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.applyWhiteBackgroundColor()
        var a : UILabel = UILabel(frame: CGRect(x: 20, y: 50, width: 200, height: 50))
        a.text = "test"
        a.applyTitleFont()
        view.addSubview(a)
    }
    


}
