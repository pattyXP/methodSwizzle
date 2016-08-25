//
//  NSObject+SwizzleMethod.m
//  MethodSwizzle
//
//  Created by Patty on 16/8/25.
//  Copyright © 2016年 Patty. All rights reserved.
//

#import "NSObject+SwizzleMethod.h"
#import <objc/runtime.h>

@implementation NSObject (SwizzleMethod)

+ (BOOL)swizzleMethod:(SEL)origSel withMethod:(SEL)swizzleSel
{
    Method originMethod = class_getInstanceMethod(self, origSel);
    Method swizzleMethod = class_getInstanceMethod(self, swizzleSel);
    
    if (originMethod && swizzleMethod) {
        if (class_addMethod(self, origSel, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod))) {
            
            class_replaceMethod(self, swizzleSel,
                                method_getImplementation(originMethod),method_getTypeEncoding(originMethod));
        }else{
            method_exchangeImplementations(originMethod, swizzleMethod);
        }
        return YES;
    }
    
    return NO;
    
}

+ (BOOL)swizzleClassMethod:(SEL)origSel withClassMethod:(SEL)swizzleSel
{
    Class cls = object_getClass(self);
    return [cls swizzleMethod:origSel withMethod:swizzleSel];
}

// 获取类的描述
+ (NSDictionary *)objectDescription:(id)object
{
    if (nil == object) {
        return nil;
    }
    
    // 如果是NSObject,返回类名和地址
    if ([object isKindOfClass:[NSObject class]]) {
        NSString * objectClassName = NSStringFromClass([object class]);
        NSString * objectAddress = [NSString stringWithFormat:@"%p",object];
        
        if (nil == objectClassName || nil == objectAddress) {
            return nil;
        }
        
        return @{
                 @"name":objectClassName,
                 @"addr":objectAddress
                 };
    }
    
    // 如果是nsproxy,返回descripton
    if ([object respondsToSelector:@selector(description)]) {
        NSString * decription = [[object description] copy];
        
        if (nil == decription) {
            return nil;
        }
        
        return @{
                 @"dscrp": decription
                 };
    }
    
    return nil;
}
@end
