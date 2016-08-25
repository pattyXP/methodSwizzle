//
//  NSObject+SwizzleMethod.h
//  MethodSwizzle
//
//  Created by Patty on 16/8/25.
//  Copyright © 2016年 Patty. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SwizzleMethod)

+ (BOOL)swizzleMethod:(SEL)origSel withMethod:(SEL)altSel;
+ (BOOL)swizzleClassMethod:(SEL)origSel withClassMethod:(SEL)altSel;

// 获取类的描述
+ (NSDictionary *)objectDescription:(id)object;

@end
