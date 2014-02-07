//
//  NSObject+Singleton.h
//
//  Created by Jake Bromberg on 10/9/13.
//  Copyright (c) 2013 Jake Bromberg. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol XYCSingleton <NSObject>

@required

+ (instancetype)sharedObject;
+ (void)loadSingleton;

@end


@interface NSObject (Singleton)

+ (instancetype)sharedObject;
+ (void)loadSingleton;

@end
