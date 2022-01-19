//
//  Commonfig.h
//  PenguinCar
//
//  Created by sike on 2018/5/16.
//  Copyright © 2018年 sike. All rights reserved.
//

#ifndef Commonfig_h
#define Commonfig_h

/************************************* UI ***********************************************/

#define WM_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define WM_SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define WM_STATUS_BAR_HEIGHT [UIApplication sharedApplication].statusBarFrame.size.height
#define WM_TOP_GAP (WM_IS_IPHONE_X ? 24.f : 0.f)
#define WM_BOTTOM_BAR_HEIGHT (WM_IS_IPHONE_X ? 83.f : 49.f)
#define WM_TABBAR_SAFE_BOTTOM_MARGIN (WM_IS_IPHONE_X ? 34.f : 0.f)
#define WM_VIEW_SAFEAREA_INSETS(view) ({UIEdgeInsets insets; if(@available(iOS 11.0, *)) {insets = view.safeAreaInsets;} else {insets = UIEdgeInsetsZero;} insets;})
#define WM_NAV_BAR_HEIGHT_WITH_STATUS (WM_IS_IPHONE_X ? 88.f : 64.f)
// 视图距界面边距
#define WM_VIEW_MARGIN (15.0f)
#define WM_VIEW_MARGIN_16 (16.0f) ///< 16的间距
#define WM_VIEW_MARGIN_20 (20.0f) ///< 20的间距

#define WM_M6_SCALE (WM_SCREEN_WIDTH / 375.f)
#define WM_M6_WIDTH (375.f)
//************************************* iPhone判断 ***********************************************/

// 4 inch
#define WM_IS_IPHONE_5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
// 4.7 inch
#define WM_IS_IPHONE_6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
// 5.4 inch
#define WM_IS_IPHONE_12_MINI ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// 5.5 inch
#define WM_IS_IPHONE_6P_NORMAL ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define WM_IS_IPHONE_6P_BIG_MODE ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) : NO)
#define WM_IS_IPHONE_6P (WM_IS_IPHONE_6P_NORMAL || WM_IS_IPHONE_6P_BIG_MODE)
// 5.8 inch
#define WM_IS_IPHONE_XS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// 6.1 inch
#define WM_IS_IPHONE_XR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1624), [[UIScreen mainScreen] currentMode].size) : NO)
#define WM_IS_IPHONE_12_PRO ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1170, 2532), [[UIScreen mainScreen] currentMode].size) : NO)
// 6.5 inch
#define WM_IS_IPHONE_XS_MAX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)
#define WM_IS_IPHONE_X_REAL ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
// 6.7 inch
#define WM_IS_IPHONE_12_PRO_MAX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1284, 2778), [[UIScreen mainScreen] currentMode].size) : NO)
// iPhone X 系列
#define WM_IS_IPHONE_X (WM_IS_IPHONE_X_REAL || WM_IS_IPHONE_XS || WM_IS_IPHONE_XS_MAX || WM_IS_IPHONE_XR || WM_IS_IPHONE_12_MINI || WM_IS_IPHONE_12_PRO || WM_IS_IPHONE_12_PRO_MAX)

#define WM_SCREEN_SCALE ([[UIScreen mainScreen] scale])
#define WM_IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? YES : NO)
#define WM_IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? YES : NO)

/************************************* 系统 *********************************************************/
//获得当前app版本号
#define APP_VERSION             [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define APP_VERSION_TEST             [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
// 获取系统版本
#define WM_CURRENT_SYSTEM_VERSION [[UIDevice currentDevice] systemVersion]
#define WM_IOS_VERSION [WM_CURRENT_SYSTEM_VERSION floatValue]

#define WM_WEAK_SELF(weakSelf) __weak __typeof(&*self)weakSelf = self
#define WM_REQUEST_COMPLETION(args...) !completion ?: completion(args)

#define WM_NIB_NAME(name) [UINib nibWithNibName:name bundle:[NSBundle mainBundle]]

/************************************* 图片 *********************************************************/

