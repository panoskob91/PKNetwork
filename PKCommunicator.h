//
//  PKCommunicator.h
//  PKNetwork
//
//  Created by Panagiotis  Kompotis  on 26/12/2018.
//  Copyright © 2018 Panagiotis  Kompotis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PKNetwork/PKRequest.h>
#import <PKNetwork/PKResponse.h>

NS_ASSUME_NONNULL_BEGIN

@interface PKCommunicator : NSObject

+ (instancetype)sharedInstance;

#pragma mark- Calls
- (NSURLSessionDataTask *)fetchDataWithRequest:(PKRequest *)request
                                     onSuccess:(void (^)(PKResponse * _Nullable))sBlock
                                     onFailure:(void (^)(PKResponse * _Nullable))fBlock;


@end

NS_ASSUME_NONNULL_END
