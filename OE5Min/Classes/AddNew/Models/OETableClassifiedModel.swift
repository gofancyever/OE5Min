//
//  OETableClassifiedModel.swift
//  OE5Min
//
//  Created by gaof on 2017/2/15.
//  Copyright © 2017年 gaof. All rights reserved.
//

import Foundation
import RxDataSources


struct ClassifiedModel {
    let name: String
    let isSelected: Bool
}


enum CollectionViewEditingCommand {
    case deleteModel(model: ClassifiedModel)
    case addModel(model:ClassifiedModel)
    case setModels(models:[ClassifiedModel])
}


struct CollectionViewEditingCommandsViewModel {
    
    let models:[ClassifiedModel]
    
    func executeCommand(_ command: CollectionViewEditingCommand) -> CollectionViewEditingCommandsViewModel {
        switch command {
        case let .setModels(models):
            return CollectionViewEditingCommandsViewModel(models: models)
        case let .deleteModel(model):
            var all = self.models
            let index = all.index(where: { (classifiedModel) -> Bool in
                return classifiedModel.name == model.name
            })
            all.remove(at: index!)
            return CollectionViewEditingCommandsViewModel(models: all)
        case let .addModel(model):
            var all = self.models
            all.append(model)
            return CollectionViewEditingCommandsViewModel(models:all)
        }
    }
    
}
