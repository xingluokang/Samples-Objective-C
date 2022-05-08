//
//  Personal.h
//  ObjectArchive
//
//  Created by 邢罗康 on 2022/5/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//对一个类实现归档
//类只有实现NSCoding协议，才具备归档解档功能
@interface Personal : NSObject<NSCoding>

@property(nonatomic,copy)NSString * name;
@property(nonatomic,assign)NSInteger age;
@property(nonatomic,strong)NSArray * apples;

@end

NS_ASSUME_NONNULL_END
