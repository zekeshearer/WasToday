//
//  WTDDataController.h
//  WasToday
//
//  Created by Zeke Shearer on 6/6/14.
//  Copyright (c) 2014 EZS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTDDataController : NSObject

+ (WTDDataController *)instance;

- (void)fetchEventsForDate:(NSDate *)date withCompletion:(void(^)(BOOL success))completion;

@end
