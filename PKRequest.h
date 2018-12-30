//
//  PKRequest.h
//  PKNetwork
//
//  Created by Panagiotis  Kompotis  on 25/12/2018.
//  Copyright © 2018 Panagiotis  Kompotis. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, PKRequestMethod) {
    GET,
    POST,
    PUT,
    DELETE
};

@interface PKRequest : NSMutableURLRequest

#pragma mark- properties

@property (strong, nonatomic) NSDictionary *requestHeaders;
@property (strong, nonatomic) NSDictionary *requestBody;
@property (nonatomic, assign) enum PKRequestMethod *requestMethod;

#pragma mark- Initializers
- (instancetype)initWithRequestHeaders: (NSDictionary *)requestHeaders
                        andRequestBody:(NSDictionary *)requestBody
                         andRequestURL:(NSURL *)requestURL
                      andRequestMethod:(PKRequestMethod *)requestMethod;

#ifdef DEBUG
- (NSString *)description;
#endif

#pragma mark- Helper methods
-(NSString *)httpMethodFromRequestMethod:(PKRequestMethod *)method;
-(NSArray<NSString *> *)supportedrequestMethods;
@end
