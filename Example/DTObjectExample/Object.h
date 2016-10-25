//
//  Object.h
//  DTObjectExample
//
//  Created by huxiu on 2016/10/25.
//  Copyright © 2016年 ganyuchuan. All rights reserved.
//

#import <DTObject/DTObject.h>

@interface Object : DTObject

@end

@interface StartImage : Object

@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) NSURL *img;

@end

@interface AppVersion : Object

@property (nonatomic, strong) NSNumber *status;
@property (nonatomic, strong) NSNumber *latest;
@property (nonatomic, copy) NSString *msg;

@end

@interface NewsLatest : Object

@property (nonatomic, strong) NSNumber *date;
@property (nonatomic, copy) NSArray *stories;
@property (nonatomic, copy) NSArray *top_stories;

@end

@interface News : Object

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSURL *image;
@property (nonatomic, copy) NSArray *images;
@property (nonatomic, strong) NSNumber *type;
@property (nonatomic, strong) NSNumber *ga_prefix;
@property (nonatomic, strong) NSNumber *multipic;
@property (nonatomic, copy) NSString *body;
@property (nonatomic, copy) NSString *image_source;
@property (nonatomic, copy) NSURL *share_url;
@property (nonatomic, copy) NSArray *js;
@property (nonatomic, copy) NSArray *recommenders;
@property (nonatomic, strong) NSDictionary *section;
@property (nonatomic, copy) NSArray *css;

@end
