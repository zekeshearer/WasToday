// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to WTDEvent.h instead.

#import <CoreData/CoreData.h>

@class WTDDay;
@class WTDEvent;
@class WTDEvent;

@interface WTDEventID : NSManagedObjectID {}
@end

@interface _WTDEvent : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (WTDEventID*)objectID;

@property (nonatomic, strong) NSString* eventDescription;

@property (nonatomic, strong) WTDDay* day;
@property (nonatomic, strong) WTDEvent* parentEvent;
@property (nonatomic, strong) NSOrderedSet* subEvents;
- (NSMutableOrderedSet*)subEventsSet;



@end

@interface _WTDEvent (CoreDataGeneratedAccessors)

- (void)addSubEvents:(NSOrderedSet*)value_;
- (void)removeSubEvents:(NSOrderedSet*)value_;
- (void)addSubEventsObject:(WTDEvent*)value_;
- (void)removeSubEventsObject:(WTDEvent*)value_;
@end

@interface _WTDEvent (CoreDataGeneratedPrimitiveAccessors)
- (NSString*)primitiveEventDescription;
- (void)setPrimitiveEventDescription:(NSString*)value;

- (WTDDay*)primitiveDay;
- (void)setPrimitiveDay:(WTDDay*)value;


- (WTDEvent*)primitiveParentEvent;
- (void)setPrimitiveParentEvent:(WTDEvent*)value;


- (NSMutableOrderedSet*)primitiveSubEvents;
- (void)setPrimitiveSubEvents:(NSMutableOrderedSet*)value;

@end
