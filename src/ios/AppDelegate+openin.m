//
//  AppDelegate+openin.m
//  OpenIn
//
//  Created by Matias Sanguinetti on 2/9/15.
//
//

#import "AppDelegate+openin.h"
#import "OpenIn.h"
#import <objc/runtime.h>

@implementation AppDelegate (file)
- (id) getCommandInstance:(NSString*)className
{
    return [self.viewController getCommandInstance:className];
}
// its dangerous to override a method from within a category.
// Instead we will use method swizzling. we set this up in the load call.

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if (url != nil && [url isFileURL]) {
        NSLog(@"URL:%@", [url absoluteString]);
        OpenIn *openInHandler = [self getCommandInstance:@"OpenIn"];
        [openInHandler emitEvent:[url absoluteString]];
    }
    return YES;
}

@end