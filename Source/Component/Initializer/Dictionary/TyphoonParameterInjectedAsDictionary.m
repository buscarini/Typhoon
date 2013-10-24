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

#import "TyphoonParameterInjectedAsDictionary.h"

@implementation TyphoonParameterInjectedAsDictionary {
    Class _requiredType;
}

-(id)initWithParameterIndex:(NSUInteger)index requiredType:(Class)requiredType
{
    self = [super init];
    if (self)
    {
        _index = index;
        _requiredType = requiredType;
    }
    return self;
}

- (TyphoonParameterInjectionType)type
{
	return TyphoonParameterInjectionTypeAsDictionary;
}

-(void)setInitializer:(TyphoonInitializer *)initializer
{
	// No-op.
}

-(TyphoonDictionaryType)dictionaryType {
    
    Class clazz = _requiredType;
    if (clazz == nil)
    {
        [NSException raise:NSInvalidArgumentException format:@"Required type is missing on injected dictionary parameter!"];
    }
    if ([clazz isSubclassOfClass:[NSMutableDictionary class]])
    {
        return TyphoonDictionaryTypeNSMutableDictionary;
    }
    else if ([clazz isSubclassOfClass:[NSDictionary class]])
    {
        return TyphoonDictionaryTypeNSDictionary;
    }
    
    [NSException raise:NSInvalidArgumentException format:@"Required collection type '%@' is not a NSDictionary.",
     NSStringFromClass(clazz)];

    return TyphoonDictionaryInvalidType;
}

@end
