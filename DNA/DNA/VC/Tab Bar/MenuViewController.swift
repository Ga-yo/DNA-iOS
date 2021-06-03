//
//  MenuVC.swift
//  DNA
//
//  Created by 장서영 on 2021/02/11.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var AButton: UIButton!
    @IBOutlet weak var TButton: UIButton!
    @IBOutlet weak var GButton: UIButton!
    @IBOutlet weak var CButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setNavigationBar()
        shadow(AButton)
        shadow(TButton)
        shadow(GButton)
        shadow(CButton)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
