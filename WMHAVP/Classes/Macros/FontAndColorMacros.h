//
//  FontAndColorMacros.h
//  PenguinCar
//
//  Created by sike on 2018/5/16.
//  Copyright © 2018年 sike. All rights reserved.
//

#ifndef FontAndColorMacros_h
#define FontAndColorMacros_h

/************************************* 字体 *********************************************************/

#define WM_FONT(FONTSIZE) [UIFont systemFontOfSize:FONTSIZE]
#define WM_BOLD_FONT(FONTSIZE) [UIFont boldSystemFontOfSize:FONTSIZE]
#define WM_FONT_WEIGHT_MEDIUM(FONTSIZE) [UIFont systemFontOfSize:FONTSIZE weight:UIFontWeightMedium]
#define WM_FONT_WEIGHT_SEMIBOLD(FONTSIZE) [UIFont systemFontOfSize:FONTSIZE weight:UIFontWeightSemibold]
#define WM_FONT_WEIGHT_LIGHT(FONTSIZE) [UIFont systemFontOfSize:FONTSIZE weight:UIFontWeightLight]
#define WM_FONT_WEIGHT_REGULAR(FONTSIZE) [UIFont systemFontOfSize:FONTSIZE weight:UIFontWeightRegular]
#define WM_FONT_WEIGHT_DINALTERNATE(FONTSIZE) [UIFont fontWithName:@"DIN Alternate" size: FONTSIZE] //系统自带的字体

// 正常字体
#define WM_F8  [UIFont systemFontOfSize:8]
#define WM_F9  [UIFont systemFontOfSize:9]
#define WM_F10 [UIFont systemFontOfSize:10]
#define WM_F11 [UIFont systemFontOfSize:11]
#define WM_F12 [UIFont systemFontOfSize:12]
#define WM_F13 [UIFont systemFontOfSize:13]
#define WM_F14 [UIFont systemFontOfSize:14]
#define WM_F15 [UIFont systemFontOfSize:15]
#define WM_F16 [UIFont systemFontOfSize:16]
#define WM_F17 [UIFont systemFontOfSize:17]
#define WM_F18 [UIFont systemFontOfSize:18]
#define WM_F19 [UIFont systemFontOfSize:19]
#define WM_F20 [UIFont systemFontOfSize:20]
#define WM_F21 [UIFont systemFontOfSize:21]
#define WM_F22 [UIFont systemFontOfSize:22]
#define WM_F23 [UIFont systemFontOfSize:23]
#define WM_F24 [UIFont systemFontOfSize:24]
#define WM_F25 [UIFont systemFontOfSize:25]
#define WM_F26 [UIFont systemFontOfSize:26]
#define WM_F27 [UIFont systemFontOfSize:27]
#define WM_F28 [UIFont systemFontOfSize:28]
#define WM_F29 [UIFont systemFontOfSize:29]
#define WM_F30 [UIFont systemFontOfSize:30]
// 粗体
#define WM_FB8  [UIFont boldSystemFontOfSize:8]
#define WM_FB9  [UIFont boldSystemFontOfSize:9]
#define WM_FB10 [UIFont boldSystemFontOfSize:10]
#define WM_FB11 [UIFont boldSystemFontOfSize:11]
#define WM_FB12 [UIFont boldSystemFontOfSize:12]
#define WM_FB13 [UIFont boldSystemFontOfSize:13]
#define WM_FB14 [UIFont boldSystemFontOfSize:14]
#define WM_FB15 [UIFont boldSystemFontOfSize:15]
#define WM_FB16 [UIFont boldSystemFontOfSize:16]
#define WM_FB17 [UIFont boldSystemFontOfSize:17]
#define WM_FB18 [UIFont boldSystemFontOfSize:18]
#define WM_FB19 [UIFont boldSystemFontOfSize:19]
#define WM_FB20 [UIFont boldSystemFontOfSize:20]
#define WM_FB21 [UIFont boldSystemFontOfSize:21]
#define WM_FB22 [UIFont boldSystemFontOfSize:22]
#define WM_FB23 [UIFont boldSystemFontOfSize:23]
#define WM_FB24 [UIFont boldSystemFontOfSize:24]
#define WM_FB25 [UIFont boldSystemFontOfSize:25]
#define WM_FB26 [UIFont boldSystemFontOfSize:26]
#define WM_FB27 [UIFont boldSystemFontOfSize:27]
#define WM_FB28 [UIFont boldSystemFontOfSize:28]
#define WM_FB29 [UIFont boldSystemFontOfSize:29]
#define WM_FB30 [UIFont boldSystemFontOfSize:30]

