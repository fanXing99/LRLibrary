//
//  LRTime.m
//  LRLibrary
//
//  Created by 李锐 on 15/1/2.
//  Copyright (c) 2015年 李锐. All rights reserved.
//

#import "LRTime.h"
//1418009854091
//1404114037341643
//001419564555364


@implementation LRTime
//将时间撮转换成对应的字符串时间
//标准时间撮是10位,多的是分秒和毫秒,应自动截取
+(NSString *)dateWithTimestamp:(NSString *)timestamp AndForm:(NSString *) form
{
    if([timestamp hasPrefix:@"00"])
    {
        timestamp=[timestamp substringFromIndex:2];
    }
    
    timestamp=[timestamp substringToIndex:10];
    NSTimeInterval time=[timestamp doubleValue];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:form];
    NSString *date=[formatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:time]];
    NSLog(@"时间撮转换:%@",date);
    
    return date;
}

//返回当前时间的字符串形式
+(NSString *)dateNowWithForm:(NSString *)form
{
    NSDate *time=[NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:form];
    NSString *timeStr=[formatter stringFromDate:time];
    return timeStr;
}

//将时间撮转换成年月日的8位数的字符串
+(NSString *)dateWithTimestamp:(NSString *)timestamp
{
    if([timestamp hasPrefix:@"00"])
    {
        timestamp=[timestamp substringFromIndex:2];
    }
    
    timestamp=[timestamp substringToIndex:10];
    NSTimeInterval time=[timestamp doubleValue];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyyMMdd"];
    NSString *date=[formatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:time]];
    return date;

}

//判断两个时间撮是否都是当天的时间
+(BOOL)compareTimestamp:(NSString *)timestamp1 :(NSString*) timestamp2
{
    NSString * timeStr1=[self dateWithTimestamp:timestamp1];
    NSString * timeStr2=[self dateWithTimestamp:timestamp2];
    return [timeStr1 isEqualToString:timeStr2];
}

//将参数时间撮拿来和今天做比较,返回相隔天数
+(NSInteger)compareNowWithTimestamp:(NSString *)timestamp
{
    NSString * timeStr1=[self dateNowWithForm:@"yyyyMMdd"];
    NSString * timeStr2=[self dateWithTimestamp:timestamp];
    return [timeStr2 integerValue]-[timeStr1 integerValue];
}

-(NSArray *)descriptorWithArray:(NSArray *)data andKey:(NSString *)key
{
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:NO];//其中，price为数组中的对象的属性，这个针对数组中存放对象比较更简洁方便
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:&sortDescriptor count:1];
    [(NSMutableArray*)data sortUsingDescriptors:sortDescriptors];
    return data;
    
}



//-(void)LR:(NSArray *)data
//{
//    int i1=0;
//    NSMutableDictionary *newdic=[[NSMutableDictionary alloc]init];
//    //    NSMutableDictionary *newdic0=[[NSMutableDictionary alloc]init];//今天
//    //    NSMutableDictionary *newdic1=[[NSMutableDictionary alloc]init];//昨天
//    //    NSMutableDictionary *newdic2=[[NSMutableDictionary alloc]init];//前天
//    
//    NSMutableArray *oldyearArray=[[NSMutableArray alloc]init];
//    NSMutableDictionary *newnewDic=[[NSMutableDictionary alloc]init];
//    
//    //当前时间线
//    NSTimeInterval time1 = [[NSDate date] timeIntervalSince1970];
//    long long dTime = [[NSNumber numberWithDouble:time1] longLongValue]; // 将double转为long long型
//    NSString *curTime = [NSString stringWithFormat:@"%llu",dTime];
//    NSTimeInterval userTime = [curTime doubleValue];
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyyMMdd"];
//    NSString *iosDate = [[dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:userTime]]substringToIndex:4];
//    NSString *sss=[NSString stringWithFormat:@"%@0101",iosDate];
//    
//    for (NSDictionary *dic in data) {
//        //数据时间线
//        NSString *dataTime=[self ymd:[dic objectForKey:@"signDate"]];
//        //比对
//        if([dataTime intValue]>[sss intValue])
//        {
//            NSString *day=[dataTime substringFromIndex:4];
//            if([newdic objectForKey:day]!=nil)
//            {
//                NSArray *a=[newdic objectForKey:day];
//                NSMutableArray *dayarray=[NSMutableArray arrayWithArray:a];
//                [dayarray addObject:dic];
//                //每个key里面也要排序
//                NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"signDate" ascending:NO];//其中，price为数组中的对象的属性，这个针对数组中存放对象比较更简洁方便
//                NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:&sortDescriptor count:1];
//                [dayarray sortUsingDescriptors:sortDescriptors];
//                
//                
//                [newdic setObject:dayarray forKey:day];
//                
//                
//                
//            }
//            else
//            {
//                NSArray *a=[NSArray arrayWithObject:dic];
//                [newdic setObject:a forKey:day];
//            }
//            
//            
//            
//            
//        }
//        else
//        {
//            [oldyearArray addObject:dic];
//        }
//        
//    }
//    
//    
//    NSArray *allkey=[newdic allKeys];
//    
//    allkey=[allkey sortedArrayUsingSelector:@selector(compare:)];
//    
//    for (int i=0; i<allkey.count; i++) {
//        NSArray *a=[newdic objectForKey:[allkey objectAtIndex:allkey.count-i-1]];
//        [newnewDic setObject:a forKey:[NSString stringWithFormat:@"%d",i1]];
//        i1++;
//    }
//    
//    if(oldyearArray.count!=0)
//    {
//        [newnewDic setObject:oldyearArray forKey:[NSString stringWithFormat:@"%d",i1]];
//    }
//    
//    
//    self.paiData=newnewDic;
//}
//

@end
