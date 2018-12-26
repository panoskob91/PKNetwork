//
//  PKResponse.m
//  PKNetwork
//
//  Created by Panagiotis  Kompotis  on 26/12/2018.
//  Copyright © 2018 Panagiotis  Kompotis. All rights reserved.
//

#import "PKResponse.h"

@implementation PKResponse

#pragma mark- Initializers
-(instancetype)initWithresponseHeaders:(NSDictionary *)responseHeaders
                     andResponseObject:(NSDictionary *)responseObject
                     andResponseStatus:(PKResponseStatus *)responseStatus
{
    self = [super init];
    if (self) {
        self.responseHeaders = responseHeaders;
        self.responseObject = responseObject;
        self.responseStatus = responseStatus;
    }
    return self;
}

#pragma mark- Helper methods
- (NSNumber *)statusCodeFrom:(PKResponseStatus *)status
{
    NSNumber *statusCodeNumber = [[NSNumber alloc] initWithUnsignedInt:*status];
    return statusCodeNumber;
}

@end
