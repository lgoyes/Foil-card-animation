//
//  BaseInteractor.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/27/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import Foundation

class BaseInteractor<Response, Params> {
    var parameters: Params?
    var onSuccess: ((Response) -> Void)?
    var onError: ((Error) -> Void)?

    func set(params: Params) -> BaseInteractor {
        self.parameters = params
        return self
    }

    func set(onSuccess: @escaping (Response) -> Void) -> BaseInteractor {
        self.onSuccess = onSuccess
        return self
    }

    func set(onError: @escaping (Error) -> Void) -> BaseInteractor {
        self.onError = onError
        return self
    }
    
    func execute() {
        buildUseCase()
    }
    
    func buildUseCase() {
        
    }
}
