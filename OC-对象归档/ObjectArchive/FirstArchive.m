//
//  ArchiveManage.m
//  ObjectArchive
//
//  Created by 邢罗康 on 2022/5/8.
//

#import "FirstArchive.h"

@implementation FirstArchive

+(void)archive {
    //对象归档 --->> 文件
    NSArray *array = [NSArray arrayWithObjects:@"张三",@"李四",@"王五", nil];
    //归档保存的路径
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"array.arc"];
    NSLog(@"filePath: %@",filePath);
    //归档对象
    BOOL success = [NSKeyedArchiver archiveRootObject:array toFile:filePath];
    if (success) {
        NSLog(@"归档成功！");
    }
}

+(void)unArchive {
    //解档
    NSString * filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"array.arc"];
    NSLog(@"filePath: %@",filePath);
    NSArray * array2 = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    for (NSString * name in array2) {
        NSLog(@"name: %@",name);
    }
}

@end
