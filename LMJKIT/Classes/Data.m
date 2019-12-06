//
//  Data.m
//  zhifuxitong
//
//  Created by ssp on 13-6-27.
//  Copyright (c) 2013年 ssp. All rights reserved.
//



/*
建立文件管理

NSFileManager *fm = [NSFileManager defaultManager];

开始创建文件

[fm createFileAtPath:plistPath contents:nil attributes:nil];

删除文件

[fm removeItemAtPath:plistPath error:nil];

//如果plist不存在，创建文件
if(![[NSFileManager defaultManager] fileExistsAtPath:plistPath])
{
    NSMutableArray* temp = [NSMutableArray arrayWithCapacity:10];
    [temp writeToFile:plistPath atomically:YES];
}

*/


#import "Data.h"

@implementation Data
-(NSMutableDictionary *)Read{
    //NSSearchPathForDirectoriesInDomains，数据持久化Documents目录
    //从index=0截取，拼接data.plist组成路径
    
    NSString *plistPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:@"Data.plist"];
    
    //根据路径获取test.plist的全部内容
    DataDic = [[[NSMutableDictionary alloc]initWithContentsOfFile:plistPath]mutableCopy];
    
    return DataDic;
    
}

-(void)WirteDic : (id )Wangluodic Key:(id )key{
    
    NSString *plistPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:@"Data.plist"];                      
    //根据路径获取test.plist的全部内容
    DataDic= [[[NSMutableDictionary alloc]initWithContentsOfFile:plistPath]mutableCopy];
    [DataDic setObject:Wangluodic forKey:key];
    [DataDic writeToFile:plistPath atomically:YES];
    
}

- (void)removeDicForKey:(id)key{
    
    NSString *plistPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:@"Data.plist"];
    //根据路径获取test.plist的全部内容
    DataDic= [[[NSMutableDictionary alloc]initWithContentsOfFile:plistPath]mutableCopy];
    [DataDic removeObjectForKey:key];
    [DataDic writeToFile:plistPath atomically:YES];
    
}

-(void)InitPlist{
    //找到Documents文件所在的路径
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"paths = %@",paths);
    //取得第一个Documents文件夹的路径
    
    NSString *filePath = [paths objectAtIndex:0];
    
    //把Plist文件加入
    
    NSString *plistPath = [filePath stringByAppendingPathComponent:@"Data.plist"];
    
    //如果plist不存在，创建文件
    if(![[NSFileManager defaultManager] fileExistsAtPath:plistPath])
    {
        //在写入数据之前，需要把要写入的数据先写入一个字典中，创建一个dictionary：
        
        //创建一个字典
        DataDic = [[NSMutableDictionary alloc]init];
        //把数据写入plist文件
        [DataDic writeToFile:plistPath atomically:YES];
    }
}
@end
