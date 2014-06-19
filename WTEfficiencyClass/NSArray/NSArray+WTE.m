//
//  NSMutableArray+WTE.m
//  WTEDemo
//
//  Created by Wee Tom on 14-6-19.
//  Copyright (c) 2014年 WeeTom. All rights reserved.
//

#import "NSArray+WTE.h"

@implementation NSArray (WTE)
+ (NSArray *)arrayWithObjects:(NSArray *)objects block:(id (^)(id object))block;
{
    return [NSMutableArray arrayWithObjects:objects block:block];
}
@end

@implementation NSMutableArray (WTE)
+ (NSMutableArray *)arrayWithObjects:(NSArray *)objects block:(id (^)(id))block
{
    NSMutableArray *array = [NSMutableArray array];
    for (id object in objects) {
        id arrayObject = block(object);
        if (arrayObject) {
            [array addObject:arrayObject];
        }
    }
    return array;
}
@end