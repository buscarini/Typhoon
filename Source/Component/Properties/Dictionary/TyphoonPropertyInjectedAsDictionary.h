//
//  TyphoonPropertyInjectedAsDictionary.h
//  Pods
//
//  Created by José Manuel Sánchez on 24/10/13.
//
//

#import "TyphoonInjectedProperty.h"
#import "TyphoonArgumentInjectedAsDictionary.h"

@class TyphoonDefinition;

/**
 * Represents a dictionary (NSDictionary) of keys and items injected by reference, value or type.
 */

@interface TyphoonPropertyInjectedAsDictionary : TyphoonArgumentInjectedAsDictionary <TyphoonInjectedProperty>
{
    NSString* _name;
}

@property(nonatomic, strong, readonly) NSString* name;

- (id)initWithName:(NSString*)name;

/**
 * Returns the collection type for the named property on the parameter class. Raises an exception if the property is neither an NSDictionary
 */
- (TyphoonDictionaryType)resolveCollectionTypeWith:(id<TyphoonIntrospectiveNSObject>)instance;

@end
