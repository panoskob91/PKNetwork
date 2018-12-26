//
//  PKRequest.m
//  PKNetwork
//
//  Created by Panagiotis  Kompotis  on 25/12/2018.
//  Copyright © 2018 Panagiotis  Kompotis. All rights reserved.
//

#import "PKRequest.h"

@interface PKRequest()

//@property (strong, nonatomic) NSDictionary<method, NSString *> *availableHttpMethods;

@end

@implementation PKRequest

- (instancetype)initWithRequestHeaders: (NSDictionary *)requestHeaders
                        andRequestBody:(NSDictionary *)requestBody
                         andRequestURL:(NSURL *)requestURL
                      andRequestMethod:(PKRequestMethod *)requestMethod
{
    self = [super initWithURL:requestURL];
    if (self) {
        self.requestHeaders = requestHeaders;
        self.requestBody = requestBody;
        self.requestMethod = requestMethod;
    }
    return self;
}

-(NSString *)httpMethodFromRequestMethod:(PKRequestMethod *)method
{
    NSString *stringMethod;
    switch (*method) {
        case GET:
            stringMethod = @"GET";
            break;
        case POST:
            stringMethod = @"POST";
            break;
        case PUT:
            stringMethod = @"PUT";
            break;
        case DELETE:
            stringMethod = @"DELETE";
            break;
    }
    return stringMethod;
}

-(NSArray<NSString *> *)supportedrequestMethods
{
    return @[@"GET", @"POST", @"PUT", @"DELETE"];
}

@end
