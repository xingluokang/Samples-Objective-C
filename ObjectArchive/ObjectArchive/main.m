//
//  main.m
//  ObjectArchive
//
//  Created by 邢罗康 on 2022/5/8.
//

#import <Foundation/Foundation.h>
#import "FirstArchive.h"
#import "SecondArchive.h"
#import "Personal.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /*
         一、概念：对象归档是指将对象写入文件保存在硬盘上，当再次重新打开程序时，可以还原这些对象。可以称之为“对象序列化、对象持久化”。
         二、数据持久化的方式：
            1、NSKeyedArchiver(归档);NSKeyedUnarchiver(解归档)
            2、NSUserDefaults
            3、属性列表化（NSDictionary、NSArray保存文件）
            4、SQlite数据库、CoreData
         三、归档的形式
            1、对Foundation库中对象进行归档
            2、自定义对象进行归档（需要实现归档协议，NSCoding）
         四、归档后的文件是加密的，属性列表化是明文的。
         */  


        
        /******************************第一种形式******************************/
        [FirstArchive archive];//归档
        [FirstArchive unArchive];// 解档
        
        
        /******************************第二种形式******************************/
        [SecondArchive archive];//归档
        [SecondArchive unArchive];// 解档
        
        
        /******************************对一个类实现归档*****************************/
        //归档
        Personal * person = [[Personal alloc] init];
        person.name = @"马斯克";
        person.age = 99;
        person.apples = @[@"iphone",@"ipad",@"ipod"];
        
        NSString * filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Personal.archiver"];
        BOOL success = [NSKeyedArchiver archiveRootObject:person toFile:filePath];
        if (success) {
            NSLog(@"对一个类实现归档成功了");
        }
        
         //解档
        NSString * path = [NSHomeDirectory() stringByAppendingPathComponent:@"Personal.archiver"];
        Personal * person2 = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        NSLog(@"person:%@",person2);
         

        
        
        
        
    }
    return 0;
}
