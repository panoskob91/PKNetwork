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

@property (strong, nonatomic, nullable) NSDictionary *requestHeaders;
@property (strong, nonatomic, nullable) NSDictionary *requestBody;
@property (nonatomic, assign) enum PKRequestMethod *requestMethod;

#pragma mark- Initializers
- (nonnull instancetype)initWithRequestHeaders:(NSDictionary * _Nullable)requestHeaders
                                andRequestBody:(NSDictionary * _Nullable)requestBody
                                 andRequestURL:(NSURL * _Nonnull)requestURL
                              andRequestMethod:(PKRequestMethod * _Nonnull)requestMethod;

#ifdef DEBUG
- (NSString * _Nullable)description;
#endif

#pragma mark- Helper methods
-(NSString * _Nonnull)httpMethodFromRequestMethod:(PKRequestMethod *)method;
-(NSArray<NSString *> * _Nonnull)supportedRequestMethods;
@end
