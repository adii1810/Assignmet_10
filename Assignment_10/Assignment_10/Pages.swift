//
//  Pages.swift
//  Assignment_10
//
//  Created by DCS on 11/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Pages: UIViewController {

    var name1 : String?
    
    private let mytextfield:UITextField={
        let textfield = UITextField()
        textfield.placeholder = ""
        textfield.textAlignment = .center
        textfield.borderStyle = .roundedRect
        textfield.backgroundColor = .green
        return textfield
    }()
    private let contenttextview:UITextView={
        let textfield = UITextView()
        textfield.text = ""
        textfield.textAlignment = .center
        
        textfield.backgroundColor = .green
        return textfield
    }()
    
    private let saveBtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("Save", for: .normal)
        btn.addTarget(self, action: #selector(savenote), for: .touchUpInside)
        btn.tintColor = .white
        btn.backgroundColor = .green
        return btn
    }()
    
    @objc private func savenote(){
        let name = mytextfield.text!
        let contemt = contenttextview.text!
        let path = FMS.getDocDir().appendingPathComponent("\(name).txt")
        
        do{
            try contemt.write(to: path, atomically: true, encoding: .utf8)
            
            mytextfield.text = ""
            contenttextview.text = ""
        }catch{
            print(error)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(mytextfield)
        view.addSubview(contenttextview)
        view.addSubview(saveBtn)
        
        if let emp = name1{
            mytextfield.text = emp            
        }
        
    }
    override func viewDidLayoutSubviews() {
        mytextfield.frame = CGRect(x: 40, y: 100, width: view.width-80, height: 40)
        contenttextview.frame = CGRect(x: 40, y: mytextfield.bottom+20, width: view.width-80, height: 300)
        saveBtn.frame = CGRect(x: 40, y: contenttextview.bottom + 20, width: view.width-80, height: 30)
    }
    
    

}
