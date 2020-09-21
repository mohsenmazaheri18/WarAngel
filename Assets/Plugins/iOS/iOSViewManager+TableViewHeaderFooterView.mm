//
//  iOSViewManager+TableViewHeaderFooterView.m
//  Unity-iPhone
//
//  Created by Patrick Antoine on 5/10/14.
//
//

#import "iOSViewManager+TableViewHeaderFooterView.h"
#define CANNOT_FIND_ERROR @"ERROR: Cannot find UITableViewHeaderFooterView"

@implementation iOSViewManager (TableViewHeaderFooterView)

@end

extern "C"
{
    int _init_tableviewheaderfooterview(int tag)
	{
		if(![MHTools objectExists:tag])
        {
            ALBTableViewHeaderFooterView *tHeadFoot = [[[ALBTableViewHeaderFooterView alloc] init] autorelease];
            
            [MHTools addreplaceObject:tHeadFoot key:tag actualUI:tHeadFoot];
        }
        else
        {
            NSLog(@"ERROR: This tag is already taken, cannot initiate this object (TABLEVIEWHEADERFOOTERVIEW)");
        }
        return tag;
	}
	
	int _initWithFrame_tableviewheaderfooterview(int tag, const char * aRect)
	{
		if(![MHTools objectExists:tag])
        {
            CGRect frame = [MHTools convertRectToCGRect:aRect];
            ALBTableViewHeaderFooterView *tHeadFoot = [[[ALBTableViewHeaderFooterView alloc] initWithFrame:frame] autorelease];
            
            [MHTools addreplaceObject:tHeadFoot key:tag actualUI:tHeadFoot];
        }
        else
        {
            NSLog(@"ERROR: This tag is already taken, cannot initiate this object (TABLEVIEWHEADERFOOTERVIEW)");
        }
        return tag;
	}
	int _initWithReuseIdentifier_tableviewheaderfooterview(int tag, const char * reuseIdentifier)
	{
		if(![MHTools objectExists:tag])
        {
            ALBTableViewHeaderFooterView *tHeadFoot = [[[ALBTableViewHeaderFooterView alloc] initWithReuseIdentifier:GetStringParamOrNil(reuseIdentifier)] autorelease];
            
            [MHTools addreplaceObject:tHeadFoot key:tag actualUI:tHeadFoot];
        }
        else
        {
            NSLog(@"ERROR: This tag is already taken, cannot initiate this object (TABLEVIEWHEADERFOOTERVIEW)");
        }
        return tag;
	}
}
