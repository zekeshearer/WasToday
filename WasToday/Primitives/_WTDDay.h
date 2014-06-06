// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to WTDDay.h instead.

#import <CoreData/CoreData.h>

@class WTDEvent;

@interface WTDDayID : NSManagedObjectID {}
@end

@interface _WTDDay : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (WTDDayID*)objectID;

@property (nonatomic, strong) NSString* name;

@property (nonatomic, strong) NSOrderedSet* events;
- (NSMutableOrderedSet*)eventsSet;



@end

@interface _WTDDay (CoreDataGeneratedAccessors)

- (void)addEvents:(NSOrderedSet*)value_;
- (void)removeEvents:(NSOrderedSet*)value_;
- (void)addEventsObject:(WTDEvent*)value_;
- (void)removeEventsObject:(WTDEvent*)value_;
@end

@interface _WTDDay (CoreDataGeneratedPrimitiveAccessors)
- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableOrderedSet*)primitiveEvents;
- (void)setPrimitiveEvents:(NSMutableOrderedSet*)value;

@end
