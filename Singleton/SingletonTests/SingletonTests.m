//
//  SingletonTests.m
//  SingletonTests
//
//  Created by Jake Bromberg on 2/15/14.
//  Copyright (c) 2014 Jake Bromberg. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NonSingletonClass.h"
#import "NSObject+Singleton.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface SingletonTests : XCTestCase

@end

@implementation SingletonTests

- (void)testNonSingletonClassHasNoSingleton
{
	static SEL const sharedInstanceSelector = (SEL)"sharedInstance";
	
	XCTAssert(!class_respondsToSelector([NonSingletonClass class], sharedInstanceSelector), @"Class %@ has singleton instance when it should not.", [NonSingletonClass class]);
	XCTAssertThrowsSpecificNamed(objc_msgSend([NonSingletonClass class], sharedInstanceSelector), NSException, NSInvalidArgumentException, @"Sending selector `sharedInstance` to NonSingletonClass did not throw an exception");

	@try
	{
		objc_msgSend([NonSingletonClass class], sharedInstanceSelector);
	}
	@catch (NSException *exception)
	{
		XCTAssert([exception.name isEqualToString:@"NSInvalidArgumentException"], @"Unexpected exception name");
		
		void *classAddress = (__bridge void *)[NonSingletonClass class];
		id expectedExceptionReason = [NSString stringWithFormat:@"+[NonSingletonClass sharedInstance]: unrecognized selector sent to class %p", classAddress];
		XCTAssert([exception.reason isEqualToString:expectedExceptionReason], @"Unxpected exception reason: %@", exception.reason);
	}
}

@end
