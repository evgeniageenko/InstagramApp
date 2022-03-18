//
//  CommentViewController.swift
//  TMS - Lesson 12
//
//  Created by Евгений Агеенко on 3.06.21.
//

import UIKit

protocol CommentViewControllerDelegate: AnyObject {
    func comentSaved(identifier: Int, comment: String)
}


class CommentViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    weak var delegate: CommentViewControllerDelegate?
    
    let identifier: Int
    
    init(id: Int) {
        self.identifier = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        let rightButton = UIButton(type: .system)
                rightButton.setTitle("Закрыть", for: .normal)
                rightButton.setTitleColor(.black, for: .normal)
                rightButton.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
                rightButton.contentHorizontalAlignment = .right
                rightButton.isEnabled = false
                rightButton.sizeToFit()
                
                navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
        
    }
    
    
    @objc func closeAction() {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveAction(_ sender: Any) {
        delegate?.comentSaved(identifier: identifier, comment: textField.text!)
        dismiss(animated: true, completion: nil)
    }
}
