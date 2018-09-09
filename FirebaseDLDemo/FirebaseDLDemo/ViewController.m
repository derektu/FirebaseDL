//
//  ViewController.m
//  FirebaseDLDemo
//
//  Created by Derek Tu on 2018/9/8.
//  Copyright © 2018 Derek Tu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    id<NSObject> _observer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    
    _observer = [center addObserverForName:@"<UserID>" object:nil
                                     queue:mainQueue usingBlock:^(NSNotification *note) {
                                         
                                         NSURL* url = note.object;
                                         if (url != nil)
                                             self.lblUserID.text = [url absoluteString];
                                         else
                                             self.lblUserID.text = @"<nil>";
                                     }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
