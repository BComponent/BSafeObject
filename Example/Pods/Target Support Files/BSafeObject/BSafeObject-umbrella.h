#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "BSafeObject.h"
#import "NSArray+Safe.h"
#import "NSDictionary+Safe.h"
#import "NSMutableArray+Safe.h"
#import "NSMutableDictionary+Safe.h"
#import "NSMutableString+Safe.h"
#import "NSObject+Swizzling.h"

FOUNDATION_EXPORT double BSafeObjectVersionNumber;
FOUNDATION_EXPORT const unsigned char BSafeObjectVersionString[];

