//
//  DateTimeUtil.m
//  DateTime
//
//  Created by Saleh Enam Shohag on 10/12/18.
//  Copyright © 2018 Nazia Afroz. All rights reserved.
//

#import "DateTimeUtil.h"

@implementation DateTimeUtil

-(void)runDateTimeUtil{
    [self currentDateTime];
    [self printFromStoredDate];
    [self printFromStoreDate2];
    [self dateComponentsFromDate];
    [self dateComponentsFromDateNewApproach];
}

-(void)currentDateTime{
    NSDate *date = [[NSDate alloc]init];
    NSLog(@"%@", date);
    int64_t timestamp = [date timeIntervalSince1970];
    int64_t timeoffset = [NSTimeZone localTimeZone].secondsFromGMT;
    NSLog(@"timestamp = %lld timeoffset = %lld", timestamp, timeoffset);
}


//Dec 10 23:59:42 2018
//Dec 10 23:59:42 2018
//timestamp = 1544464782 timeoffset = 21600
-(void)printFromStoredDate{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:1544464782 - [NSTimeZone localTimeZone].secondsFromGMT + 21600];
    NSDateFormatter *formattter = [[NSDateFormatter alloc]init];
    formattter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *dateString = [formattter stringFromDate:date];
    NSLog(@"%@", dateString);
}

//Dec 10 13:15:49 2018
//timestamp = 1544465749 timeoffset = -18000
-(void)printFromStoreDate2{
    int64_t storeTimeZone = -18000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:1544465749 - [NSTimeZone localTimeZone].secondsFromGMT + storeTimeZone];
    
    NSDateFormatter *formattter = [[NSDateFormatter alloc]init];
    formattter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *dateString = [formattter stringFromDate:date];
    NSLog(@"%@", dateString);
}

//Dec 10 13:15:49 2018
//timestamp = 1544465749 timeoffset = -18000
-(void)dateComponentsFromDate{
    int64_t storeTimeZone = -18000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:1544465749 - [NSTimeZone localTimeZone].secondsFromGMT + storeTimeZone];
    NSCalendar *calendarFromNewyorkDate = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *components = [calendarFromNewyorkDate components:(NSCalendarUnitDay) | (NSCalendarUnitMonth) | (NSCalendarUnitYear) |(NSCalendarUnitHour)| (NSCalendarUnitMinute) | (NSCalendarUnitSecond) fromDate:date];
    
    long month = components.month;
    long day = components.day;
    long hour = components.hour;
    long minute = components.minute;
    int64_t seconds = components.second;
    
    NSLog(@"%ld %ld %ld %ld %lld", month, day, hour, minute, seconds);
    
}

-(void)dateComponentsFromDateNewApproach{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:1544465749];
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [calendar setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:-18000]];
    NSDateComponents *components = [calendar components:(NSCalendarUnitDay) | (NSCalendarUnitMonth) | (NSCalendarUnitYear) |(NSCalendarUnitHour)| (NSCalendarUnitMinute) | (NSCalendarUnitSecond) fromDate:date];
    long month = components.month;
    long day = components.day;
    long hour = components.hour;
    long minute = components.minute;
    long second = components.second;
    NSLog(@"%ld %ld %ld %ld %ld", month, day, hour, minute, second);
    
}

@end
