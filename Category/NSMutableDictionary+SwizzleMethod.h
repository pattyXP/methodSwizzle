//
//  NSMutableDictionary+SwizzleMethod.h
//  MethodSwizzle
//
//  Created by Patty on 16/8/25.
//  Copyright © 2016年 Patty. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (SwizzleMethod)

- (id)safe_objectForKey:(id)key;
- (void)safe_setValue:(id)object ForKey:(id)key;

@end
