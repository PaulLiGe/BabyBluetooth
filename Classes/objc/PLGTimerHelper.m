//
//  PLGTimerHelper.m
//  BabyBluetoothOSDemo
//
//  Created by PaulLi on 2017/8/28.
//  Copyright © 2017年 liuyanwei. All rights reserved.
//

#import "PLGTimerHelper.h"

@interface PLGTimerHelper ()

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, copy) void (^callback)();

@end

@implementation PLGTimerHelper

+ (instancetype)sharedInstance {
    static PLGTimerHelper *timerHelper = nil;
    if (timerHelper == nil) {
        timerHelper = [[PLGTimerHelper alloc] init];
        [timerHelper configTimer];
    }
    return timerHelper;
}

#pragma mark - public methods

- (void)performCallbackAfterDelay:(NSTimeInterval)delay callback:(void(^)())callback {
    [self.timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:delay]];
    self.callback = callback;
}

- (void)cancelPerformCallback {
    [self.timer setFireDate:[NSDate distantFuture]];
    self.callback = nil;
}

- (void)timerActionMethod {
    if (self.callback) {
        [self.timer setFireDate:[NSDate distantFuture]];
        self.callback();
    }
}

#pragma mark - private methods

- (void)configTimer {
    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerActionMethod) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)dealloc {
    [self.timer invalidate];
    self.timer = nil;
}


@end
