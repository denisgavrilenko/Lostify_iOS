//
//  InitialUserStoryAssembly.swift
//  Lostify
//
//  Created by Denis Gavrilenko on 10/6/16.
//  Copyright © 2016 DreamaTeam. All rights reserved.
//

import Typhoon

class InitialUserStoryAssembly: TyphoonAssembly {
    
    dynamic func initialView() -> AnyObject {
        return TyphoonDefinition.withClass(InitialViewController.self) { (defenition) in
            defenition?.injectProperty(Selector(("viewModel")), with:self.initialViewModel())
        } as AnyObject
    }
    
    dynamic func initialViewModel() -> AnyObject {
        return TyphoonDefinition.withClass(InitialViewModel.self) { (defenition) in
            defenition?.useInitializer(#selector(InitialViewModel.init))
        } as AnyObject
    }
    
}
