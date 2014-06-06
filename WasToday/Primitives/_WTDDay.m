// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to WTDDay.m instead.

#import "_WTDDay.h"

@implementation WTDDayID
@end

@implementation _WTDDay

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Day" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Day";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Day" inManagedObjectContext:moc_];
}

- (WTDDayID*)objectID {
	return (WTDDayID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic name;






@dynamic events;

	
- (NSMutableOrderedSet*)eventsSet {
	[self willAccessValueForKey:@"events"];
  
	NSMutableOrderedSet *result = (NSMutableOrderedSet*)[self mutableOrderedSetValueForKey:@"events"];
  
	[self didAccessValueForKey:@"events"];
	return result;
}
	






@end
