//
//  PKCommunicator.m
//  PKNetwork
//
//  Created by Panagiotis  Kompotis  on 26/12/2018.
//  Copyright © 2018 Panagiotis  Kompotis. All rights reserved.
//

#import "PKCommunicator.h"

@implementation PKCommunicator

+ (instancetype)sharedInstance
{
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (NSURLSessionDataTask *)fetchDataWithRequest:(PKRequest *)request
                                     onSuccess:(void (^)(PKResponse * _Nullable))sBlock
                                     onFailure:(void (^)(PKResponse * _Nullable))fBlock
{
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request
                                                                     completionHandler:^(NSData * _Nullable data,
                                                                                         NSURLResponse * _Nullable response,
                                                                                         NSError * _Nullable error) {
         
                 if (!data || !response) {
                     PKResponse *failResponse = [[PKResponse alloc] init];
                     NSDictionary *emptyDataOrResponseDictionary = @{@"message": @"Data or response is empty"};
                     failResponse.responseObject = emptyDataOrResponseDictionary;
                     dispatch_async(dispatch_get_main_queue(), ^{
                         fBlock(failResponse);
                     });
                 } else {
                     //Setup
                     NSError *jsonParsingError = nil;
                     NSDictionary *json =
                     [NSJSONSerialization JSONObjectWithData:data
                                                     options:kNilOptions
                                                       error:&jsonParsingError];
                     
                     NSHTTPURLResponse *callResponse = (NSHTTPURLResponse *)response;
                     NSDictionary *responseHeaders = callResponse.allHeaderFields;
                     NSNumber *statusCode = [NSNumber numberWithInteger:callResponse.statusCode];
                     
                     PKResponse *networkResponse = [[PKResponse alloc] init];
                     PKResponseStatus responseStatus = [networkResponse responseStatusFromCode:statusCode];
                     
                     //Sucess
                     //NO error error == nil
                     if (!error) {
                         if (responseHeaders && json) {
                             PKResponse *successResponse = [[PKResponse alloc] initWithResponseHeaders:responseHeaders
                                                                                     andResponseObject:json
                                                                                     andResponseStatus:responseStatus];
                             dispatch_async(dispatch_get_main_queue(), ^{
                                 sBlock(successResponse);
                             });
                         } else {
                             //Fail block
                             PKResponse *failResponse = [[PKResponse alloc] init];
                             PKResponseStatus failResponseStatus = responseStatus;
                             failResponse.responseStatus = failResponseStatus;
                             dispatch_async(dispatch_get_main_queue(), ^{
                                 fBlock(failResponse);
                             });
                         }
                     } else {
                         //Fail, error != nil
                         PKResponse *failResponse = [[PKResponse alloc] init];
                         PKResponseStatus failResponseStatus = responseStatus;
                         failResponse.responseStatus = failResponseStatus;
                         dispatch_async(dispatch_get_main_queue(), ^{
                             fBlock(failResponse);
                         });
                     }
                 }
         
        }];
    
    [dataTask resume];
    
    return dataTask;
}

@end
