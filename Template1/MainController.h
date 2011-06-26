//
//  MainController.h
//  Template1
//
//  Created by Reetu Raj on 12/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Setting.h"

@interface MainController : UIViewController<UITableViewDelegate,UITableViewDataSource> {
    
    IBOutlet UITableView *MIMtableView;
    IBOutlet UIToolbar *MIMtoolbar;
    IBOutlet UISegmentedControl *MIMsegmentControl;
    IBOutlet UISearchBar *MIMsearchBar;
    IBOutlet UIView *MIMview;

    
    
    //TableView Related
    NSMutableArray *sectionArray;
    NSMutableArray *cellArray;
    NSMutableArray *cellCount;
    
}
@property(nonatomic,retain)IBOutlet UITableView *MIMtableView;
@property(nonatomic,retain)IBOutlet UIToolbar *MIMtoolbar;
@property(nonatomic,retain)IBOutlet UISegmentedControl *MIMsegmentControl;
@property(nonatomic,retain)IBOutlet UISearchBar *MIMsearchBar;
@property(nonatomic,retain)IBOutlet UIView *MIMview;

-(IBAction)savePressed:(id)sender;
-(IBAction)printPressed:(id)sender;
@end
