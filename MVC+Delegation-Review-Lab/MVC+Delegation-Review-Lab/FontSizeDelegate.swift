//
//  PersistenceHelper.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Gregory Keeley on 1/26/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

enum DataPersistenceError: Error {
    case writingError(Error)
}


protocol FontSizeDelegate: AnyObject {
    func changeFontSize()
}

class FontSize: Codable {
    weak var delegate: FontSizeDelegate?
    func updateFontSize() {
        delegate?.changeFontSize()
    }
    
    private let filename: String
    private var fontSize: [Double]
    public init(filename: String) {
        self.filename = filename
        self.fontSize = []
    }
    private func saveFontSizeToDirectory() throws {
        do {
            let url = FileManager.getPath(with: filename, for: .documentsDirectory)
            let data = try PropertyListEncoder().encode(fontSize)
            try data.write(to: url, options: .atomic)
        } catch {
            throw DataPersistenceError.writingError(error)
        }
    }
    public func saveFontSize(_ item: Double) throws {
        _ = try loadFontSize()
        fontSize.append(item)
        do {
            try saveFontSizeToDirectory()
        } catch {
            throw DataPersistenceError.writingError(error)
        }
    }
    public func loadFontSize() throws -> [Double] {
        let path = FileManager.getPath(with: filename, for: .documentsDirectory).path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    fontSize = try PropertyListDecoder().decode([Double].self, from: data)
                }
            }
        }
        return fontSize
    }
}
