//
//  iOSViewManager+RefreshControl.m
//  Unity-iPhone
//
//  Created by Patrick Antoine on 4/26/14.
//
//

#import "iOSViewManager+RefreshControl.h"
#define CANNOT_FIND_ERROR @"ERROR: Cannot find UIRefreshControl"

@implementation iOSViewManager (RefreshControl)

@end

extern "C"
{
    int _init_refreshcontrol(int tag)
	{
		if(![MHTools objectExists:tag])
        {
            ALBRefreshControl *refreshControl = [[[ALBRefreshControl alloc] init] autorelease];
            
            [MHTools addreplaceObject:refreshControl key:tag actualUI:refreshControl];
        }
        else
        {
            NSLog(@"ERROR: This tag is already taken, cannot initiate this object (REFRESHCONTROL)");
        }
        
        return tag;
	}
	
	int _initWithFrame_refreshcontrol(int tag, const char * aRect)
	{
		if(![MHTools objectExists:tag])
        {
            CGRect cgRect = [MHTools convertRectToCGRect:aRect];
            
            ALBRefreshControl *refreshControl = [[[ALBRefreshControl alloc] initWithFrame:cgRect] autorelease];
            
            [MHTools addreplaceObject:refreshControl key:tag actualUI:refreshControl];
        }
        else
        {
            NSLog(@"ERROR: This tag is already taken, cannot initiate this object (REFRESHCONTROL)");
        }
        
        return tag;
	}
	
	void _beginRefreshing(int tag)
	{
		UIRefreshControl *rc = [MHTools getActualView:tag];
        if(rc)
        {
            [rc beginRefreshing];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	void _endRefreshing(int tag)
	{
		UIRefreshControl *rc = [MHTools getActualView:tag];
        if(rc)
        {
            [rc endRefreshing];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	bool _refreshing(int tag)
	{
		UIRefreshControl *rc = [MHTools getActualObject:tag];
        
        if(rc)
        {
            return rc.refreshing;
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return false;
	}
}