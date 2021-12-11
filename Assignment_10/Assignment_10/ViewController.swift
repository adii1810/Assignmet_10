//
//  ViewController.swift
//  Recipe
//
//  Created by MyMAC on 08/12/21.
//  Copyright © 2021 MyMAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let backImages:UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "r")
        return img
    }()
    
    private let txtlbl:UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "GillSans-Italic", size: 80)
        lbl.text = "Login"
        lbl.textColor = .white
        return lbl
    }()
    
    private let txtuser:UITextField = {
        let txt = UITextField()
        txt.textAlignment = .center
        txt.font = UIFont(name: "Thanburi", size: 70)
        txt.layer.cornerRadius = 3
        txt.placeholder = "Username"
        txt.textColor = .white
        txt.backgroundColor = .lightGray
        return txt
    }()
    
    private let txtpass:UITextField = {
        let txt = UITextField()
        txt.textAlignment = .center
        txt.font = UIFont(name: "Thanburi", size: 70)
        txt.layer.cornerRadius = 3
        txt.placeholder = "Passwprd"
        txt.textColor = .white
        txt.backgroundColor = .lightGray
        return txt
    }()
    
    private let subBtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("Login", for: .normal)
        btn.addTarget(self, action: #selector(Login), for: .touchUpInside)
        btn.backgroundColor = .green
        btn.layer.cornerRadius = 10
        
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        view.addSubview(txtlbl)
        view.addSubview(txtuser)
        view.addSubview(txtpass)
        view.addSubview(subBtn)
    }
    
    @objc private func Login(){
        UserDefaults.standard.setValue(txtuser.text, forKey: "username")
        self.dismiss(animated:true)
        let vc = Notes()
        navigationController?.pushViewController(vc, animated: true)
        //present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //backImages.frame = CGRect(x:70, y: 100, width: 300, height: 170)
        txtlbl.frame = CGRect(x:100, y: 100, width: 300, height: 100)
        txtuser.frame = CGRect(x:20, y: 250, width: view.frame.width - 40, height: 50)
        txtpass.frame = CGRect(x:20, y: 310, width: view.frame.width - 40, height: 50)
        subBtn.frame = CGRect(x: 50, y: 380, width: view.frame.width - 100, height: 50)
    }
    
    
}

