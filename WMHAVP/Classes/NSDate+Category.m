//
//  NSDate+Category.h
//  Component
//
//  Created by Janlor on 29/03/2018.
//  Copyright © 2018 Component. All rights reserved.
//

#import "NSDate+Category.h"

#define D_MINUTE    60
#define D_HOUR      3600    // 60 * 60
#define D_DAY       86400   // 60 * 60 * 24
#define D_WEEK      604800  // 60 * 60 * 24 * 7
//#define D_YEAR      31556926

static const unsigned componentFlags = (NSCalendarUnitYear       | NSCalendarUnitMonth          |
                                        NSCalendarUnitDay        | NSCalendarUnitWeekOfMonth    |
                                        NSCalendarUnitWeekOfYear | NSCalendarUnitHour           |
                                        NSCalendarUnitMinute     | NSCalendarUnitSecond         |
                                        NSCalendarUnitWeekday    | NSCalendarUnitWeekdayOrdinal);

@implementation NSDate (Category)

/**
 获获取当前客户端的逻辑日历

 @return 当前客户端的逻辑日历
 */
+ (NSCalendar *)cy_currentCalendar {
    static NSCalendar *sharedCalendar = nil;
    if (!sharedCalendar) {
        if ([NSCalendar respondsToSelector:@selector(calendarWithIdentifier:)]) {
            sharedCalendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
        } else {
            sharedCalendar = [NSCalendar autoupdatingCurrentCalendar];
        }
    }
    return sharedCalendar;
}

/**
 将日期转换为当前时区的日期

 @param forDate 要转换的日期
 @return 转换过的日期
 */
+ (NSDate *)cy_convertDateToLocalTime:(NSDate *)forDate {
    NSTimeZone *nowTimeZone = [NSTimeZone localTimeZone];
    NSInteger timeOffset = [nowTimeZone secondsFromGMTForDate:forDate];
    NSDate *newDate = [forDate dateByAddingTimeInterval:timeOffset];
    return newDate;
}

/**
 把时间戳转换为时间

 @param timeIntervalInMilliSecond 时间戳
 @return 日期对象
 */
+ (NSDate *)cy_dateWithTimeIntervalInMilliSecondSince1970:(double)timeIntervalInMilliSecond {
    NSDate *ret = nil;
    double timeInterval = timeIntervalInMilliSecond;
    // judge if the argument is in secconds(for former data structure).
    if(timeIntervalInMilliSecond > 140000000000) {
        timeInterval = timeIntervalInMilliSecond / 1000;
    }
    ret = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    
    return ret;
}


#pragma mark - 相对日期

/**
 从现在起向后推几天的日期

 @param days 向后推的天数
 @return 后推得到的日期
 */
+ (NSDate *)cy_dateWithDaysFromNow:(NSInteger)days {
    return [[NSDate cy_dateNow] cy_dateByAddingDays:days];
}

/**
 从现在起向前推几天的日期

 @param days 向前推的天数
 @return 得到的日期
 */
+ (NSDate *)cy_dateWithDaysBeforeNow:(NSInteger)days {
    return [[NSDate cy_dateNow] cy_dateBySubtractingDays:days];
}

/**
 从现在起向后推几小时的日期

 @param dHours 向后推的小时数
 @return 后推得到的日期
 */
