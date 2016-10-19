//
//  DTObject.m
//  DTObjectExample
//
//  Created by huxiu on 2016/10/19.
//  Copyright © 2016年 ganyuchuan. All rights reserved.
//

#import "DTObject.h"
#import "DTProperty.h"
#import <objc/runtime.h>

static NSMutableDictionary *AllClassProperties;

static NSMutableDictionary *AllClassIgnoredPropertyNames;
static NSMutableDictionary *AllClassReplacedPropertyNames;

@implementation DTObject {
    NSMutableDictionary *_keyValues;
}

+ (instancetype)object {
    return [self objectWithKeyValues:nil];
}

+ (instancetype)objectWithKeyValues:(NSDictionary *)keyValues {
    return [[self alloc] initWithKeyValues:keyValues];
}

- (instancetype)initWithKeyValues:(NSDictionary *)keyValues {
    if (self = [super init]) {
        if (keyValues) [self setKeyValues:keyValues];
    }
    
    return self;
}

- (NSDictionary *)keyValues {
    id keyValues = [NSMutableDictionary dictionaryWithCapacity:0];
    
    Class aClass = [self class];
    NSSet *ignoredPropertyNames = [aClass ignoredPropertyNames];
    NSDictionary *replacedPropertyNames = [aClass replacedPropertyNames];
    
    for (DTProperty *property in [DTObject properties]) {
        if (ignoredPropertyNames.count > 0 && [ignoredPropertyNames containsObject:property.name]) continue;
        
        // 获取对象属性中value的key
        NSString *key;
        if (replacedPropertyNames.count > 0 && [replacedPropertyNames.allKeys containsObject:property.name]) key = [replacedPropertyNames objectForKey:property.name];
        else key = property.name;
        
        // 获取value
        id value = [self valueForKey:property.name];
        if (value == nil) continue;
        
        // 使用KVC进行赋值
        if (property.isFoundationClass) [keyValues setObject:value forKey:key];
    }
    
    return [keyValues copy];
}

- (void)setKeyValues:(NSDictionary *)keyValues {
    if (keyValues.count == 0) return;
    
    Class aClass = [self class];
    NSSet *ignoredPropertyNames = [aClass ignoredPropertyNames];
    NSDictionary *replacedPropertyNames = [aClass replacedPropertyNames];
    
    for (DTProperty *property in [DTObject properties]) {
        if (ignoredPropertyNames.count > 0 && [ignoredPropertyNames containsObject:property.name]) continue;
        
        // 获取参数字典中value的key
        NSString *key;
        if (replacedPropertyNames.count > 0 && [replacedPropertyNames.allKeys containsObject:property.name]) key = [replacedPropertyNames objectForKey:property.name];
        else key = property.name;
        
        // 获取value
        id value = [keyValues objectForKey:key];
        if (value == nil) continue;
        
        // 使用KVC进行赋值
        if (property.isFoundationClass) [self setValue:value forKey:property.name];
    }
}

+ (NSArray *)properties {
    __unsafe_unretained Class cls = self;
    NSString *className = NSStringFromClass(cls);
    
    // 初始化AllClassProperties
    if (AllClassProperties == nil) {
        AllClassProperties = [NSMutableDictionary dictionaryWithCapacity:0];
    }
    // 获取该类下的属性列表
    NSMutableArray *properties = [AllClassProperties objectForKey:className];
    if (properties == nil) {
        properties = [NSMutableArray arrayWithCapacity:0];
    }
    // 列表存在则直接返回
    else {
        return [properties copy];
    }
    
    unsigned int outCount = 0;
    objc_property_t *propertyList = class_copyPropertyList(cls, &outCount);
    
    
    for (unsigned int i = 0; i < outCount; i++) {
        DTProperty *property = [DTProperty propertyWithObjcProperty:propertyList[i]];
        [properties addObject:property];
    }
    
    // 释放内存
    free(propertyList);
    
    [AllClassProperties setObject:properties forKey:className];
    
    return [properties copy];
}

+ (NSSet *)ignoredPropertyNames {
    // 初始化AllClassIgnoredPropertyNames
    if (AllClassIgnoredPropertyNames == nil) {
        AllClassIgnoredPropertyNames = [NSMutableDictionary dictionaryWithCapacity:0];
    }
    // 返回该类下需要忽略的属性名称集合
    return [AllClassIgnoredPropertyNames objectForKey:NSStringFromClass(self)];
}

+ (void)setIgnoredPropertyNames:(NSSet *)names {
    if (AllClassIgnoredPropertyNames == nil) {
        AllClassIgnoredPropertyNames = [NSMutableDictionary dictionaryWithCapacity:0];
    }
    
    [AllClassIgnoredPropertyNames setObject:names forKey:NSStringFromClass(self)];
}

+ (NSDictionary *)replacedPropertyNames {
    // 初始化AllClassReplacedPropertyNames
    if (AllClassReplacedPropertyNames == nil) {
        AllClassReplacedPropertyNames = [NSMutableDictionary dictionaryWithCapacity:0];
    }
    
    // 返回该类下需要替换的属性名称集合
    return [AllClassReplacedPropertyNames objectForKey:NSStringFromClass(self)];
}

+ (void)setReplacedPropertyNames:(NSDictionary *)names {
    if (AllClassReplacedPropertyNames == nil) {
        AllClassReplacedPropertyNames = [NSMutableDictionary dictionaryWithCapacity:0];
    }
    
    [AllClassReplacedPropertyNames setObject:names forKey:NSStringFromClass(self)];
}

@end
