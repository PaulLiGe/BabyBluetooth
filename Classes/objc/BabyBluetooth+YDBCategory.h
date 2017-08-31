//
// Created by PaulLi on 2017/8/29.
// Copyright (c) 2017 PaulLi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BabyBluetooth.h"
#import <CoreBluetooth/CoreBluetooth.h>

@interface BabyBluetooth (YDBCategory)

@property (nonatomic, weak) CBCharacteristic *writeCharacteristic;

@property (nonatomic, weak) CBPeripheral *peripheral;

- (void)writeData:(NSData *)data;

@end