+ (NSDate *)cy_dateWithHoursFromNow:(NSInteger)dHours {
    NSTimeInterval aTimeInterval = [[NSDate cy_dateNow] timeIntervalSinceReferenceDate] + D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

/**
 从现在起向前推几小时的日期

 @param dHours 向前推的小时数
 @return 前推得到的日期
 */
+ (NSDate *)cy_dateWithHoursBeforeNow:(NSInteger)dHours {
    NSTimeInterval aTimeInterval = [[NSDate cy_dateNow] timeIntervalSinceReferenceDate] - D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

/**
 从现在起向后推几分钟的日期

 @param dMinutes 向后推的分钟数
 @return 后推得到的日期
 */
+ (NSDate *)cy_dateWithMinutesFromNow:(NSInteger)dMinutes {
    NSTimeInterval aTimeInterval = [[NSDate cy_dateNow] timeIntervalSinceReferenceDate] + D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

/**
 从现在起向前推几分钟的日期

 @param dMinutes 向前推的分钟数
 @return 前推得到的日期
 */
+ (NSDate *)cy_dateWithMinutesBeforeNow:(NSInteger)dMinutes {
    NSTimeInterval aTimeInterval = [[NSDate cy_dateNow] timeIntervalSinceReferenceDate] - D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

/**
 明天的日期

 @return 明天的日期
 */
+ (NSDate *)cy_dateTomorrow {
    return [NSDate cy_dateWithDaysFromNow:1];
}

/**
 昨天的日期

 @return 昨天的日期
 */
+ (NSDate *)cy_dateYesterday {
    return[NSDate cy_dateWithDaysBeforeNow:1];
}

/**
 现在的日期

 @return 现在的日期
 */
+ (NSDate *)cy_dateNow {
    return [NSDate date];
}


#pragma mark -日期转换为String

// 使用NSDateFormatter转换时间字符串时，默认的时区是系统时区，如我们使用一般都是北京时间(＋8)

/**
 通过format格式将当前日期转换为String格式

 @param format 格式样式
 @return 转换后得到的String
 */
- (NSString *)cy_stringWithFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];
}

/**
 通过系统自带的时间风格 来得到字符串

 @param dateStyle 日期格式 年月日
 @param timeStyle 时间格式 时分秒
 @return 最终得到的字符串
 */
- (NSString *)cy_stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateStyle = dateStyle;
    formatter.timeStyle = timeStyle;
    return [formatter stringFromDate:self];
}

/**
 5/5/15, 10:48 AM

 @return 相应格式的日期+时间
 */
- (NSString *)cy_shortString {
    return [self cy_stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
}

/**
 10:48 AM

 @return 相应格式的时间
 */
- (NSString *)cy_shortTimeString {
    return [self cy_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterShortStyle];
}

/**
 5/5/15

 @return 响应格式的日期
 */
- (NSString *)cy_shortDateString {
    return [self cy_stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle];
}

/**
 May 5, 2015, 10:35:23 AM

 @return 相应格式的日期+时间
 */
- (NSString *)cy_mediumString {
    return [self cy_stringWithDateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterMediumStyle ];
}

/**
 10:35:23 AM

 @return 相应格式的时间
 */
- (NSString *)cy_mediumTimeString {
    return [self cy_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterMediumStyle ];
}

/**
 May 5, 2015

 @return 相应格式的日期
 */
- (NSString *)cy_mediumDateString {
    return [self cy_stringWithDateStyle:NSDateFormatterMediumStyle  timeStyle:NSDateFormatterNoStyle];
}

/**
 May 5, 2015 at 10:35:23 AM GMT+8

 @return 相应格式的日期+时间
 */
- (NSString *)cy_longString {
    return [self cy_stringWithDateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterLongStyle ];
}

/**
 May 5, 2015

 @return 相应格式的时间
 */
- (NSString *)cy_longTimeString {
    return [self cy_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterLongStyle ];
}

/**
 10:35:23 AM GMT+8

 @return 相应格式的日期
 */
- (NSString *)cy_longDateString {
    return [self cy_stringWithDateStyle:NSDateFormatterLongStyle  timeStyle:NSDateFormatterNoStyle];
}


#pragma mark - 日期比较

/**
 抛弃时间外 日期是否相等 精确到天的范围内

 @param aDate 比较的date
 @return YES 相等 NO 不相等
 */
- (BOOL)cy_isEqualToDateIgnoringTime:(NSDate *)aDate {
    if (aDate == nil) { return NO; }
    NSDateComponents *components1 = [[NSDate cy_currentCalendar] components:componentFlags fromDate:self];
    NSDateComponents *components2 = [[NSDate cy_currentCalendar] components:componentFlags fromDate:aDate];
    return ((components1.year   == components2.year)  &&
            (components1.month  == components2.month) &&
            (components1.day    == components2.day));
}

/**
 日期是不是今天

 @return YES 是 NO 不是
 */
- (BOOL)cy_isToday {
    return [self cy_isEqualToDateIgnoringTime:[NSDate cy_dateNow]];
}

/**
 日期是不是明天

 @return YES  是 NO 不是
 */
- (BOOL)cy_isTomorrow {
    return [self cy_isEqualToDateIgnoringTime:[NSDate cy_dateTomorrow]];
}

/**
 是不是昨天

 @return YES 是 NO 不是
 */
- (BOOL)cy_isYesterday {
    return [self cy_isEqualToDateIgnoringTime:[NSDate cy_dateYesterday]];
}

/**
 判断和指定日期是否是同一个星期内的

 @param aDate 相比较的日期
 @return YES 是 NO 不是
 */
- (BOOL)cy_isSameWeekAsDate:(NSDate *)aDate {
    if (aDate == nil) { return NO; }
    NSDateComponents *components1 = [[NSDate cy_currentCalendar] components:componentFlags fromDate:self];
    NSDateComponents *components2 = [[NSDate cy_currentCalendar] components:componentFlags fromDate:aDate];
    // Must be same week. 12/31 and 1/1 will both be week "1" if they are in the same week
    if (components1.weekOfYear != components2.weekOfYear) return NO;
    // Must have a time interval under 1 week. Thanks @aclark
    return (abs((int)[self timeIntervalSinceDate:aDate]) < D_WEEK);
}

/**
 判断是不是本周

 @return YES 是 NO 不是
 */
- (BOOL)cy_isThisWeek {
    return [self cy_isSameWeekAsDate:[NSDate cy_dateNow]];
}

/**
 判断是不是下周

 @return YES 是 NO  不是
 */
- (BOOL)cy_isNextWeek {
    NSTimeInterval aTimeInterval = [[NSDate cy_dateNow] timeIntervalSinceReferenceDate] + D_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self cy_isSameWeekAsDate:newDate];
}

/**
 判断是不是上周
 
 @return YES 是 NO 不是
 */
- (BOOL)cy_isLastWeek {
    NSTimeInterval aTimeInterval = [[NSDate cy_dateNow] timeIntervalSinceReferenceDate] - D_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self cy_isSameWeekAsDate:newDate];
}

