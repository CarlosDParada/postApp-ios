//
//  Injector.swift
//  Injector
//
//  Created by Carlos Parada on 6/02/21.
//

import Foundation
import Domain
import Data

public final class Injector {
    /// func provideGetPostListUsecase
    /// - Returns: Protocolo del Domain
    public static func provideGetPostListUsecase() -> GetPostListUseCaseContract {
        return GetPostListUseCase(provider: providePostProvider())
    }
}

private extension Injector {
    /// Func para el manejo del contract
    /// - Returns: Retorna el Provider
    static func providePostProvider() -> PostAppProviderContract {
        return PostAppProvider()
    }

}
