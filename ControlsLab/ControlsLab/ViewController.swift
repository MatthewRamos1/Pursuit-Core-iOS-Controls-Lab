import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var suitSelection: UISegmentedControl!
    
    @IBOutlet weak var valueStep: UIStepper!
    
    @IBOutlet var cardValueLabels: [UILabel]!
    
    @IBOutlet var suitValueLabels: [UILabel]!
    
    
    var cardValue: Int = 7 {
        didSet {
            if cardValue <= 10 {
                for cardVal in cardValueLabels {
                cardVal.text = String(cardValue)
                }
            } else if cardValue > 10 {
                switch cardValue {
                case 11:
                    for cardVal in cardValueLabels {
                    cardVal.text = "J"
                    }
                case 12:
                    for cardVal in cardValueLabels {
                    cardVal.text = "Q"
                    }
                case 13:
                    for cardVal in cardValueLabels {
                    cardVal.text = "K"
                    }
                case 14:
                    for cardVal in cardValueLabels {
                    cardVal.text = "A"
                    }
                default:
                    return
                }
            }
        }
    }
    
    var suitIndex: Int = 0 {
        didSet {
            switch suitSelection.selectedSegmentIndex {
            case 0:
                for suitVal in suitValueLabels {
                suitVal.text = "♠️"
                }
            case 1:
                for suitVal in suitValueLabels {
                suitVal.text = "♥️"
                }
            case 2:
                for suitVal in suitValueLabels {
                suitVal.text = "♣️"
                }
            case 3:
                for suitVal in suitValueLabels {
                suitVal.text = "♦️"
                }
            default:
                return
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureStepper()
    }
    
    func configureStepper () {
        valueStep.minimumValue = 2
        valueStep.maximumValue = 14
        valueStep.stepValue = 1
        valueStep.value = 7
        
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        cardValue = Int(sender.value)
    }
    @IBAction func suitSelected(_ sender: UISegmentedControl) {
        suitIndex = sender.selectedSegmentIndex
    }
}