/**
 判断是不是同一个月

 @param aDate 比较的日期
 @return YES 是 NO 不是
 */
- (BOOL)cy_isSameMonthAsDate:(NSDate *)aDate {
    if (aDate == nil) { return NO; }
    NSDateComponents *components1 = [[NSDate cy_currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:self];
    NSDateComponents *components2 = [[NSDate cy_currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:aDate];
    return ((components1.month == components2.month) &&
            (components1.year == components2.year));
}

/**
 判断是不是本月
 *
 @return YES 是 NO 不是
 */
- (BOOL)cy_isThisMonth {
    return [self cy_isSameMonthAsDate:[NSDate cy_dateNow]];
}

/**
 判断是不是上个月

 @return YES 是 NO 不是
 */
- (BOOL)cy_isLastMonth {
    return [self cy_isSameMonthAsDate:[[NSDate cy_dateNow] cy_dateBySubtractingMonths:1]];
}

/**
 判断是不是下个月

 @return YES 是 NO 不是
 */
- (BOOL)cy_isNextMonth {
    return [self cy_isSameMonthAsDate:[[NSDate cy_dateNow] cy_dateByAddingMonths:1]];
}

/**
 判断是不是同一年

 @param aDate 比较的日期
 @return YES 是 NO 不是
 */
- (BOOL)cy_isSameYearAsDate:(NSDate *)aDate {
    if (aDate == nil) { return NO; }
    NSDateComponents *components1 = [[NSDate cy_currentCalendar] components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [[NSDate cy_currentCalendar] components:NSCalendarUnitYear fromDate:aDate];
    return (components1.year == components2.year);
}

/**
 判断是不是本年

 @return YES 是 NO 不是
 */
- (BOOL)cy_isThisYear {
    return [self cy_isSameYearAsDate:[NSDate cy_dateNow]];
}

/**
 判断是不是下一年

 @return YES 是 NO 不是
 */
- (BOOL)cy_isNextYear {
    NSDateComponents *components1 = [[NSDate cy_currentCalendar] components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [[NSDate cy_currentCalendar] components:NSCalendarUnitYear fromDate:[NSDate cy_dateNow]];
    
    return (components1.year == (components2.year + 1));
}

/**
 判断是不是上一年

 @return YES 是 NO 不是
 */
- (BOOL)cy_isLastYear {
    NSDateComponents *components1 = [[NSDate cy_currentCalendar] components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [[NSDate cy_currentCalendar] components:NSCalendarUnitYear fromDate:[NSDate cy_dateNow]];
    return (components1.year == (components2.year - 1));
}

/**
 判断是不是比指定日期早

 @param aDate 指定的日期
 @return YES 早 NO 不早
 */
- (BOOL)cy_isEarlierThanDate:(NSDate *)aDate {
    if (aDate == nil) { return NO; }
    return ([self compare:aDate] == NSOrderedAscending);
}

/**
 判断是不是比指定日期晚

 @param aDate 指定的日期
 @return YES 晚 NO 不晚
 */
- (BOOL)cy_isLaterThanDate:(NSDate *)aDate {
    if (aDate == nil) { return NO; }
    return ([self compare:aDate] == NSOrderedDescending);
}

/**
 判断一个日期是不是在将来

 @return YES 是 NO 不是
 */
- (BOOL)cy_isInFuture {
    return ([self cy_isLaterThanDate:[NSDate cy_dateNow]]);
}

/**
 判断一个日期是不是在过去

 @return YES 是 NO 不是
 */
- (BOOL)cy_isInPast {
    return ([self cy_isEarlierThanDate:[NSDate cy_dateNow]]);
}


#pragma mark - 星期内工作日

/**
 是不是周六日

 @return YES 是 NO 不是
 */
- (BOOL)cy_isTypicallyWeekend {
    NSDateComponents *components = [[NSDate cy_currentCalendar] components:NSCalendarUnitWeekday fromDate:self];
    if ((components.weekday == 1) || (components.weekday == 7)) { return YES; }
    return NO;
}

/**
 是不是工作日

 @return YES 是 NO 不是
 */
- (BOOL)cy_isTypicallyWorkday {
    return ![self cy_isTypicallyWeekend];
}


#pragma mark - 调整日期

/**
 指定日期后推几年得到的日期

 @param dYears 后推的年数
 @return 后推后得到的日期
 */
- (NSDate *)cy_dateByAddingYears:(NSInteger)dYears {
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear:dYears];
    NSDate *newDate = [[NSDate cy_currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

/**
 指定日期前推几年得到的日期

 @param dYears 前推的年数
 @return 前推得到的日期
 */
- (NSDate *)cy_dateBySubtractingYears:(NSInteger)dYears {
    return [self cy_dateByAddingYears:-dYears];
}

/**
 指定日期后推几个月得到的日期

 @param dMonths 后推的月数
 @return 后推后得到的日期
 */
- (NSDate *)cy_dateByAddingMonths:(NSInteger)dMonths {
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setMonth:dMonths];
    NSDate *newDate = [[NSDate cy_currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

/**
 指定日期前推几个月得到的日期

 @param dMonths 前推的月数
 @return 前推后得到的日期
 */
- (NSDate *)cy_dateBySubtractingMonths:(NSInteger)dMonths {
    return [self cy_dateByAddingMonths:-dMonths];
}

/**
 指定日期后推几天得到的日期

 @param dDays 后推的天数
 @return 后推得到的日期
 */
- (NSDate *)cy_dateByAddingDays:(NSInteger)dDays {
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:dDays];
    NSDate *newDate = [[NSDate cy_currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

/**
 指定日期前推几天的到的日期

 @param dDays 前推的天数
 @return 前推得到的日期
 */
- (NSDate *)cy_dateBySubtractingDays:(NSInteger)dDays {
    return [self cy_dateByAddingDays:(dDays * -1)];
}

/**
 指定日期后推几小时得到的日期

 @param dHours 后推的几个小时
 @return 后推后的日期
 */
- (NSDate *)cy_dateByAddingHours:(NSInteger)dHours {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

/**
 指定日期前推几小时得到的日期

 @param dHours 前推的小时数
 @return 前推后得到的日期
 */
- (NSDate *)cy_dateBySubtractingHours:(NSInteger)dHours {
    return [self cy_dateByAddingHours:(dHours * -1)];
}

/**
 指定日期后推几分钟得到的日期

 @param dMinutes 后推的分钟数
 @return 后推得到的日期
 */
- (NSDate *)cy_dateByAddingMinutes:(NSInteger)dMinutes {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

/**
 指定日期前推几分钟得到的日期

 @param dMinutes 前推的分钟数
 @return 前推得到的日期
 */
- (NSDate *)cy_dateBySubtractingMinutes:(NSInteger)dMinutes {
    return [self cy_dateByAddingMinutes:(dMinutes * -1)];
}

/**
 指定日期和给的日期之间相差的时间

 @param aDate 比较的日期
 @return 相差的时间
 */
- (NSDateComponents *)cy_componentsWithOffsetFromDate:(NSDate *)aDate {
    NSDateComponents *dTime = [[NSDate cy_currentCalendar] components:componentFlags fromDate:aDate toDate:self options:0];
    return dTime;
}


#pragma mark - 极端例子

/**
 得到指定日期这一天的开始日期

 @return 得到的日期
 */
- (NSDate *)cy_dateAtStartOfDay {
    NSDateComponents *components = [[NSDate cy_currentCalendar] components:componentFlags fromDate:self];
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    return [[NSDate cy_currentCalendar] dateFromComponents:components];
}

/**
 得到指定日期这一天的结束日期

 @return 得到的日期
 */
- (NSDate *)cy_dateAtEndOfDay {
    NSDateComponents *components = [[NSDate cy_currentCalendar] components:componentFlags fromDate:self];
    components.hour = 23; // Thanks Aleksey Kononov
    components.minute = 59;
    components.second = 59;
    return [[NSDate cy_currentCalendar] dateFromComponents:components];
}

/**
 得到指定日期这一年的开始日期

 @return 得到的日期
 */
- (NSDate *)cy_dateAtStartOfYear {
    NSDateComponents *components = [[NSDate cy_currentCalendar] components:componentFlags fromDate:self];
    components.month = 1;
    components.day = 1;
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    return [[NSDate cy_currentCalendar] dateFromComponents:components];
}


#pragma mark - 检索间隔

/**
 得到当前日期在给定日期之后的分钟数

 @param aDate 给定的日期
 @return 得到的分钟数
 */
- (NSInteger)cy_minutesAfterDate:(NSDate *)aDate {
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / D_MINUTE);
}

/**
 得到当前日期在给定日期之前的分钟数

 @param aDate 给定的日期
 @return 得到的分钟数
 */
- (NSInteger)cy_minutesBeforeDate:(NSDate *)aDate {
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / D_MINUTE);
}

/**
 得到当前日期在给定日期之后的小时数

 @param aDate 给定的日期
 @return 得到的小时数
 */
- (NSInteger)cy_hoursAfterDate:(NSDate *)aDate {
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / D_HOUR);
}

/**
 得到当前日期在给定日期之后的小时数

 @param aDate 给定的日期
 @return 得到的小时数
 */
- (NSInteger)cy_hoursBeforeDate:(NSDate *)aDate {
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / D_HOUR);
}

/**
 得到当前日期在给定日期之后的天数

 @param aDate 给定的日期
 @return 得到的天数
 */
- (NSInteger)cy_daysAfterDate:(NSDate *)aDate {
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / D_DAY);
}

/**
 得到当前日期在给定日期之前的天数

 @param aDate 给定的日期
 @return 得到的天数
 */
- (NSInteger)cy_daysBeforeDate:(NSDate *)aDate {
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / D_DAY);
}

/**
 当前的日期和给定的日期之间相差的天数

 @param anotherDate 给定的日期
 @return 相差的天数
 */
- (NSInteger)cy_distanceInDaysToDate:(NSDate *)anotherDate {
    NSDateComponents *components = [[NSDate cy_currentCalendar] components:NSCalendarUnitDay fromDate:self toDate:anotherDate options:0];
    return components.day;
}


#pragma mark - 日期分解

/**
 距离当前时间最近的小时 比如9：55 就是10：00 9：25就是9：00

 @return 最近的小时
 */
- (NSInteger)cy_nearestHour {
    NSTimeInterval aTimeInterval = [[NSDate cy_dateNow] timeIntervalSinceReferenceDate] + D_MINUTE * 30;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    NSDateComponents *components = [[NSDate cy_currentCalendar] components:NSCalendarUnitHour fromDate:newDate];
    return components.hour;
}

/**
 当前日期的小时

 @return 当前日期的小时
 */
- (NSInteger)cy_hour {
    NSDateComponents *components = [[NSDate cy_currentCalendar] components:componentFlags fromDate:self];
    return components.hour;
}

/**
 当前日期的分钟

 @return 当前日期的分钟
 */
- (NSInteger)cy_minute {
    NSDateComponents *components = [[NSDate cy_currentCalendar] components:componentFlags fromDate:self];
    return components.minute;
}

/**
 当前日期的秒

 @return 当前日期的秒
 */
- (NSInteger)cy_seconds {
    NSDateComponents *components = [[NSDate cy_currentCalendar] components:componentFlags fromDate:self];
    return components.second;
}

/**
 当前日期的几号

 @return 当前日期的几号
 */
- (NSInteger)cy_day {
    NSDateComponents *components = [[NSDate cy_currentCalendar] components:componentFlags fromDate:self];
    return components.day;
}

/**
 当前日期的几月

 @return 当前日期的几月
 */
- (NSInteger)cy_month {
    NSDateComponents *components = [[NSDate cy_currentCalendar] components:componentFlags fromDate:self];
    return components.month;
}

/**
 当前月的第几周

 @return 当前月的第几周
 */
- (NSInteger)cy_weekOfMonth {
    NSDateComponents *components = [[NSDate cy_currentCalendar] components:componentFlags fromDate:self];
    return components.weekOfMonth;
}

/**
 当前年的第几周

 @return 当前年的第几周
 */
- (NSInteger)cy_weekOfYear {
    NSDateComponents *components = [[NSDate cy_currentCalendar] components:componentFlags fromDate:self];
    return components.weekOfYear;
}

/**
 当前日期所在周的第几天

 @return 第几天
 */
- (NSInteger)cy_weekday {
    NSDateComponents *components = [[NSDate cy_currentCalendar] components:componentFlags fromDate:self];
    return components.weekday;
}

/**
 当前日期所在年的第几季度

 @return 获得的季度
 */
- (NSInteger)cy_nthWeekday { // e.g. 2nd Tuesday of the month is 2
    NSDateComponents *components = [[NSDate cy_currentCalendar] components:componentFlags fromDate:self];
    return components.weekdayOrdinal;
}

/**
 当前日期的年

 @return 当前日期的年
 */
- (NSInteger)cy_year {
    NSDateComponents *components = [[NSDate cy_currentCalendar] components:componentFlags fromDate:self];
    return components.year;
}

@end
