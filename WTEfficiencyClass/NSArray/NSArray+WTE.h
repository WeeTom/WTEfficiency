//
//  NSMutableArray+WTE.h
//  WTEDemo
//
//  Created by Wee Tom on 14-6-19.
//  Copyright (c) 2014年 WeeTom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (WTE)
+ (NSArray *)arrayWithObjects:(NSArray *)objects block:(id (^)(id object))block;
@end

@interface NSMutableArray (WTE)
+ (NSMutableArray *)arrayWithObjects:(NSArray *)objects block:(id (^)(id object))block;
@end