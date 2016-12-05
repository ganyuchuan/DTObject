//
//  DTObject.h
//  DTObjectExample
//
//  Created by huxiu on 2016/10/19.
//  Copyright © 2016年 ganyuchuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DTObject : NSObject

/*!
 *  简易构造
 *
 *  @return DTObject实例对象
 */
+ (instancetype)object;
/*!
 *  根据字典快速构造
 *
 *  @param keyValues 指定键值字典
 *
 *  @return DTObject实例对象
 */
+ (instancetype)objectWithKeyValues:(NSDictionary *)keyValues;
/*!
 *  初始化
 *
 *  @param keyValues 指定键值字典
 *
 *  @return DTObject实例对象
 */
- (instancetype)initWithKeyValues:(NSDictionary *)keyValues;

/*!
 *  根据当前对象获取对应字典
 *
 *  @return 键值字典
 */
- (NSDictionary *)keyValues;
/*!
 *  根据字典设置对象
 *
 *  @param keyValues 键值字典
 */
- (void)setKeyValues:(NSDictionary *)keyValues;

/*!
 *  得到当前类的属性列表
 *
 *  @return 属性数组
 */
+ (NSArray *)properties;

/*!
 *  获取当前类被忽略的属性名集合
 *
 *  @return 被忽略的属性名集合
 */
+ (NSSet *)ignoredPropertyNames;
/*!
 *  设置当前类需要忽略的属性名集合，不进行解析和封装
 *
 *  @param names 被忽略的属性名集合
 */
+ (void)setIgnoredPropertyNames:(NSSet *)names;

/*!
 *  获取当前类被替换的属性名及新名，所组成的一系列键值对字典
 *
 *  @return 键值对（属性名：替换名）字典
 */
+ (NSDictionary *)replacedPropertyNames;
/*!
 *  设置当前类需要替换的属性名及新名，所组成的一系列键值对字典
 *
 *  @param names 键值对（属性名：替换名）字典
 */
+ (void)setReplacedPropertyNames:(NSDictionary *)names;

@end
