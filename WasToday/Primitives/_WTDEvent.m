// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to WTDEvent.m instead.

#import "_WTDEvent.h"

@implementation WTDEventID
@end

@implementation _WTDEvent

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Event";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Event" inManagedObjectContext:moc_];
}

- (WTDEventID*)objectID {
	return (WTDEventID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic eventDescription;






@dynamic day;

	

@dynamic parentEvent;

	

@dynamic subEvents;

	
- (NSMutableOrderedSet*)subEventsSet {
	[self willAccessValueForKey:@"subEvents"];
  
	NSMutableOrderedSet *result = (NSMutableOrderedSet*)[self mutableOrderedSetValueForKey:@"subEvents"];
  
	[self didAccessValueForKey:@"subEvents"];
	return result;
}
	






@end
