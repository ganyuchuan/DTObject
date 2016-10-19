//
//  DTObject.h
//  DTObjectExample
//
//  Created by huxiu on 2016/10/19.
//  Copyright © 2016年 ganyuchuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DTObject : NSObject

+ (instancetype)object;
+ (instancetype)objectWithKeyValues:(NSDictionary *)keyValues;
- (instancetype)initWithKeyValues:(NSDictionary *)keyValues;

- (NSDictionary *)keyValues;
- (void)setKeyValues:(NSDictionary *)keyValues;

+ (NSArray *)properties;

+ (NSSet *)ignoredPropertyNames;
+ (void)setIgnoredPropertyNames:(NSSet *)names;
+ (NSDictionary *)replacedPropertyNames;
+ (void)setReplacedPropertyNames:(NSDictionary *)names;

@end
