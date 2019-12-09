//
//  Data.h
//  zhifuxitong
//
//  Created by ssp on 13-6-27.
//  Copyright (c) 2013年 ssp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Data : NSObject{
    NSMutableDictionary *DataDic;
}

-(NSMutableDictionary *)Read;
-(void)WirteDic : (id )Wangluodic Key:(id )key;
-(void)InitPlist;
- (void)removeDicForKey:(id)key;


@end
