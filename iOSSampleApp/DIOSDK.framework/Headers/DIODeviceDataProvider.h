//
//  DIODeviceDataProvider.h
//  DIOSDK
//
//  Created by Ariel Malka on 2/14/19.
//  Copyright © 2019 Display.io. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DIODeviceDataProvider : NSObject

+ (id)deviceHardwareData;
+ (id)deviceAdId;
+ (BOOL)isAdvertisingTrackingEnabled;

@end

NS_ASSUME_NONNULL_END
