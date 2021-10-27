//
//  UserService.swift
//  Viper-Demo
//
//  Created by Zvonimir Medak on 05.10.2021..
//

import Foundation
import Japx
import RxSwift
import Alamofire

class UserService {

    static let shared = UserService()

    private let userDefaults: UserDefaults

    private init() {
        userDefaults = .standard
    }

    func login(with email: String, _ password: String) -> Single<User> {
        Single.create { single in
            var params = Parameters()
            params["email"] = email
            params["password"] = password
            let request = AF.request(
                Constants.API.login,
                method: .post,
                parameters: params,
                encoding: URLEncoding.default
            ).validate().responseData { [unowned self] data in
                saveHeaders(from: data.response)
                guard let data = data.data else {
                    single(.failure(data.error ?? AFError.explicitlyCancelled))
                    return
                }
                do {
                    let user = try JapxDecoder().decode(AuthResponse.self, from: data).user
                    single(.success(user))
                } catch {
                    single(.failure(error))
                }
            }

            return Disposables.create {
                request.cancel()
            }
        }
    }

    func register(with email: String, _ password: String) -> Single<User> {
        Single.create { single in
            var params = Parameters()
            params["email"] = email
            params["password"] = password
            let request = AF.request(
                Constants.API.register,
                method: .post,
                parameters: params,
                encoding: URLEncoding.default
            ).validate().responseData { data in
                guard let data = data.data else {
                    single(.failure(data.error ?? AFError.explicitlyCancelled))
                    return
                }
                do {
                    let user = try JapxDecoder().decode(AuthResponse.self, from: data).user
                    single(.success(user))
                } catch {
                    single(.failure(error))
                }
            }

            return Disposables.create {
                request.cancel()
            }
        }
    }

    func rememberUser() {
        userDefaults.set(true, forKey: Constants.UserDefaults.remember)
    }

    func removeUser() {
        userDefaults.removeObject(forKey: Constants.UserDefaults.remember)
        userDefaults.removeObject(forKey: Constants.UserDefaults.expiry)
        userDefaults.removeObject(forKey: Constants.UserDefaults.client)
        userDefaults.removeObject(forKey: Constants.UserDefaults.token)
        userDefaults.removeObject(forKey: Constants.UserDefaults.uid)
    }
}

private extension UserService {
    func saveHeaders(from response: HTTPURLResponse?) {
        if let token = response?.headers.dictionary["access-token"],
           let expiry = response?.headers.dictionary["expiry"],
           let client = response?.headers.dictionary["client"],
           let uid = response?.headers.dictionary["uid"] {
            userDefaults.set(token, forKey: Constants.UserDefaults.token)
            userDefaults.set(expiry, forKey: Constants.UserDefaults.expiry)
            userDefaults.set(client, forKey: Constants.UserDefaults.client)
            userDefaults.set(uid, forKey: Constants.UserDefaults.uid)
        }
    }
}
