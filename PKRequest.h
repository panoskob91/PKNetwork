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

@interface PKRequest : NSURLRequest

#pragma mark properties

@property (strong, nonatomic) NSDictionary *requestHeaders;
@property (strong, nonatomic) NSDictionary *requestBody;
@property (nonatomic) PKRequestMethod *requestMethod;

#pragma mark Initializers
- (instancetype)initWithRequestHeaders: (NSDictionary *)requestHeaders
                        andRequestBody:(NSDictionary *)requestBody
                      andRequestMethod:(PKRequestMethod *)requestMethod;


#pragma mark Helper methods
-(NSString *)httpMethodFromRequestMethod:(PKRequestMethod *)method;
-(NSArray<NSString *> *)supportedrequestMethods;
@end
