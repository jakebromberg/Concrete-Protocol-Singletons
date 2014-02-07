Concrete Protocol Singletons
============================

A concrete protocol-based approach to Objective-C singletons. This library provides a protocol for your singleton, and a category on NSObject that implements the singleton behavior. 


### How to use ###

To turn your class into a singleton, import the header file, and add the `<Singleton>` protocol to its interface delcaration. Then, at runtime, call the `+loadSingleton` method on your object to instantiate the singleton.

A quick example:

	#import "NSObject+Singleton.h"
	
	@interface MySingletonClass : NSObject <Singleton>
	
	// ...
	
	@end
	
Voilà!

### Technical details ###

I've implemented a "weak" singleton behavior in this library. This means there's nothing in place to prevent more than one instantiation of your singleton class. This library merely provides a way to access your class as a singleton.


### As an academic exercise, what does this accomplish? ###

I've managed to provide a way to add facilities to a class, merely by importing a library and declaring that it conforms to a protocol. That's a neat trick.