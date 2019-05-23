[![](https://travis-ci.org/grigorye/Restaurants.svg?branch=master)](https://travis-ci.org/grigorye/Restaurants)
[![](https://codecov.io/gh/grigorye/Restaurants/branch/master/graph/badge.svg)](https://codecov.io/gh/grigorye/Restaurants)
[![](https://gitlab.com/grigorye/Restaurants/badges/master/pipeline.svg)](https://gitlab.com/grigorye/Restaurants/commits/master)

Another attempt to build something modularized/utilizing best practicies like dependency management/unit testing/modularization/around VIPER-like architecture.

The app is supposed to show on the map restaurants around you, utlizing Foursquare API.

# Modules

There're a quite a few modules here. That's intentional. I tried to exploit modules, particularly, cocoapods, to avoid mixing unrelated things together. Cocoapods are cheap and quite solid instruments for module-level development nowadays.

So far there're four kinds of modules:

- App
	- Integration: mixes everything together
	- Scene modules: VIPER-like modules open for DI.
- Scenes: dumb view modules (one per screen)
- Services: you name it
- Models and primitives

There's also a level of integration in the main project itself. It's unnecessarily coupled at the moment, lacks routers and etc.

# Building and Testing

1. Prepare the dependcies:
      
      bundle install
      bundle exec pod install

2. Build Restaurants.xcodeworkspace
3. Tests targets for the modules should be available right in the workspace.

# Decisions

1. Third parties are basically not used: I tried to reinvent the wheel myself just to try it. Did I regret it? I'm not sure.
2. Considered RxSwift a couple of times, for observation and throttling the network requests and etc. Ended up with a simpler solution (delegates) and no throttling so far.
3. Considered Swinject for DI "containers" but eventually decided to try to proceed without it, just with "arguments-based" DI.
4. Used SwiftCheck a few times - highly recommend it.
5. Used SnapshotTesting (looks like a promising tool, iterating on FBSnasphotTests).
6. Had no time to do tests on the app level, but hopefully it's decoupled enough/ready for testing, thanks to DI.
7. Did nothing to polish the app and etc - was focused on other aspects.
8. Considered CI but had no time.
9. Did not test it on a real device. Did not profile the app to any extent. Sorry.
