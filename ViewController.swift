//
//  ViewController.swift
//  Firebaseseconddemo
//
//  Created by Jomms on 08/01/21.
//

import UIKit
import Firebase
import CoreData

class ViewController: UIViewController {
   
    private let database = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  FirebaseApp.configure()
        
        let btn = UIButton(frame:CGRect(x:20, y: 200, width: view.frame.size.width - 40, height: 50))
        btn.setTitle("Add entry", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .blue
        view.addSubview(btn)
        btn.addTarget(self, action: #selector(addnewentry), for: .touchUpInside)
       
        database.child("something").observeSingleEvent(of: .value, with:{DataSnapshot in
            guard let value = DataSnapshot.value as?
            [String:Any] else
            {
                return
            }
            print("value:\(value)")
        })
        
    }
    @objc func addnewentry(){
        let object:[String:Any] = ["name":"jomms" as NSObject,"age":30]
        database.child("something").setValue(object)
       
        
    }

}

