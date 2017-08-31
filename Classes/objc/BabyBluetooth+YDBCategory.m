//
// Created by PaulLi on 2017/8/29.
// Copyright (c) 2017 PaulLi. All rights reserved.
//

#import "BabyBluetooth+YDBCategory.h"
#import <objc/runtime.h>

static void *writeCharacterKey = &writeCharacterKey;
static void *peripheralKey = &peripheralKey;

@implementation BabyBluetooth (YDBCategory)

#pragma mark - public methods

- (void)writeData:(NSData *)data {
    if (self.writeCharacteristic.properties & CBCharacteristicPropertyWriteWithoutResponse) {
        [self.peripheral writeValue:data forCharacteristic:self.writeCharacteristic type:CBCharacteristicWriteWithoutResponse];
    } else if (self.writeCharacteristic.properties & CBCharacteristicPropertyWrite) {
        [self.peripheral writeValue:data forCharacteristic:self.writeCharacteristic type:CBCharacteristicWriteWithResponse];
    }
}

#pragma mark - setters and getters

- (void)setWriteCharacteristic:(CBCharacteristic *)writeCharacteristic {
    objc_setAssociatedObject(self, &writeCharacterKey, writeCharacteristic, OBJC_ASSOCIATION_ASSIGN);
}

- (CBCharacteristic *)writeCharacteristic {
    return objc_getAssociatedObject(self, &writeCharacterKey);
}

- (void)setPeripheral:(CBPeripheral *)peripheral {
    objc_setAssociatedObject(self, &peripheralKey, peripheral, OBJC_ASSOCIATION_ASSIGN);
}

- (CBPeripheral *)peripheral {
    return objc_getAssociatedObject(self, &peripheralKey);
}

@end
