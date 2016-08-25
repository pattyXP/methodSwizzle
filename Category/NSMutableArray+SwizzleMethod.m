//
//  NSMutableArray+SwizzleMethod.m
//  MethodSwizzle
//
//  Created by Patty on 16/8/25.
//  Copyright © 2016年 Patty. All rights reserved.
//

#import "NSMutableArray+SwizzleMethod.h"

@implementation NSMutableArray (SwizzleMethod)

- (id)safeM_objectAtIndex:(NSUInteger)index
{
    if (index >= [self count]) {
        return nil;
    }
    return [self safeM_objectAtIndex:index];
}

- (void)safe_addObject:(id)anObject
{
    if(anObject == nil)
    {
        return;
    }
    [self safe_addObject:anObject];
}

- (void)safe_insertObject:(id)anObject atIndex:(NSUInteger)index
{
    if(anObject == nil || index > [self count]) {
        return;
    }
    [self safe_insertObject:anObject atIndex:index];
}

- (void)safe_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if(anObject == nil || index >= [self count])
    {
        return;
    }
    [self safe_replaceObjectAtIndex:index withObject:anObject];
}

- (void)safe_setObject:(id)obj
    atIndexedSubscript:(NSUInteger)index
{
    if(obj == nil || index > [self count])
    {
        return;
    }
    [self safe_setObject:obj atIndexedSubscript:index];
}

- (void)safe_removeObjectAtIndex:(NSUInteger)index
{
    if (index >= [self count]) {
        return;
    }
    [self safe_removeObjectAtIndex:index];
}

@end
