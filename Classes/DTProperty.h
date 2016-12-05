//
//  DTProperty.h
//  DTObjectExample
//
//  Created by huxiu on 2016/10/19.
//  Copyright © 2016年 ganyuchuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

typedef NS_ENUM(NSUInteger, DTPropertyDataType) {
    DTPropertyDataTypeUnknown,
    DTPropertyDataTypeBase,
    DTPropertyDataTypePointer,
    DTPropertyDataTypeId,
};

@interface DTProperty : NSObject

@property (nonatomic, assign) Class cls;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *code;
@property (nonatomic, readonly) DTPropertyDataType dataType;
@property (nonatomic, readonly) Class dataTypeClass;
@property (nonatomic, readonly) BOOL isFoundationClass;

/*!
 *  快速构造DTProperty实例对象
 *
 *  @param property objc_property_t结构体
 *
 *  @return DTProperty对象
 */
+ (instancetype)propertyWithObjcProperty:(objc_property_t)property;
/*!
 *  初始化
 *
 *  @param property property objc_property_t结构体
 *
 *  @return DTProperty对象
 */
- (instancetype)initWithObjcProperty:(objc_property_t)property;

@end