/************************************* 颜色 *********************************************************/

// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
// rgb颜色转换、alpha（16进制->10进制）
#define UIColorFromRGBA(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(float)a]
// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

// 常用颜色
#define WM_BLACK_COLOR_1 UIColorFromRGB(0x3a3651)
#define WM_BLACK_COLOR_2 UIColorFromRGB(0x0A0526)
#define WM_BLACK_COLOR_3 UIColorFromRGB(0x333333)
#define WM_BLACK_COLOR_4 UIColorFromRGB(0x2D3045)
#define WM_BLACK_COLOR_5 UIColorFromRGB(0xD8D8D8)
#define WM_BLACK_COLOR_6 UIColorFromRGB(0x666666)
#define WM_BLACK_COLOR_8 UIColorFromRGB(0x888888)
#define WM_BLACK_COLOR_9 UIColorFromRGB(0x999999)
#define WM_BLACK_COLOR_10 UIColorFromRGB(0x111111)
#define WM_BLACK_COLOR_D1 UIColorFromRGB(0xD1D4DA)
#define WM_BLACK_COLOR_2D UIColorFromRGB(0x2D354C)
#define WM_BLACK_COLOR_1E UIColorFromRGB(0x1E2C55)
#define WM_BLACK_COLOR_E6 UIColorFromRGB(0xE6E6E6)
#define WM_BLACK_COLOR_22 UIColorFromRGB(0x222222)
#define WM_BLACK_COLOR_A0 UIColorFromRGB(0xA0A6B3)
#define WM_BLACK_COLOR_2F UIColorFromRGB(0x2F2F2F)
#define WM_BLACK_COLOR_8D UIColorFromRGB(0x8D8D8D)
#define WM_BLACK_COLOR_5D UIColorFromRGB(0x384B5D)
#define WM_BLACK_COLOR_36 UIColorFromRGB(0x112436)
#define WM_BLACK_COLOR_65 UIColorFromRGB(0x656C77)
#define WM_BLACK_COLOR_13 UIColorFromRGB(0x131824)
#define WM_BLACK_COLOR_39 UIColorFromRGB(0x394158)
#define WM_BLACK_COLOR_F1 UIColorFromRGB(0xF1F1F1)
#define WM_BLACK_COLOR_F4 UIColorFromRGB(0xF4F5F6)
#define WM_BLACK_COLOR_0B UIColorFromRGB(0x0B1A28)

#define WM_GREEN_COLOR_31 UIColorFromRGB(0x31BFA0)
#define WM_GREEN_COLOR_EF UIColorFromRGB(0xEFFBF9)
#define WM_GREEN_COLOR_41 UIColorFromRGB(0x41CEAF)
#define WM_GREEN_COLOR_30 UIColorFromRGB(0x30B427)

#define WM_RED_COLOR_5 UIColorFromRGB(0xF8654B)
#define WM_RED_COLOR_EF UIColorFromRGB(0xEF4151)
#define WM_RED_COLOR_FF UIColorFromRGB(0xFF551F)
#define WM_RED_COLOR_FA UIColorFromRGB(0xFAA540)

#define WM_BLUE_COLOR_3 UIColorFromRGB(0xEEFAFE)

#define WM_ORANGE_COLOR_1 UIColorFromRGB(0xEE8164)
#define WM_ORANGE_COLOR_3 UIColorFromRGB(0xEDA106)
#define WM_ORANGE_COLOR_ED8 UIColorFromRGB(0xED840A)
#define WM_ORANGE_COLOR_58 UIColorFromRGB(0xF7AF58)
#define WM_ORANGE_COLOR_F3 UIColorFromRGB(0xF39235)

#define WM_YELLOW_COLOR_1 UIColorFromRGB(0xFDEFCF)
#define WM_YELLOW_COLOR_FF UIColorFromRGB(0xFFCE4E)

#define WM_BROWN_COLOR_5A UIColorFromRGB(0x5A2000)

