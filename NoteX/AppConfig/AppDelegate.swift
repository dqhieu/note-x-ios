//
//  AppDelegate.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/11/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        DataManager.migrateIfNeeded()
        AppComponents.initialize()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        if let vc = NoteListWireframe.createNoteListView() as? UIViewController {
            let nvc = UINavigationController(rootViewController: vc)
            window?.rootViewController = nvc
        }
        
        return true
    }

}
