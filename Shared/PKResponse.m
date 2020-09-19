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
-(instancetype)initWithResponseHeaders:(NSDictionary *)responseHeaders
                     andResponseObject:(id _Nullable)responseObject
                     andResponseStatus:(PKResponseStatus)responseStatus
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
- (NSNumber *)statusCodeFrom:(PKResponseStatus)status
{
    NSNumber *statusCodeNumber = [[NSNumber alloc] initWithUnsignedInteger:status];
    return statusCodeNumber;
}

- (PKResponseStatus)responseStatusFromCode:(NSNumber *)statusCode
{
    NSInteger integerStatusCode = statusCode.integerValue;
    
    PKResponseStatus defaultStatus = Continue;
    PKResponseStatus responseStatus = defaultStatus;
    
    switch (integerStatusCode) {
        //1xx Informational
        case 100:
            responseStatus = Continue;
            break;
        case 101:
            responseStatus = SwitchingProtocols;
            break;
        case 102:
            responseStatus = Processing;
            break;
        case 103:
            responseStatus = EarlyHints;
            break;
        //2xx Success
        case 200:
            responseStatus = OK;
            break;
        case 201:
            responseStatus = Created;
            break;
        case 202:
            responseStatus = Accepted;
            break;
        case 203:
            responseStatus = NonAuthoritativeInformation;
            break;
        case 204:
            responseStatus = NoContent;
            break;
        case 205:
            responseStatus = ResetContent;
            break;
        case 206:
            responseStatus = PartialContent;
            break;
        case 207:
            responseStatus = MultiStatus;
            break;
        case 208:
            responseStatus = AlreadyReported;
            break;
        case 226:
            responseStatus = IMUsed;
            break;
        //3xx Redirection
        case 300:
            responseStatus = MultipleChoices;
            break;
        case 301:
            responseStatus = MovedPermanently;
            break;
        case 302:
            responseStatus = Found;
            break;
        case 303:
            responseStatus = SeeOther;
            break;
        case 304:
            responseStatus = NotModified;
            break;
        case 305:
            responseStatus = UseProxy;
            break;
        case 306:
            responseStatus = SwitchProxy;
            break;
        case 307:
            responseStatus = TemporaryRedirect;
            break;
        //4xx Client errors
        case 400:
            responseStatus = BadRequest;
            break;
        case 401:
            responseStatus = Unauthorized;
            break;
        case 402:
            responseStatus = PaymentRequired;
            break;
        case 403:
            responseStatus = Forbidden;
            break;
        case 404:
            responseStatus = NotFound;
            break;
        case 405:
            responseStatus = MethodNotAllowed;
            break;
        case 406:
            responseStatus = NotAcceptable;
            break;
        case 407:
            responseStatus = ProxyAuthenticationRequired;
            break;
        case 408:
            responseStatus = RequestTimeout;
            break;
        case 409:
            responseStatus = Conflict;
            break;
        case 410:
            responseStatus = Gone;
            break;
        case 411:
            responseStatus = LengthRequired;
            break;
        case 412:
            responseStatus = PreconditionFailed;
            break;
        case 413:
            responseStatus = PayloadTooLarge;
            break;
        case 414:
            responseStatus = URITooLong;
            break;
        case 415:
            responseStatus = UnsupportedMediaType;
            break;
        case 416:
            responseStatus = RangeNotSatisfiable;
            break;
        case 417:
            responseStatus = ExpectationFailed;
            break;
        case 418:
            responseStatus = IAmATeapot;
            break;
        case 421:
            responseStatus = MisdirectedRequest;
            break;
        case 422:
            responseStatus = UnprocessableEntity;
            break;
        case 423:
            responseStatus = Locked;
            break;
        case 424:
            responseStatus = FailedDependency;
            break;
        case 426:
            responseStatus = UpgradeRequired;
            break;
        case 428:
            responseStatus = PreconditionRequired;
            break;
        case 429:
            responseStatus = TooManyRequests;
            break;
        case 431:
            responseStatus = RequestHeaderFieldsTooLarge;
            break;
        case 451:
            responseStatus = UnavailableForLegalReasons;
            break;
        //5xx Server errors
        case 500:
            responseStatus = InternalServerError;
            break;
        case 501:
            responseStatus = NotImplemented;
            break;
        case 502:
            responseStatus = BadGateway;
            break;
        case 503:
            responseStatus = ServiceUnavailable;
            break;
        case 504:
            responseStatus = GatewayTimeout;
            break;
        case 505:
            responseStatus = HTTPVersionNotSupported;
            break;
        case 506:
            responseStatus = VariantAlsoNegotiates;
            break;
        case 507:
            responseStatus = InsufficientStorage;
            break;
        case 508:
            responseStatus = LoopDetected;
            break;
        case 510:
            responseStatus = NotExtended;
            break;
        case 511:
            responseStatus = NetworkAuthenticationRequired;
            break;
        default:
            break;
    }
    return responseStatus;
}

- (NSNumber *)getStatusCode
{
    if (self.responseStatus) {
        return [self statusCodeFrom:self.responseStatus];
    }
    return 0;
}

- (NSDictionary *)getResponseObject
{
    if (self.responseObject) {
        return self.responseObject;
    }
    return @{};
}

- (NSDictionary *)getResponseHeaders
{
    if (self.responseHeaders) {
        return self.responseHeaders;
    }
    return @{};
}
#pragma mark- Overrodes
- (NSString *)description
{
    NSNumber *statusCode = [self getStatusCode];
    NSString *responseStatus = [NSString stringWithFormat:@"%@", statusCode];
    NSString *description = [NSString stringWithFormat:@"responseObject = %@, responseHeaders = %@, responseStatus = %@",
                                            [self getResponseObject],
                                            [self getResponseHeaders],
                                            responseStatus];
    return description;
}

@end
