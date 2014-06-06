//
//  WTDDataController.m
//  WasToday
//
//  Created by Zeke Shearer on 6/6/14.
//  Copyright (c) 2014 EZS. All rights reserved.
//

#import "WTDDataController.h"
#import "WTDModelController.h"
#import "AFNetworking.h"

@interface WTDDataController ()

@property (nonatomic, strong) NSOperationQueue *operationQueue;

@end

@implementation WTDDataController

static WTDDataController *_instance = nil;

- (id)init
{
    self = [super init];
    if ( self ) {
        self.operationQueue = [[NSOperationQueue alloc] init];
    }
    return self;
}

+ (WTDDataController *)instance
{
    static dispatch_once_t onceToken;
    static WTDDataController *_instance = nil;
    dispatch_once(&onceToken, ^{
        _instance= [[WTDDataController alloc] init];
    });
    return _instance;
}

- (void)fetchEventsForDate:(NSDate *)date withCompletion:(void(^)(BOOL success))completion;
{
    NSString *dayString;
    NSURLRequest *request;
    AFHTTPRequestOperation *operation;
    
    dayString = [self dayStringForDate:date];
    request = [NSURLRequest requestWithURL:[self urlForDayString:dayString]];
    operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSManagedObjectContext *moc;
        
        moc = [[WTDModelController instance] writeMOC];
        
        
        
        
        completion(YES);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        completion(NO);
    }];
}

- (NSString *)dayStringForDate:(NSDate *)date
{
    return @"June_6";
}

- (NSURL *)urlForDayString:(NSString *)dayString
{
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://en.wikipedia.org/w/api.php?format=json&action=query&titles=%@&prop=revisions&rvprop=content",dayString]];
}

@end
