//
//  NSObject+Singleton.h
//
//  Created by Jake Bromberg on 10/9/13.
//  Copyright (c) 2013 Jake Bromberg. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Together with the JBSingletonImp category, the JBSingleton protocol provides a way for your class to act as a singleton in two easy steps. Simply (1) import this file, and (2) declare your class to conform to `JBSingleton`.
 */
@protocol JBSingleton <NSObject>

/**
 *  Access the singleton object. Your class need not implement this method, unless you wish to perform custom initializations on your class.

    @return 
 */
+ (instancetype)sharedObject;

@end

/**
 *  Provides a default implementation for the JBSingleton protocol.
 */
@interface NSObject (JBSingletonImp)

+ (instancetype)sharedObject;

@end
