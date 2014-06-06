//
//  WTDModelController.m
//  WasToday
//
//  Created by Zeke Shearer on 6/6/14.
//  Copyright (c) 2014 EZS. All rights reserved.
//

#import "WTDModelController.h"


@interface WTDModelController ()

@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end

@implementation WTDModelController

@synthesize readMOC = _readMOC;
@synthesize writeMOC = _writeMOC;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

static WTDModelController *_instance = nil;

+ (WTDModelController *)instance
{
    static dispatch_once_t onceToken;
    static WTDModelController *_instance = nil;
    dispatch_once(&onceToken, ^{
        _instance= [[WTDModelController alloc] init];
    });
    return _instance;
}

- (id)init
{
    self = [super init];
    if ( self ) {
        [self writeMOC];
        [self readMOC];
    }
    return self;
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.writeMOC;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)readMOC
{
    if (_readMOC != nil) {
        return _readMOC;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _readMOC = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [_readMOC setPersistentStoreCoordinator:coordinator];
    }
    return _readMOC;
}

- (NSManagedObjectContext *)writeMOC
{
    if (_writeMOC != nil) {
        return _writeMOC;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _writeMOC = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
        [_writeMOC setPersistentStoreCoordinator:coordinator];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_contextDidSave:) name:NSManagedObjectContextDidSaveNotification object:_writeMOC];
    }
    return _writeMOC;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"WasToday" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"WasToday.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil];
        if ( ![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error] ) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
    
    return _persistentStoreCoordinator;
}

- (void)_contextDidSave:(NSNotification *)notification
{
    NSManagedObjectContext *context = [notification object];
    if ( [notification object] == _readMOC || ([context persistentStoreCoordinator] != [self persistentStoreCoordinator]) ) {
        return;
    }
    if ( ![NSThread isMainThread] ) {
        [self performSelectorOnMainThread:@selector(_contextDidSave:) withObject:notification waitUntilDone:NO];
        return;
    }
    @try {
        NSManagedObjectContext *context = [self readMOC];
        [context mergeChangesFromContextDidSaveNotification:notification];
    }
    @catch (NSException *exception) {
        NSLog(@"Exception Merging Context: %@", exception);
    }
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end