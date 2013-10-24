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


#import "TyphoonPropertyInjectedAsDictionary.h"
#import "TyphoonTypeDescriptor.h"
#import "TyphoonIntrospectionUtils.h"
#import "TyphoonDefinition.h"
#import "TyphoonTypeConvertedCollectionValue.h"
#import "TyphoonByReferenceCollectionValue.h"


@implementation TyphoonPropertyInjectedAsDictionary


/* ====================================================================================================================================== */
#pragma mark - Initialization & Destruction

- (id)initWithName:(NSString*)name
{
    self = [super init];
    if (self)
    {
        _name = name;
    }
    return self;
}


/* ====================================================================================================================================== */
#pragma mark - Interface Methods

- (TyphoonDictionaryType)resolveCollectionTypeWith:(id<TyphoonIntrospectiveNSObject>)instance;
{
    TyphoonTypeDescriptor* descriptor = [TyphoonIntrospectionUtils typeForPropertyWithName:_name inClass:[instance class]];
    Class describedClass = (Class) [descriptor classOrProtocol];
    if (describedClass == nil)
    {
        [NSException raise:NSInvalidArgumentException format:@"Property named '%@' does not exist on class '%@'.", _name,
		 NSStringFromClass([instance class])];
    }
    if ([describedClass isSubclassOfClass:[NSMutableDictionary class]])
    {
        return TyphoonDictionaryTypeNSMutableDictionary;
    }
    else if ([describedClass isSubclassOfClass:[NSDictionary class]])
    {
        return TyphoonDictionaryTypeNSDictionary;
    }
	
    [NSException raise:NSInvalidArgumentException format:@"Property named '%@' on '%@' is not a NSDictionary.", _name,
	 NSStringFromClass(describedClass)];
	
    return TyphoonDictionaryInvalidType;
}

/* ====================================================================================================================================== */
#pragma mark - Protocol Methods
#pragma mark - <TyphoonInjectedProperty>

- (NSString*)name
{
    return _name;
}

- (TyphoonPropertyInjectionType)injectionType
{
    return TyphoonPropertyInjectionTypeAsCollection;
}

/* ====================================================================================================================================== */
#pragma mark - Utility Methods

- (NSString*)description
{
    NSMutableString* description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"self.name=%@", self.name];
    [description appendFormat:@", _valuesDic=%@", _valuesDic];
    [description appendString:@">"];
    return description;
}


@end