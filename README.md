One Step Singletons
===================

A partially implemented, protocol-based approach to Objective-C singletons.

### Singletons: One and Done ###

Singletons are a fairly basic pattern to implement in Objective-C code, but you pretty much have to repeat your implementation in every singleton class. Surely this presents an opportunity for abstraction, right?

Correct, and along the way we provide a mechanism for partially implemented protocols in Objective-C. This project provides a JBSingleton interface declaration, plus a default implementation on NSObject. When you call `+sharedObject`, your NSObject sublcass checks that itself conforms to JBSingleton, and returns it's shared instance if so, or `nil` otherwise.

### How to use ###

1. Declare that your class conforms to JBSingleton.
2. Voilà!

### Technical details ###

I've implemented a "weak" singleton behavior in this library. This means there's nothing in place to prevent more than one instantiation of your singleton class. This library merely provides a convenient way to access your class as a singleton.


### As an academic exercise, what does this accomplish? ###

I've managed to provide a way to add facilities to a class, merely by importing a library and declaring that it conforms to a protocol. That's a neat trick.
