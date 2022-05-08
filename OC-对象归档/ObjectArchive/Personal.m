//
//  Personal.m
//  ObjectArchive
//
//  Created by 邢罗康 on 2022/5/8.
//

#import "Personal.h"

@implementation Personal

//归档时调用此方法
//方法对对象的属性数据做编码处理
- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    [coder encodeObject:_name forKey:@"name"];
    [coder encodeInteger:_age forKey:@"age"];
    [coder encodeObject:_apples forKey:@"apples"];
}

//解档时调用，解档数据之后，会创建次对象，调用此初始化方法
- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {
    self = [super init];
    if (self != nil) {
        self.name = [coder decodeObjectForKey:@"name"];
        self.age = [coder decodeIntegerForKey:@"age"];
        self.apples = [coder decodeObjectForKey:@"apples"];
    }
    return self;
}

-(NSString *)description {
    NSString * str = [NSString stringWithFormat:@"%@\n%ld\n%@",_name,(long)_age,_apples];
    return str;
}

@end
