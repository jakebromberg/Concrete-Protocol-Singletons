//
//  NSObject+Singleton.m
//
//  Created by Jake Bromberg on 10/9/13.
//  Copyright (c) 2013 Jake Bromberg. All rights reserved.
//

#import "NSObject+Singleton.h"

@implementation NSObject (JBSingletonImp)

static NSMapTable *sharedObjects;

+ (void)load
{
	sharedObjects = [NSMapTable strongToStrongObjectsMapTable];
}

+ (void)loadSingleton
{
	[self sharedObject];
}

+ (instancetype)sharedObject
{
	if (![self conformsToProtocol:@protocol(JBSingleton)])
		return nil;

	id sharedObject = [sharedObjects objectForKey:[self class]];
	
	if (!sharedObject)
	{
		sharedObject = [[self alloc] init];
		[sharedObjects setObject:sharedObject forKey:[self class]];
	}
	
	return sharedObject;
}

@end
