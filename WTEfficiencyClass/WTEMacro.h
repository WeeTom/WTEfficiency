//
//  WTEMacro.h
//  WTEDemo
//
//  Created by Wee Tom on 14-6-19.
//  Copyright (c) 2014年 WeeTom. All rights reserved.
//

#define WTE_SYSVersionUnder7 (DeviceSystemMajorVersion() < 7)
#define WTE_SYSVersionUnder6 (DeviceSystemMajorVersion() < 6)

NSUInteger DeviceSystemMajorVersion() {
    
    static NSUInteger _deviceSystemMajorVersion = -1;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        _deviceSystemMajorVersion = [[[[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."] objectAtIndex:0] intValue];
        
    });
    
    return _deviceSystemMajorVersion;
    
}