//
//  fetchCars.swift
//  ArchitectureApiCars
//
//  Created by André Brilho on 05/03/19.
//  Copyright © 2019 André Brilho. All rights reserved.
//

import Foundation

protocol CarsProtocol {
    func presentTableData(carList:[Carro])
    func presentAlertError(mensagem:String, titleMessage:String)
}

class CarrosPresenter {
    
    var protocolCar:CarsProtocol
    
    init(protocolCar:CarsProtocol) {
        self.protocolCar = protocolCar
        getCars()
    }
    
    func getCars() {
        ApiCarros.fetchCars { (result) in
            switch result {
            case let .Success(result):
                self.protocolCar.presentTableData(carList: (result?.carro)!)
            case let .Error(error):
                self.protocolCar.presentAlertError(mensagem: "Ops", titleMessage: error.localizedDescription)
            }
        }
    }
}
