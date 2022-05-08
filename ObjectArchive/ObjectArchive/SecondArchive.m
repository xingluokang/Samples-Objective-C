//
//  SecondArchive.m
//  ObjectArchive
//
//  Created by 邢罗康 on 2022/5/8.
//

#import "SecondArchive.h"

@implementation SecondArchive

+(void)archive {
    NSArray * array = [NSArray arrayWithObjects:@"张三",@"李四",@"马斯克", nil];
    //NSMutableData 用于储存归档对象中的数据
    NSMutableData * data = [NSMutableData data];
    
    //NSKeyedArchiver 创建归档对象
    NSKeyedArchiver * archive = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    
    //编码数据和对象
    [archive encodeObject:array forKey:@"array"];
    [archive encodeInt:999 forKey:@"scope"];
    [archive encodeBool:YES forKey:@"bool"];
    [archive encodeDouble:3.14159 forKey:@"double"];
    [archive encodeObject:@"jack" forKey:@"name"];
    
    //完成归档，将归档数据填充至data中，此时data中已经储存了归档对象的数据
    [archive finishEncoding];
    
    //[archive release];//MRC
    
    NSString * filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Data.text"];
    
    //将归档数据写入文件
    BOOL success = [data writeToFile:filePath atomically:YES];
    if (success) {
        NSLog(@"数据写入文件完成！");
    }
}

+(void)unArchive {
    //获取路径
    NSString * filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Data.text"];
    //读取归档数据
    NSData * data = [[NSData alloc] initWithContentsOfFile:filePath];
    //创建解档对象，对data中的数据进行解档
    NSKeyedUnarchiver * archive = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    
    // 解档：还原数据
    NSLog(@"%@",[archive decodeObjectForKey:@"array"]);
    NSLog(@"%d",[archive decodeIntForKey:@"scope"]);
    NSLog(@"%d",[archive decodeBoolForKey:@"bool"]);
    NSLog(@"%f",[archive decodeDoubleForKey:@"double"]);
    NSLog(@"%@",[archive decodeObjectForKey:@"name"]);
}


@end
