//
//  NSArray+SwizzleMethod.m
//  MethodSwizzle
//
//  Created by Patty on 16/8/25.
//  Copyright © 2016年 Patty. All rights reserved.
//

#import "NSArray+SwizzleMethod.h"

@implementation NSArray (SwizzleMethod)

- (id)safe_objectAtIndex:(NSUInteger)index
{
    if (index >= [self count]) {
        return nil;
    }
    return [self safe_objectAtIndex:index];
}
@end
