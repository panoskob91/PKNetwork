//
//  PKResponse.h
//  PKNetwork
//
//  Created by Panagiotis  Kompotis  on 26/12/2018.
//  Copyright © 2018 Panagiotis  Kompotis. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, PKResponseStatus) {
    //1xx Informational response
    Continue = 100,
    SwitchingProtocols = 101,
    Processing = 102,
    EarlyHints = 103,
    //2xx Success
    OK = 200,
    Created = 201,
    Accepted = 202,
    NonAuthoritativeInformation = 203,
    NoContent = 204,
    ResetContent = 205,
    PartialContent = 206,
    MultiStatus = 207,
    AlreadyReported = 208,
    IMUsed = 226,
    //3xx Redirection
    MultipleChoices = 300,
    MovedPermanently = 301,
    Found = 302,
    SeeOther = 303,
    NotModified = 304,
    UseProxy = 305,
    SwitchProxy = 306,
    TemporaryRedirect = 307,
    //4xx Client errors
    BadRequest = 400,
    Unauthorized = 401,
    PaymentRequired = 402,
    Forbidden = 403,
    NotFound = 404,
    MethodNotAllowed = 405,
    NotAcceptable = 406,
    ProxyAuthenticationRequired = 407,
    RequestTimeout = 408,
    Conflict = 409,
    Gone = 410,
    LengthRequired = 411,
    PreconditionFailed = 412,
    PayloadTooLarge = 413,
    URITooLong = 414,
    UnsupportedMediaType = 415,
    RangeNotSatisfiable = 416,
    ExpectationFailed = 417,
    IAmATeapot = 418,
    MisdirectedRequest = 421,
    UnprocessableEntity = 422,
    Locked = 423,
    FailedDependency = 424,
    UpgradeRequired = 426,
    PreconditionRequired = 428,
    TooManyRequests = 429,
    RequestHeaderFieldsTooLarge = 431,
    UnavailableForLegalReasons = 451,
    //5xx Server errors
    InternalServerError = 500,
    NotImplemented = 501,
    BadGateway = 502,
    ServiceUnavailable = 503,
    GatewayTimeout = 504,
    HTTPVersionNotSupported = 505,
    VariantAlsoNegotiates = 506,
    InsufficientStorage = 507,
    LoopDetected = 508,
    NotExtended = 510,
    NetworkAuthenticationRequired = 511
};

NS_ASSUME_NONNULL_BEGIN

@interface PKResponse : NSURLResponse

@property (strong, nonatomic)  NSDictionary * _Nullable responseObject;
@property (strong, nonatomic) NSDictionary * _Nullable responseHeaders;
@property (nonatomic) PKResponseStatus * _Nullable responseStatus;

#pragma mark- Initializers
- (instancetype)initWithResponseHeaders:(NSDictionary *)responseHeaders
                      andResponseObject:(NSDictionary *)responseObject
                      andResponseStatus:(PKResponseStatus *)responseStatus;

#ifdef DEBUG
- (NSString *)description;
#endif

#pragma mark- Helper methods
- (NSNumber *)statusCodeFrom:(PKResponseStatus *)status;
- (PKResponseStatus *)responseStatusFromCode:(NSNumber *)statusCode;

@end

NS_ASSUME_NONNULL_END
