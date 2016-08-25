//
//  WYSwizzleManager.m
//  MethodSwizzle
//
//  Created by Patty on 16/8/25.
//  Copyright © 2016年 Patty. All rights reserved.
//

#import "YYSwizzleManager.h"
#import "NSArray+SwizzleMethod.h"
#import "NSMutableArray+SwizzleMethod.h"
#import "NSDictionary+SwizzleMethod.h"
#import "NSMutableDictionary+SwizzleMethod.h"
#import "NSObject+SwizzleMethod.h"

@implementation YYSwizzleManager


+ (void)addSwizzleMethod
{
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 延迟替换类方法，提高加载速度
        [self switchAllMethod];
//    });
}

// 替换类方法
+ (void)switchAllMethod {
    
    // NSArray
    Class arrayClass = NSClassFromString(@"__NSArrayI");
    [arrayClass swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(safe_objectAtIndex:)];
    
    // NSMutableArray
    Class mutabArrayClass = NSClassFromString(@"__NSArrayM");
    [mutabArrayClass swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(safeM_objectAtIndex:)];
    [mutabArrayClass swizzleMethod:@selector(addObject:) withMethod:@selector(safe_addObject:)];
    [mutabArrayClass swizzleMethod:@selector(insertObject:atIndex:) withMethod:@selector(safe_insertObject:atIndex:)];
    [mutabArrayClass swizzleMethod:@selector(replaceObjectAtIndex:withObject:) withMethod:@selector(safe_replaceObjectAtIndex:withObject:)];
    [mutabArrayClass swizzleMethod:@selector(setObject:atIndexedSubscript:) withMethod:@selector(safe_setObject:atIndexedSubscript:)];
    [mutabArrayClass swizzleMethod:@selector(removeObjectAtIndex:) withMethod:@selector(safe_removeObjectAtIndex:)];

    // NSDitionary
    [NSDictionary swizzleMethod:@selector(objectForKey:) withMethod:@selector(safe_objectForKey:)];
    
    // NSMutableDictionary
    [NSMutableDictionary swizzleMethod:@selector(objectForKey:) withMethod:@selector(safe_objectForKey:)];
    [NSMutableDictionary swizzleMethod:@selector(setValue:forKey:) withMethod:@selector(safe_setValue:ForKey:)];

}
@end
