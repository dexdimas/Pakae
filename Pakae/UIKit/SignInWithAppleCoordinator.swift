//
//  SignInWithAppleController.swift
//  Pakae
//
//  Created by Stendy Antonio on 14/10/20.
//

import SwiftUI
import AuthenticationServices

struct AppleIdButton: UIViewRepresentable {
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        ASAuthorizationAppleIDButton()
    }
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
    
    }
}

final class SignInWithAppleCoordinator: NSObject {
    
    func getAppleRequest(){
        let AppleIdProvider = ASAuthorizationAppleIDProvider()
        let request = AppleIdProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        let authController = ASAuthorizationController(authorizationRequests: [request])
        authController.delegate = self
        authController.performRequests()
    }
    
    private func setUserInfo(for userId: String, fullName: String?, email: String?){
        ASAuthorizationAppleIDProvider().getCredentialState(forUserID: userId){ credentialState, error in
            var authState: String?
            switch credentialState {
            case .authorized: authState = "authorized"
            case .notFound: authState = "notfound"
            case .revoked: authState = "revoked"
            case .transferred: authState = "transfered"
            @unknown default:
                fatalError()
            }
            
            let user = User(fullName: fullName ?? "notprovided", email: email ?? "notprovided", authState: authState ?? "unknown", credentialid: userId)
            
            if let userEncode = try? JSONEncoder().encode(user){
                UserDefaults.standard.set(userEncode, forKey: "user")
            }
        }
    }
}

extension SignInWithAppleCoordinator: ASAuthorizationControllerDelegate{
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let credential = authorization.credential as? ASAuthorizationAppleIDCredential{
//            let fullName = (credential.fullName?.givenName)! + " " + (credential.fullName?.familyName)!
            setUserInfo(for: credential.user, fullName: credential.fullName?.familyName, email: credential.email)
        }
    }
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Sign In With Apple Id Error: \(error.localizedDescription)")
    }
    
}


