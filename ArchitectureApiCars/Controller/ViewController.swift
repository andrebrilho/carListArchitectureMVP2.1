//
//  ViewController.swift
//  ArchitectureApiCars
//
//  Created by André Brilho on 20/02/2019.
//  Copyright © 2019 André Brilho. All rights reserved.
//

import UIKit

protocol updatingViewFromApiProtocol {
    var listCars:[Carro] {get set}
    func showError(message:String, title:String)
}

class ViewController: UIViewController, updatingViewFromApiProtocol {
    
    func showError(message: String, title: String) {
        Alert.showAlertError(mensagemErro: message, titleMsgErro: title, view: self)
    }
    
    var tableCarDataSourceAndDelegate:TableCarDatasourceAndDelegate?
    var carrosProtocol:CarsProtocol = CarrosPresenter()
    
    var listCars: [Carro] = []{
        didSet{
            tableCarDataSourceAndDelegate?.dados = listCars
            tbl.reloadData()
        }
    }
    
    @IBOutlet weak var tbl: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carrosProtocol.viewControllerReference = self
        carrosProtocol.getCars()
        tableCarDataSourceAndDelegate = TableCarDatasourceAndDelegate(infoTbl: tbl, viewControllerToPress: self)
    }
    

}

