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

//返回当前时间的字符串形式
+(NSString *)dateNowWithForm:(NSString *)form;

//判断两个时间撮是否都是当天的时间
+(BOOL)compareTimestamp:(NSString *)timestamp1 :(NSString*) timestamp2;

//将时间撮转换成年月日的8位数的字符串
+(NSString *)dateWithTimestamp:(NSString *)timestamp;

//将参数时间撮拿来和今天做比较,返回相隔时间
+(NSInteger)compareNowWithTimestamp:(NSString *)timestamp;

//将一组array里面的某个key来排序成新的array
-(NSArray *)descriptorWithArray:(NSArray *)data andKey:(NSString *)key;
@end
