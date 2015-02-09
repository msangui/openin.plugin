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

@implementation AppDelegate ()

// its dangerous to override a method from within a category.
// Instead we will use method swizzling. we set this up in the load call.
+ (void)load
{
    Method original, swizzled;
    
    original = class_getInstanceMethod(self, @selector(init));
    swizzled = class_getInstanceMethod(self, @selector(swizzled_init));
    method_exchangeImplementations(original, swizzled);
}

- (AppDelegate *)swizzled_init
{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onAppDidBecomeActive:)     name:@"UIApplicationDidBecomeActiveNotification" object:nil];
    
    // This actually calls the original init method over in AppDelegate. Equivilent to calling super
    // on an overrided method, this is not recursive, although it appears that way. neat huh?
    return [self swizzled_init];
}

- (void)onAppDidBecomeActive:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    NSLog(@"%@",@"applicationDidBecomeActive");
    
    
    if (url != nil && [url isFileURL]) {
        NSLog(@"URL:%@", [url absoluteString]);
        
        NSString *js = [NSString stringWithFormat:@"cordova.fireDocumentEvent('openin.fileopened', %@);", url];
        
        [self.commandDelegate evalJs:js scheduledOnRunLoop:NO];
    }
}


@end

