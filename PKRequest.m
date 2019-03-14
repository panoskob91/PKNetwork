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
                        andRequestBody:(NSDictionary * _Nullable )requestBody
                         andRequestURL:(NSURL *)requestURL
                      andRequestMethod:(PKRequestMethod *)requestMethod
{
    self = [super initWithURL:requestURL];
    if (self) {
        self.requestHeaders = requestHeaders;
        self.requestBody = requestBody;
        self.requestMethod = requestMethod;
        
        self.allHTTPHeaderFields = self.requestHeaders;
        self.HTTPMethod = [self httpMethodFromRequestMethod:self.requestMethod];
        NSError *error = nil;
        if (self.requestBody) {
            self.HTTPBody =  [NSJSONSerialization dataWithJSONObject:self.requestBody
                                                             options:NSJSONWritingPrettyPrinted
                                                               error:&error];
        }
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

- (NSString *)description
{
    NSString *httpMethod = [self httpMethodFromRequestMethod:self.requestMethod];
    NSString *description = [NSString
                                stringWithFormat:@"request Headers = %@, requestBody = %@, requestMethod = %@",
                                                self.requestHeaders,
                                                self.requestBody,
                                                httpMethod];
    return description;
}

@end
