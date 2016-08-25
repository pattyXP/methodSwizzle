//
//  NSMutableDictionary+SwizzleMethod.m
//  MethodSwizzle
//
//  Created by Patty on 16/8/25.
//  Copyright © 2016年 Patty. All rights reserved.
//

#import "NSMutableDictionary+SwizzleMethod.h"

@implementation NSMutableDictionary (SwizzleMethod)


- (id)safe_objectForKey:(id)key
{
    id value = [self safe_objectForKey:key];
    if ([value isKindOfClass:[NSNull class]]) {
        return nil;
    }
    return value;
}

- (void)safe_setValue:(id)object ForKey:(id)key
{
    if(!object || !key){
        return ;
    }
    [self safe_setValue:object ForKey:key];
}
@end
