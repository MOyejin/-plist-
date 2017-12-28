//
//  MOMultiLanguage.m
//  E农会
//
//  Created by 莫瑞伟 on 16/5/28.
//  Copyright © 2016年 莫瑞伟. All rights reserved.
//

#import "MOMultiLanguage.h"

@implementation MOMultiLanguage

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
    
}
+ (instancetype)plistsWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
    
}
+ (NSString *)getLanguageWithKey:(NSString *)key
{

    NSString *str_text = [self plistsList:key];

    return str_text;
}
+ (NSString *)plistsList:(NSString *)KeyName
{

    //加载plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MOMultiLanguage" ofType:@"plist"];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *str_language = [userDefaults valueForKey:@"MOMultiLanguage"];
    
    NSDictionary *dic = [NSDictionary dictionary];
    if (str_language == nil || [str_language isEqualToString:@"dic_chinese"]) {
        dic = [dicArray[0] objectForKey:@"dic_chinese"];//dic_chinese,dic_english
    }
    if ([str_language isEqualToString:@"dic_english"]) {
        dic = [dicArray[0] objectForKey:@"dic_english"];//dic_chinese,dic_english
    }
    
    NSDictionary *dic_title = [dic objectForKey:KeyName];
    
    return [dic_title objectForKey:@"title"];
}

@end
