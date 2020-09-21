//
//  MHTools.h
//  Unity-iPhone
//
//  Created by Patrick Antoine on 8/22/13.
//
//
#define Rect_Object_Type @"Rect"
#define Image_Object_Type @"Image"
#define Color_Object_Type @"Color"
#define Vector2_Object_Type @"Vector2"
#define Vector4_Object_Type @"Vector4"
#define Date_Object_Type @"Date"
#define TimeZone_Object_Type @"TimeZone"
#define Action_Object_Type @"Action"
#define Touch_Object_Type @"Touch"
#define Event_Object_Type @"Event"

// Converts NSString to C style string by way of copy (Mono will free it)
#define MakeStringCopy( _x_ ) ( _x_ != NULL && [_x_ isKindOfClass:[NSString class]] ) ? strdup( [_x_ UTF8String] ) : NULL

// Converts C style string to NSString
#define GetStringParam( _x_ ) ( _x_ != NULL ) ? [NSString stringWithUTF8String:_x_] : [NSString stringWithUTF8String:""]

// Converts C style string to NSString as long as it isnt empty
#define GetStringParamOrNil( _x_ ) ( _x_ != NULL && strlen( _x_ )) ? [NSString stringWithUTF8String:_x_] : nil

#import "JSONKit.h"
#import "iOSViewManager.h"

@interface MHTools : NSObject

+ (CGRect) convertRectToCGRect:(const char *)rect;
+ (const char *) convertCGRectToRect:(CGRect)cgrect;

+ (UIImage *) convertImageToUIImage:(const char *)image;
+ (const char *) convertUIImageToImage:(UIImage *)image;

+ (CGPoint) convertVector2ToCGPoint:(const char *)vector;
+ (const char *) convertCGPointToVector2:(CGPoint)cgpoint;

+ (CGSize) convertVector2ToCGSize:(const char *)vector;
+ (const char *) convertCGSizeToVector2:(CGSize)cgsize;

+ (UIOffset) convertVector2ToUIOffset:(const char *)vector;
+ (const char *) convertUIOffsetToVector2:(UIOffset)offset;

+ (UIEdgeInsets) convertVector4ToUIEdgeInset:(const char *)vector;
+ (const char *) convertUIEdgeInsetToVector4:(UIEdgeInsets)edgeinset;

+ (UIColor *) convertColorToUIColor:(const char *)color;
+ (const char *) convertUIColorToColor:(UIColor *)uicolor;

+ (NSDate *) convertDateTimeToNSDate:(const char *)datetime;
+ (const char *) convertNSDateToDateTime:(NSDate *)date;

+ (NSTimeZone *) convertTimeZoneInfoToNSTimeZone:(const char *)timezoneinfo;
+ (const char *) convertNSTimeZoneToTimeZoneInfo:(NSTimeZone *)timezone;

+ (const char *) convertIDtoAction:(id)actionID,...;

+ (NSString *) convertUITouchToNSString:(UITouch *)touch;
+ (const char *) convertUITouchToJson:(UITouch *)touch;
+ (NSString *) convertUITouchesToNSString:(NSSet *)touches;
+ (const char *) convertUITouchesToJson:(NSSet *)touches;
+ (NSString *) convertUIEventToNSString:(UIEvent *)evt;
+ (const char *) convertUIEventToJson:(UIEvent *)evt;

+ (const char *) convertNSArrayToArray_string:(NSArray *)array;
+ (NSArray *) convertArrayToNSArray_string:(const char *)array;

+ (const char *) convertNSArrayToArray_int:(NSArray *)array;
+ (NSArray *) convertArrayToNSArray_int:(int *)array num:(int)arrayCount;

+ (NSIndexSet *) convertArrayToNSIndexSet:(int *)array num:(int)arrayCount;

+ (const char *) convertNSArrayToMultipleTags:(NSArray *)array;
+ (NSArray *) convertMultipleTagsToNSArray:(int *)tags num:(int)arrayCount;

+ (NSString *) convertIndexPathToNSString:(NSIndexPath *)indexPath;
+ (const char *) convertIndexPathToJson:(NSIndexPath *)indexPath;
+ (NSString *) convertIndexPathsToNSString:(NSArray *)indexPaths;
+ (const char *) convertIndexPathsToJson:(NSArray *)indexPaths;
+ (NSArray *) convertJsonToIndexPaths:(const char *)indexPaths;
+ (NSIndexPath *) convertJsonToIndexPath:(int *)array num:(int)arrayCount;
+ (NSIndexPath *) convertJsonToIndexPath_stringarray:(NSArray *)array;

+ (bool) touchesBeganIsValid:(int)tag;
+ (bool) touchesMovedIsValid:(int)tag;
+ (bool) touchesEndedIsValid:(int)tag;
+ (bool) touchesCancelledIsValid:(int)tag;

+ (BOOL) objectExists:(int)tag;
+ (BOOL) objectExistsByObject:(id)obj;
+ (BOOL) actualObjectExists:(int)tag;
+ (BOOL) actualObjectExistsByObject:(id)obj;
+ (void) addreplaceObject:(id)obj key:(int)tag actualUI:(id)actualObj;
+ (void) removeObject:(int)tag;
+ (id) getObject:(int)tag;
+ (id) getActualObject:(int)tag;
+ (int) getKey:(id)obj;
+ (int) getKey:(id)obj showWarning:(bool)warning;
+ (int) getKeyFromActual:(id)obj;
+ (int) getKeyFromActual:(id)obj showWarning:(bool)warning;

+ (id) getView:(int)tag;
+ (id) getActualView:(int)tag;

+ (id) getViewController:(int)tag;
+ (id) getActualViewController:(int)tag;


@end
