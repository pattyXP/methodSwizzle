//
//  NSDictionary+SwizzleMethod.m
//  MethodSwizzle
//
//  Created by Patty on 16/8/25.
//  Copyright © 2016年 Patty. All rights reserved.
//

#import "NSDictionary+SwizzleMethod.h"

@implementation NSDictionary (SwizzleMethod)

- (id)safe_objectForKey:(id)key
{
    id value = [self safe_objectForKey:key];
    if ([value isKindOfClass:[NSNull class]]) {
        return nil;
    }
    return value;
}
@end
