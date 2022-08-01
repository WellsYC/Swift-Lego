//
//  TaskDispatcher.swift
//  Lego
//
//  Created by 蔡亚超 on 2020/5/15.
//  Copyright © 2020 WellsCai. All rights reserved.
//

import UIKit


struct Task {
    var taskId : String
    var taskClosures : () -> Void
    var cancelClosures : (() -> Bool?)? = nil
    
    func exccute() -> Void {
        taskClosures()
    }
}

class TaskDispatcher{

    enum ExecuteMode {
        case `default`
        case common
        
        var isDefault:Bool{
            switch self {
            case .default:
                return true
            default:
                return false
            }
        }
        
        var isCommon:Bool{
            switch self {
            case .common:
                return true
            default:
                return false
            }
        }
    }
    
    enum ExecuteState {
        case running
        case suspend
        
        var isRunning:Bool{
            switch self {
            case .running:
                return true
            default:
                return false
            }
        }
        
        var isSuspend:Bool{
            switch self {
            case .suspend:
                return true
            default:
                return false
            }
        }
    }
    
    
    var taskKeys:Array<String> = []
    var tasks:[String:Task] = [:]
    
    var state:ExecuteState = .suspend
    var mode:ExecuteMode = .default
    
    var observer:CFRunLoopObserver? = nil
    
    static var Common:TaskDispatcher{
        let dispatcher = TaskDispatcher()
        dispatcher.mode = .common
        return dispatcher
    }
    
    
    static var `Default`:TaskDispatcher{
        let dispatcher = TaskDispatcher()
        dispatcher.mode = .default
        return dispatcher
    }
}


extension TaskDispatcher{
    
    func add(task:Task) -> Void {
        
        taskKeys.append(task.taskId)
        tasks.updateValue(task, forKey: task.taskId)
        
        if state == .suspend {
            start()
        }
    }
    
    
    func start() -> Void {
        let runLoop = CFRunLoopGetMain()
        let activities = CFRunLoopActivity.beforeWaiting.rawValue|CFRunLoopActivity.exit.rawValue
        
        observer = CFRunLoopObserverCreateWithHandler(nil, activities, true, NSIntegerMax - 999, { (observer, activity) in
            
        })
        
        if mode.isDefault {
            CFRunLoopAddObserver(runLoop, observer, CFRunLoopMode.defaultMode)
        }else{
            CFRunLoopAddObserver(runLoop, observer, CFRunLoopMode.commonModes)
        }
        
        self.state = .running
    }
    
    func invaliate() -> Void {
        if mode.isDefault {
            CFRunLoopAddObserver(CFRunLoopGetMain(), observer, CFRunLoopMode.defaultMode)
        }else{
            CFRunLoopAddObserver(CFRunLoopGetMain(), observer, CFRunLoopMode.commonModes)
        }
        
        self.state = .suspend
    }
    
    func _executeTask() -> Void {
        
        guard let taskId = taskKeys.first else {
            return
        }
        
        guard let task = tasks[taskId]else {
            return
        }
        
        guard let cancelClosures = task.cancelClosures else {
            return
        }
        
        if cancelClosures() ?? false{
            tasks.removeValue(forKey: taskId)
            taskKeys.remove(at: 0)
            
            if taskKeys.count == 0&&state.isRunning{
                invaliate()
            }else{
                _executeTask()
            }
        }
        
        task.exccute()
        _removeTask(taskId: taskId)
    }
    
    
    func _removeTask(taskId:String) -> Void {
        tasks.removeValue(forKey: taskId)
        taskKeys.remove(at: 0)
        
        if taskKeys.count == 0&&state.isRunning{
            invaliate()
        }
    }
}
