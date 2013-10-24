////////////////////////////////////////////////////////////////////////////////
//
//  TYPHOON FRAMEWORK
//  Copyright 2013, Jasper Blues & Contributors
//  All Rights Reserved.
//
//  NOTICE: The authors permit you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

#import "TyphoonArgumentInjectedAsDictionary.h"
#import "TyphoonTypeDescriptor.h"
#import "TyphoonIntrospectionUtils.h"
#import "TyphoonDefinition.h"
#import "TyphoonTypeConvertedCollectionValue.h"
#import "TyphoonByReferenceCollectionValue.h"

@implementation TyphoonArgumentInjectedAsDictionary

/* ====================================================================================================================================== */
#pragma mark - Initialization & Destruction

- (id)init
{
    self = [super init];
    if (self)
    {
        _valuesDic = [[NSMutableDictionary alloc] init];
    }
    return self;
}


/* ====================================================================================================================================== */
#pragma mark - Interface Methods

- (void)addItemWithKey:(id)key text:(NSString*)text requiredType:(Class)requiredType
{
	[_valuesDic setObject:[[TyphoonTypeConvertedCollectionValue alloc] initWithTextValue:text requiredType:requiredType] forKey:key];
}

- (void)addItemWithKey:(id)key componentName:(NSString*)componentName
{
	[_valuesDic setObject:[[TyphoonByReferenceCollectionValue alloc] initWithComponentName:componentName] forKey:key];
}

- (void)addItemWithKey:(id)key definition:(TyphoonDefinition*)definition
{
	[_valuesDic setObject:[[TyphoonByReferenceCollectionValue alloc] initWithComponentName:definition.key] forKey:key];
}

- (NSDictionary*)valuesDic
{
	return [_valuesDic copy];
}


/* ====================================================================================================================================== */
#pragma mark - Utility Methods

- (NSString*)description
{
    NSMutableString* description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@", _valuesDic=%@", _valuesDic];
    [description appendString:@">"];
    return description;
}

@end
