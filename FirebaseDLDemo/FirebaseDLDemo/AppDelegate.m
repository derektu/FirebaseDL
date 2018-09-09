//
//  AppDelegate.m
//  FirebaseDLDemo
//
//  Created by Derek Tu on 2018/9/8.
//  Copyright © 2018 Derek Tu. All rights reserved.
//

#import "AppDelegate.h"
@import Firebase;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Use Firebase library to configure APIs
    [FIRApp configure];
    
    
    [FIRDynamicLinks performDiagnosticsWithCompletion:nil];
    
    return YES;
}

- (void) handleIncomingDynamicLink:(FIRDynamicLink*)dynamicLink {
    NSURL* url = nil;
    if (dynamicLink != nil) {
        url = [dynamicLink url];
    }
    NSLog(@"incoming dynamic link:%@", url);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"<UserID>" object:url];
}

- (BOOL)application:(UIApplication *)application
continueUserActivity:(NSUserActivity *)userActivity
 restorationHandler:(void (^)(NSArray *))restorationHandler {
    BOOL handled = [[FIRDynamicLinks dynamicLinks] handleUniversalLink:userActivity.webpageURL
                                                            completion:^(FIRDynamicLink * _Nullable dynamicLink,
                                                                         NSError * _Nullable error) {
                                                                if (error != nil) {
                                                                    // oops, there is an error
                                                                }
                                                                else {
                                                                    [self handleIncomingDynamicLink:dynamicLink];
                                                                }
                                                            }];
    return handled;
}

- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary<NSString *, id> *)options {
    return [self application:app
                     openURL:url
           sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
                  annotation:options[UIApplicationOpenURLOptionsAnnotationKey]];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    
    FIRDynamicLink *dynamicLink = [[FIRDynamicLinks dynamicLinks] dynamicLinkFromCustomSchemeURL:url];
    
    if (dynamicLink) {
        if (dynamicLink.url) {
            // Handle the deep link. For example, show the deep-linked content,
            // ...
            [self handleIncomingDynamicLink:dynamicLink];
            
        } else {
            // Dynamic link has empty deep link. This situation will happens if
            // Firebase Dynamic Links iOS SDK tried to retrieve pending dynamic link,
            // but pending link is not available for this device/App combination.
            // At this point you may display default onboarding view.
            //
            // [self handleIncomingDynamicLink:nil];
        }
        return YES;
    }
    return NO;
}


@end
