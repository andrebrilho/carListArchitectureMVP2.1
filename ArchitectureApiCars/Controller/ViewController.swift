//
//  ViewController.swift
//  ArchitectureApiCars
//
//  Created by André Brilho on 20/02/2019.
//  Copyright © 2019 André Brilho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CarsProtocol {
    
    @IBOutlet weak var tbl: UITableView!
    var tableViewCarDatasourceAndDelegate:TableCarDatasourceAndDelegate?
    var carrosPresenter:CarrosPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewCarDatasourceAndDelegate = TableCarDatasourceAndDelegate(infoTbl: tbl, viewControllerToPress: self)
        carrosPresenter = CarrosPresenter.init(protocolCar: self)
        
    }
    
    func presentTableData(carList: [Carro]) {
        self.tableViewCarDatasourceAndDelegate?.dados = carList
        self.tbl.reloadData()
    }
    
    func presentAlertError(mensagem: String, titleMessage: String) {
        Alert.showAlertError(mensagemErro: mensagem, titleMsgErro: titleMessage, view: self)
    }
}

