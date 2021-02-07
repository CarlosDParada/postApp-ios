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
    public static func provideGetPostListUsecase() -> GetPostListUseCaseContract {
        return GetPostListUseCase(provider: providePostProvider())
    }
}

private extension Injector {
    static func providePostProvider() -> PostAppProviderContract {
        return PostAppProvider()
    }

}
