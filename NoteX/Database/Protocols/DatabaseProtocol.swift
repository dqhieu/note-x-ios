//
//  DatabaseProtocol.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/25/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

protocol DatabaseProtocol {
    
    associatedtype Value
    
    func add(_ object: Value, update: Bool)
    
    func add(_ objects: [Value], update: Bool)
    
    func get(_ predicate: NSPredicate?) -> [Value]
    
    func delete(_ object: Value)
    
    func deleteAll()
    
}

extension DatabaseProtocol {
    
    func add(_ object: Value, update: Bool = true) {
        if let realm = getRealm(), let obj = object as? Object {
            do {
                try realm.write {
                    realm.add(obj, update: update)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func add(_ objects: [Value], update: Bool = true) {
        if let realm = getRealm(), let objs = objects as? [Object] {
            do {
                try realm.write {
                    realm.add(objs, update: update)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func update(_ object: Value, properties: [String: Any]) {
        if let realm = getRealm(), let obj = object as? Object {
            do {
                try realm.write {
                    for property in properties.keys {
                        obj[property] = properties[property]
                    }
                    realm.add(obj, update: true)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func get(_ predicate: NSPredicate? = nil) -> [Value] {
        if let realm = getRealm(), let type = Value.self as? Object.Type {
            if let predicate = predicate {
                if let res = realm.objects(type).filter(predicate.predicateFormat).toArray() as? [Value] {
                    return res
                }
            } else {
                if let res = realm.objects(type).toArray() as? [Value] {
                    return res
                }
            }
        }
        return []
    }
    
    func delete(_ object: Value) {
        if let realm = getRealm(), let obj = object as? Object {
            do {
                try realm.write {
                    realm.delete(obj)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func delete(_ objects: [Value]) {
        if let realm = getRealm(), let objs = objects as? [Object] {
            do {
                try realm.write {
                    realm.delete(objs)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func deleteAll() {
        if let realm = getRealm(), let type = Value.self as? Object.Type {
            do {
                try realm.write {
                    realm.delete(realm.objects(type))
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func getRealm(configuration: Realm.Configuration? = nil) -> Realm? {
        do {
            if let config = configuration {
                return try Realm(configuration: config)
            } else {
                return try Realm()
            }
        } catch {
            return nil
        }
    }
    
}

extension Results {
    func toArray() -> [Element] {
        return self.map {$0}
    }
}

extension RealmSwift.List {
    func toArray() -> [Element] {
        return self.map {$0}
    }
}