#define WM_LIGHTGRAY_COLOR_F9 UIColorFromRGB(0xF9F9F9)
#define WM_LIGHTGRAY_COLOR_FA UIColorFromRGB(0xFAFAFA)
#define WM_LIGHTGRAY_COLOR_CA UIColorFromRGB(0xCACACA)
#define WM_LIGHTGRAY_COLOR_F6 UIColorFromRGB(0xF6F6F6)
#define WM_LIGHTGRAY_COLOR_E9 UIColorFromRGB(0xE9EBEC)
#define WM_LIGHTGRAY_COLOR_CC UIColorFromRGB(0xCCCCCC)
#define WM_LIGHTGRAY_COLOR_EA UIColorFromRGB(0xEAECF2)
#define WM_LIGHTGRAY_COLOR_F2 UIColorFromRGB(0xF2F2F2)
#define WM_LIGHTGRAY_COLOR_F4 UIColorFromRGB(0xF4F4F4)
#define WM_LIGHTGRAY_COLOR_F4F UIColorFromRGB(0xF4F5F6)
#define WM_LIGHTGRAY_COLOR_5A UIColorFromRGB(0x5A5A5B)
#define WM_LIGHTGRAY_COLOR_DA UIColorFromRGB(0xDADADA)
#define WM_LIGHTGRAY_COLOR_FAF UIColorFromRGB(0xFAFAFB)
#define WM_LIGHTGRAY_COLOR_9D UIColorFromRGB(0x9DA4B4)
#define WM_LIGHTGRAY_COLOR_F8 UIColorFromRGB(0xF8F8F8)
#define WM_LIGHTGRAY_COLOR_97 UIColorFromRGB(0x979797)
#define WM_LIGHTGRAY_COLOR_2C UIColorFromRGB(0x2C354C)
#define WM_LIGHTGRAY_COLOR_EE UIColorFromRGB(0xEEEEEF)
#define WM_LIGHTGRAY_COLOR_F5 UIColorFromRGB(0xF5F5F5)
#define WM_LIGHTGRAY_COLOR_CF UIColorFromRGB(0xCFCFCF)
#define WM_LIGHTGRAY_COLOR_49 UIColorFromRGB(0x496176)
#define WM_LIGHTGRAY_COLOR_6C UIColorFromRGB(0x6C7590)
#define WM_LIGHTGRAY_COLOR_D4 UIColorFromRGB(0xD4D8DC)
#define WM_LIGHTGRAY_COLOR_A2 UIColorFromRGB(0xA2AAB1)
#define WM_LIGHTGRAY_COLOR_6A UIColorFromRGB(0x6AFFA3)
#define WM_LIGHTGRAY_COLOR_E6 UIColorFromRGB(0xEFF7F6)
#define WM_LIGHTGRAY_COLOR_EF UIColorFromRGB(0xEFF3F7)
#define WM_LIGHTGRAY_COLOR_EB UIColorFromRGB(0xEBEBEB)
#define WM_LIGHTGRAY_COLOR_FB UIColorFromRGB(0xFBFBFB)
#define WM_LIGHTGRAY_COLOR_BF UIColorFromRGB(0xBFBFBF)
#define WM_LIGHTGRAY_COLOR_E5 UIColorFromRGB(0xE5E5E5)
#define WM_LIGHTGRAY_COLOR_D5 UIColorFromRGB(0xD5DBE0)
#define WM_LIGHTGRAY_COLOR_F6F8F9 UIColorFromRGB(0xF6F8F9)
#define WM_LIGHTGRAY_COLOR_DF UIColorFromRGB(0xDFDFE0)
#define WM_LIGHTGRAY_COLOR_65 UIColorFromRGB(0x656C77)
#define WM_LIGHTGRAY_COLOR_F7 UIColorFromRGB(0xF7F7F7)
#define WM_LIGHTGRAY_COLOR_E9E UIColorFromRGB(0xE9E9E9)
#define WM_LIGHTGRAY_COLOR_F1 UIColorFromRGB(0xF1F1F1)
#define WM_LIGHTGRAY_COLOR_EAE UIColorFromRGB(0xEAEBEB)
#define WM_LIGHTGRAY_COLOR_F47 UIColorFromRGB(0xF47A3D)

#define WM_DARK_COLOR_26 UIColorFromRGB(0x26333F)
#define WM_DARK_COLOR_43 UIColorFromRGB(0x435260)
#define WM_DARK_COLOR_65 UIColorFromRGB(0x656C77)
#define WM_DARK_COLOR_49 UIColorFromRGB(0x496176)


#define WM_TABLE_BACKGROUND_COLOR UIColorFromRGB(0xF7F7F7)
#define WM_TABLE_SEPARATOR_COLOR UIColorFromRGB(0xEDEDED)
#define WM_DIVIDING_LINE_COLOR UIColorFromRGB(0xEAEAEA)


#define WM_BLACK_COLOR     [UIColor blackColor]
#define WM_CLEAR_COLOR     [UIColor clearColor]
#define WM_WHITE_COLOR     [UIColor whiteColor]
#define WM_LIGHTGRAY_COLOR [UIColor lightGrayColor]

#endif /* UIConfig_h */
