//
//  Notes.swift
//  Assignment_10
//
//  Created by DCS on 11/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Notes: UIViewController {

    private let tableView = UITableView()
    private var array1 = [String]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        array1 = FMS.getFirstList()
       // tableView.reloadData()
    }
    
    
    private let tool:UIToolbar = {
        let t = UIToolbar()
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNotes))
        let s = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil )
        t.items = [s,add]
        return t
    }()
    
    @objc private func addNotes(){
        let newpage = Pages()
        navigationController?.pushViewController(newpage, animated: true)
        //self.present(newpage, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // let temp = FMS.getFirstList()
        
        view.backgroundColor = .white
        let uname = UserDefaults.standard.string(forKey: "username")
        title = uname
        view.addSubview(tableView)
        view.addSubview(tool)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tool.frame = CGRect(x: 0, y: 50, width: view.frame.width, height: 50)
        tableView.frame = CGRect(x: 0, y: 80, width: view.frame.size.width, height: view.frame.size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    }


}

extension Notes: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let names = array1[indexPath.row]
        cell.textLabel?.text = "\(names)"
        //        cell.setcell(title: array[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newpage = Pages()
        newpage.name1 = array1[indexPath.row]
        navigationController?.pushViewController(newpage, animated: true)
        //self.present(newpage, animated: true, completion: nil)
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
                self.array1.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
        let filepath = FMS.getDocDir().appendingPathComponent(array1[indexPath.row])
        
        do{
            try FileManager.default.removeItem(at: filepath)
        }
        catch{
            print(error)
        }
        
    }
}
