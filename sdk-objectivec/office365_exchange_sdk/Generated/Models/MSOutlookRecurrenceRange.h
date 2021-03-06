/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 *
 * Warning: This code was generated automatically. Edits will be overwritten.
 * To make changes to this code, please make changes to the generation framework itself:
 * https://github.com/MSOpenTech/odata-codegen
 *******************************************************************************/

#import "MSOutlookRecurrenceRangeType.h"

#import <Foundation/Foundation.h>
#import "MSOutlookProtocols.h"


/**
* The header for type RecurrenceRange.
*/

@interface MSOutlookRecurrenceRange : NSObject


@property NSString *$$__ODataType;

@property MSOutlookRecurrenceRangeType Type;
-(void)setTypeString:(NSString*)value;
@property NSDate *StartDate;

@property NSDate *EndDate;

@property int NumberOfOccurrences;


@end