//
//  NSMutableArray+SwizzleMethod.h
//  MethodSwizzle
//
//  Created by Patty on 16/8/25.
//  Copyright © 2016年 Patty. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (SwizzleMethod)

- (id)safeM_objectAtIndex:(NSUInteger)index;
- (void)safe_addObject:(id)anObject;
- (void)safe_insertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)safe_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;
- (void)safe_setObject:(id)obj atIndexedSubscript:(NSUInteger)index;
- (void)safe_removeObjectAtIndex:(NSUInteger)index;
@end
