//
//  PLGTimerHelper.h
//  BabyBluetoothOSDemo
//
//  Created by PaulLi on 2017/8/28.
//  Copyright © 2017年 liuyanwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PLGTimerHelper : NSObject

+ (instancetype)sharedInstance;

- (void)performCallbackAfterDelay:(NSTimeInterval)delay
                         callback:(void(^)())callback;

- (void)cancelPerformCallback;

@end
