//
//  UsuarioService.swift
//  Multi Inteligencia Coletiva
//
//  Created by Lucas Rocha on 08/10/17.
//  Copyright © 2017 Lucas Tavares. All rights reserved.
//

import UIKit

class UsuarioService: NSObject {
    var serviceUrl = URL(string: "https://yg-api-multi-temp.herokuapp.com/usuario")!
    
    func cadastrar(_ usuario: Usuario, depois callback: HttpRequestCallback) {
        HttpService
            .post(usuario.description, to: serviceUrl, then: callback)
    }
    
    func logar(_ usuario: Usuario, depois callback: HttpRequestCallback) {
        serviceUrl.appendPathComponent("/auth")
        HttpService
            .post(usuario.description, to: serviceUrl, then: callback)
    }
    
    func getUsuarioLogado(depois callback: HttpRequestCallback) {
        serviceUrl.appendPathComponent("/logado")
        HttpService
            .get(from: serviceUrl, then: callback, requireAuth: true)
    }
}