#define WM_IMAGE_NAMED(name) [UIImage imageNamed:name]
// 读取本地图片 性能更高
#define WM_LOAD_LOCAL_IMAGE(file, ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:file ofType:ext]]
/// 图片切图 north
#define WM_IMAGE_THUMB_TOP_URL(URL, WIDTH, HEIGHT) ([NSString stringWithFormat:@"%@?imageMogr2/crop/%lfx%lf/gravity/north", URL, (WIDTH) * WM_SCREEN_SCALE, (HEIGHT) * WM_SCREEN_SCALE])
/// 图片切图 northwest
#define WM_IMAGE_THUMB_LEFT_TOP_URL(URL, WIDTH, HEIGHT) ([NSString stringWithFormat:@"%@?imageMogr2/crop/%lfx%lf/gravity/northwest", URL, (WIDTH) * WM_SCREEN_SCALE, (HEIGHT) * WM_SCREEN_SCALE])
/// 图片等比缩放，指定目标图片宽度为 Width，高度等比压缩
#define WM_IMAGE_THUMB_WIDTH_URL(URL, WIDTH) ([NSString stringWithFormat:@"%@?imageMogr2/thumbnail/%lfx", URL, (WIDTH) * WM_SCREEN_SCALE])

/************************************* 是否为空 *********************************************************/

// 字符串是否为空
#define WM_STR_IS_EMPTY(_ref)       (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref)isEqualToString:@""]))
// 数组是否为空
#define WM_ARR_IS_EMPTY(_ref)       (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) || ![(_ref) isKindOfClass:[NSArray class]] || ([(_ref) count] == 0))
// 字典为空
#define WM_DICT_IS_EMPTY(_ref)      (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) || ![(_ref) isKindOfClass:[NSDictionary class]] || ([(_ref) count] == 0))
// number是否为空
#define WM_NUM_IS_EMPTY(_ref)       (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) || ![(_ref) isKindOfClass:[NSNumber class]] || (_ref.integerValue == 0))
// 是否为空或是[NSNull null]
#define WM_IS_NIL_Or_NULL(_ref)     (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]))
// 为空则显示@""
#define WM_SAFE_STR(_ref)       (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]])?@"":_ref)

// 返回正确的NSNumber类型
#define WM_REAL_NUM_VALUE(_ref) (([(_ref) isKindOfClass:NSNumber.class]) ? (_ref) : (([(_ref) isKindOfClass:NSString.class]) ? (@(((_ref).longLongValue))) : nil))
// 返回正确的NSString类型
#define WM_REAL_STR_VALUE(_ref) (([(_ref) isKindOfClass:NSString.class]) ? (_ref) : (([(_ref) isKindOfClass:NSNumber.class]) ? ((@(((_ref).longLongValue))).stringValue) : nil))

/************************************* 类方法的宏定义 *********************************************************/

//delegate 代理
#define WMAppDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#define WM_KEY_WINDOW [[UIApplication sharedApplication] keyWindow]
#define WM_ROOT_VIEW_CONTROLLER [[[UIApplication sharedApplication] keyWindow] rootViewController]
#define WM_VIEW_CONTROLLER_NAME(name) [NSString stringWithFormat:@"WM%@ViewController", name]
#define WM_VIEW_CONTROLLER_SHORT_NAME(vcName) (vcName.length < 16 ? vcName : [vcName substringWithRange:NSMakeRange(2, vcName.length - 16)])

/************************************* gcd *********************************************************/

#define WM_GLOBAL_QUEUE(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define WM_MAIN_QUEUE(block) dispatch_async(dispatch_get_main_queue(),block)
#define WM_MAIN_QUEUE_AFTER(second, block) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(second * NSEC_PER_SEC)), dispatch_get_main_queue(), block)

/************************************* NSLog *********************************************************/

// DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

//安全使用self 防止block中循环引用

#define WS(weakSelf)  __weak __typeof(self)weakSelf = self;

// kWeakify
#define kWeakify(var) __weak __typeof(var) weak_##var = var;

// kStrongify
#define kStrongify(var) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
__strong __typeof(var) var = weak_##var; \
_Pragma("clang diagnostic pop")

#define kWeakSelf       kWeakify(self)
#define kStrongSelf     kStrongify(self)

#endif /* Commonfig_h */
