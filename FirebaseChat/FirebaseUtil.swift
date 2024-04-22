//
//  FirebaseUtil.swift
//  FirebaseChat
//
//  Created by 정은주 on 4/14/24.
//

import Foundation
import Firebase

class FirebaseUtil: NSObject {
    let auth: Auth
    
    static let shared = FirebaseUtil()
    
    override init(){
        FirebaseApp.configure()
        
        self.auth = Auth.auth()
        
        super.init()
    }
    
}
