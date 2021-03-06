/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataDependencyResolver.h"

@protocol MSODataReadable

@optional
-(NSURLSessionDataTask *)read:(void (^)(id, MSODataException *))callback;
-(NSURLSessionDataTask *)readRaw:(void (^)(NSString* response, MSODataException *))callback;
@end