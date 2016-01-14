//
//  Command.swift
//  Run-Forrest-Run
//
//  Created by Michele Gruppioni on 12/01/16.
//  Copyright © 2016 Michele Gruppioni. All rights reserved.
//

import Foundation


public struct Command {
    var executor:           Executor
    var arguments:          [String]
    var input:              String?
    var successExitStatus:  Int = 0
    
    init(arguments: [String], executor: Executor, input: String?) {
        self.arguments  = arguments
        self.executor   = executor
        self.input      = input
    }
    
    init(_ arguments: String..., executor: Executor, input: String?) {
        self.init(arguments: arguments, executor: executor, input: input)
    }
    
    init(_ arguments: String..., executor: Executor) {
        self.init(arguments: arguments, executor: executor, input: nil)
    }
}


extension Command : Executable {
    func execute() throws -> CommandResult {
        return try executor.execute(self)
    }
}

