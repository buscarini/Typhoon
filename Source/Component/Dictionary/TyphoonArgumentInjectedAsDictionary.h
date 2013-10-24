//
//  TyphoonArgumentInjectedAsDictionary.h
//  Pods
//
//  Created by José Manuel Sánchez on 24/10/13.
//
//

#import <Foundation/Foundation.h>

@class TyphoonDefinition;
@protocol TyphoonIntrospectiveNSObject;

typedef enum
{
	TyphoonDictionaryInvalidType,
    TyphoonDictionaryTypeNSDictionary,
	TyphoonDictionaryTypeNSMutableDictionary
} TyphoonDictionaryType;

/**
 * Base class for injected collection arguments.
 * Represents a collection (NSArray, NSSet, c-style array) of items injected by reference, value or type.
 */

@interface TyphoonArgumentInjectedAsDictionary : NSObject
{
	NSMutableDictionary *_valuesDic;
}

- (void)addItemWithKey:(id)key text:(NSString*)text requiredType:(Class)requiredType;

- (void)addItemWithKey:(id)key componentName:(NSString*)componentName;

- (void)addItemWithKey:(id)key definition:(TyphoonDefinition*)definition;

- (NSDictionary*)valuesDic;

@end
