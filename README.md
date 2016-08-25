# methodSwizzle

普通的数组，字典越界替换方法
防止使用不当引起崩溃

使用:
在程序初始化的时候，加载初始化方法
  [YYSwizzleManager addSwizzleMethod];就可以了
  
  如果需要增加其他的替换方法，类似以下替换就可以了
  如：
  #import "NSArray+SwizzleMethod.h"

@implementation NSArray (SwizzleMethod)

- (id)safe_objectAtIndex:(NSUInteger)index
{
    if (index >= [self count]) {
        return nil;
    }
    return [self safe_objectAtIndex:index];
}

在YYSwizzleManager的addSwizzleMethod里添加该方法就可以了
  // NSArray
    Class arrayClass = NSClassFromString(@"__NSArrayI");
    [arrayClass swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(safe_objectAtIndex:)];
