//
//  LRTime.h
//  LRLibrary
//
//  Created by 李锐 on 15/1/2.
//  Copyright (c) 2015年 李锐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LRTime : NSObject

//将时间撮转换成对应的字符串时间
+(NSString *)dateWithTimestamp:(NSString *)timestamp AndForm:(NSString *) form;

@end
