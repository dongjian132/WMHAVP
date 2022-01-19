//
//  NSDate+Category.h
//  Component
//
//  Created by Janlor on 29/03/2018.
//  Copyright © 2018 Component. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Category)

+ (NSCalendar *)cy_currentCalendar;
+ (NSDate *)cy_convertDateToLocalTime:(NSDate *)forDate;
+ (NSDate *)cy_dateWithTimeIntervalInMilliSecondSince1970:(double)timeIntervalInMilliSecond;


#pragma mark - 相对日期

+ (NSDate *)cy_dateNow;
+ (NSDate *)cy_dateTomorrow;
+ (NSDate *)cy_dateYesterday;
+ (NSDate *)cy_dateWithDaysFromNow:(NSInteger)days;
+ (NSDate *)cy_dateWithDaysBeforeNow:(NSInteger)days;
+ (NSDate *)cy_dateWithHoursFromNow:(NSInteger)dHours;
+ (NSDate *)cy_dateWithHoursBeforeNow:(NSInteger)dHours;
+ (NSDate *)cy_dateWithMinutesFromNow:(NSInteger) dMinutes;
+ (NSDate *)cy_dateWithMinutesBeforeNow:(NSInteger)dMinutes;


#pragma mark - 日期转字符串

- (NSString *)cy_stringWithFormat:(NSString *)format;
- (NSString *)cy_stringWithDateStyle:(NSDateFormatterStyle)dateStyle
                           timeStyle:(NSDateFormatterStyle)timeStyle;
@property (nonatomic, readonly) NSString *cy_shortString;
@property (nonatomic, readonly) NSString *cy_shortDateString;
@property (nonatomic, readonly) NSString *cy_shortTimeString;
@property (nonatomic, readonly) NSString *cy_mediumString;
@property (nonatomic, readonly) NSString *cy_mediumDateString;
@property (nonatomic, readonly) NSString *cy_mediumTimeString;
@property (nonatomic, readonly) NSString *cy_longString;
@property (nonatomic, readonly) NSString *cy_longDateString;
@property (nonatomic, readonly) NSString *cy_longTimeString;


#pragma mark - 日期比较

- (BOOL)cy_isEqualToDateIgnoringTime:(NSDate *)aDate;

- (BOOL)cy_isToday;
- (BOOL)cy_isTomorrow;
- (BOOL)cy_isYesterday;

- (BOOL)cy_isSameWeekAsDate:(NSDate *)aDate;
- (BOOL)cy_isThisWeek;
- (BOOL)cy_isNextWeek;
- (BOOL)cy_isLastWeek;

- (BOOL)cy_isSameMonthAsDate:(NSDate *)aDate;
- (BOOL)cy_isThisMonth;
- (BOOL)cy_isNextMonth;
- (BOOL)cy_isLastMonth;

- (BOOL)cy_isSameYearAsDate:(NSDate *)aDate;
- (BOOL)cy_isThisYear;
- (BOOL)cy_isNextYear;
- (BOOL)cy_isLastYear;

- (BOOL)cy_isEarlierThanDate:(NSDate *)aDate;
- (BOOL)cy_isLaterThanDate:(NSDate *)aDate;

- (BOOL)cy_isInFuture;
- (BOOL)cy_isInPast;


#pragma mark - 日期规则

- (BOOL)cy_isTypicallyWorkday;
- (BOOL)cy_isTypicallyWeekend;


#pragma mark - 调整日期

- (NSDate *)cy_dateByAddingYears:(NSInteger)dYears;
- (NSDate *)cy_dateBySubtractingYears:(NSInteger)dYears;
- (NSDate *)cy_dateByAddingMonths:(NSInteger)dMonths;
- (NSDate *)cy_dateBySubtractingMonths:(NSInteger)dMonths;
- (NSDate *)cy_dateByAddingDays:(NSInteger)dDays;
- (NSDate *)cy_dateBySubtractingDays:(NSInteger)dDays;
- (NSDate *)cy_dateByAddingHours:(NSInteger)dHours;
- (NSDate *)cy_dateBySubtractingHours:(NSInteger)dHours;
- (NSDate *)cy_dateByAddingMinutes:(NSInteger)dMinutes;
- (NSDate *)cy_dateBySubtractingMinutes:(NSInteger)dMinutes;


#pragma mark - 极端日期

- (NSDate *)cy_dateAtStartOfDay;
- (NSDate *)cy_dateAtEndOfDay;
- (NSDate *)cy_dateAtStartOfYear;

#pragma mark - 日期间隔

- (NSInteger)cy_minutesAfterDate:(NSDate *)aDate;
- (NSInteger)cy_minutesBeforeDate:(NSDate *)aDate;
- (NSInteger)cy_hoursAfterDate:(NSDate *)aDate;
- (NSInteger)cy_hoursBeforeDate:(NSDate *)aDate;
- (NSInteger)cy_daysAfterDate:(NSDate *)aDate;
- (NSInteger)cy_daysBeforeDate:(NSDate *)aDate;
- (NSInteger)cy_distanceInDaysToDate:(NSDate *)anotherDate;


#pragma mark - 分解日期

@property (readonly) NSInteger cy_nearestHour;
@property (readonly) NSInteger cy_hour;
@property (readonly) NSInteger cy_minute;
@property (readonly) NSInteger cy_seconds;
@property (readonly) NSInteger cy_day;
@property (readonly) NSInteger cy_month;
@property (readonly) NSInteger cy_weekOfMonth;
@property (readonly) NSInteger cy_weekOfYear;
@property (readonly) NSInteger cy_weekday;
@property (readonly) NSInteger cy_nthWeekday; // e.g. 2nd Tuesday of the month == 2
@property (readonly) NSInteger cy_year;

@end
