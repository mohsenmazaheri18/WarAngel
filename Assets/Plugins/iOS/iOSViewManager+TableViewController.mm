//
//  iOSViewManager+TableViewController.m
//  Unity-iPhone
//
//  Created by Patrick Antoine on 5/10/14.
//
//

#import "iOSViewManager+TableViewController.h"
#define CANNOT_FIND_ERROR @"ERROR: Cannot find UITableViewController"

@implementation iOSViewManager (TableViewController)

@end

extern "C"
{
    int _init_tableviewcontroller(int tag)
	{
		if(![MHTools objectExists:tag])
        {
            ALBTableViewController *tableController = [[[ALBTableViewController alloc] init] autorelease];
            
            [MHTools addreplaceObject:tableController key:tag actualUI:tableController];
        }
        else
        {
            NSLog(@"ERROR: This tag is already taken, cannot initiate this object (TABLEVIEWCONTROLLER)");
        }
        return tag;
	}
    
	int _initWithStyle_tableviewcontroller(int tag, int style)
	{
		if(![MHTools objectExists:tag])
        {
            ALBTableViewController *tableController = [[[ALBTableViewController alloc] initWithStyle:(UITableViewStyle)style] autorelease];
            
            [MHTools addreplaceObject:tableController key:tag actualUI:tableController];
        }
        else
        {
            NSLog(@"ERROR: This tag is already taken, cannot initiate this object (TABLEVIEWCONTROLLER)");
        }
        return tag;
	}
	
	int _tableView(int tag)
	{
		UITableViewController *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            return [MHTools getKeyFromActual:tvc.tableView];
        }
        
        NSLog(CANNOT_FIND_ERROR);
		return 0;
	}
	
	void _tableView_set(int tag, int tView)
	{
		UITableViewController *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            tvc.tableView = [MHTools getActualObject:tView];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	bool _clearsSelectionOnViewWillAppear(int tag)
	{
		UITableViewController *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            return tvc.clearsSelectionOnViewWillAppear;
        }
        
        NSLog(CANNOT_FIND_ERROR);
		return false;
	}
	
	void _clearsSelectionOnViewWillAppear_set(int tag, bool clears)
	{
		UITableViewController *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            tvc.clearsSelectionOnViewWillAppear = clears;
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	int _refreshControl(int tag)
	{
		UITableViewController *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            return [MHTools getKeyFromActual:tvc.refreshControl];
        }
        
        NSLog(CANNOT_FIND_ERROR);
		return 0;
	}
	
	void _refreshControl_set(int tag, int rControl)
	{
		UITableViewController *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            tvc.refreshControl = [MHTools getActualObject:rControl];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
}
