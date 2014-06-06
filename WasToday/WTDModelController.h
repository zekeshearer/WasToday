//
//  WTDModelController.h
//  WasToday
//
//  Created by Zeke Shearer on 6/6/14.
//  Copyright (c) 2014 EZS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTDModelController : NSObject

+ (WTDModelController *)instance;

@property (readonly, strong, nonatomic) NSManagedObjectContext *readMOC;
@property (readonly, strong, nonatomic) NSManagedObjectContext *writeMOC;

@end
