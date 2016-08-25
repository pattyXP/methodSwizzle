//
//  NSArray+SwizzleMethod.h
//  MethodSwizzle
//
//  Created by Patty on 16/8/25.
//  Copyright © 2016年 Patty. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (SwizzleMethod)

- (id)safe_objectAtIndex:(NSUInteger)index;
@end
