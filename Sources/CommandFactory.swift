//
//  CommandFactory.swift
//  Run-Forrest-Run
//
//  Created by Michele Gruppioni on 15/01/16.
//  Copyright © 2016 Michele Gruppioni. All rights reserved.
//

import Foundation

public struct CommandFactory : ExecutableFactory {
    
    public var executor: Executor
    
    init(executor: Executor) {
        self.executor = executor
    }
    
    public func create(arguments: [String], stdin: String?) -> Executable {
        return Command(arguments: arguments, executor: executor, stdin: stdin)
    }
    
    public func create(arguments: [String]) -> Executable {
        return create(arguments, stdin: nil)
    }
}

// MARK: - CommandFactory Extension
extension CommandFactory {
    init() {
        self.init(executor: TaskExecutor())
    }
}